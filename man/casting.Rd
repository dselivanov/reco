% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods.R
\name{casting}
\alias{casting}
\alias{as.csr.matrix}
\alias{as.csc.matrix}
\alias{as.coo.matrix}
\title{Conversions between matrix types}
\usage{
as.csr.matrix(x, binary = FALSE)

as.csc.matrix(x, binary = FALSE)

as.coo.matrix(x, binary = FALSE)
}
\arguments{
\item{x}{A matrix which is to be converted to a different format.}

\item{binary}{Whether the result should be a binary-only matrix (inheriting from
class `nsparseMatrix` - these don't have slot `x`).
Supported input types are:\itemize{
\item Sparse matrices from `Matrix` package, in any format.
\item Sparse vector from `Matrix` (class `dsparseVector`).
\item Dense matrix from base R.
\item Dense vector from base R (classes `numeric` and `integer`).
\item Dense matrix or vector from package `float` (class `float32`).
\item `data.frame` and `data.table`.
}}
}
\value{
A sparse matrix, with format:\itemize{
\item CSR (a.k.a. `RsparseMatrix`) when calling `as.csr.matrix`
(class `dgRMatrix` with `binary=FALSE`, class `ngRMatrix` with `binary=TRUE`).
\item CSC (a.k.a. `CsparseMatrix`) when calling `as.csc.matrix`
(class `dgCMatrix` with `binary=FALSE`, class `ngCMatrix` with `binary=TRUE`).
\item COO (a.k.a. `TsparseMatrix`) when calling `as.coo.matrix`
(class `dgTMatrix` with `binary=FALSE`, class `ngTMatrix` with `binary=TRUE`).
}
}
\description{
Convenience functions for converting to different sparse matrix formats.
}
\details{
The functions internally use as(x, "?sparseMatrix"), so they might work
with other object classes if they register a conversion method for `Matrix` base
types.

When passed a vector, the functions `as.csr.matrix` and `as.coo.matrix` will
assume that it is a row vector, while `as.csc.matrix` will assume it's a column vector.
}
\examples{
library(Matrix)
library(rsparse)

m.coo = as(matrix(1:3), "TsparseMatrix")
as.csr.matrix(m.coo)
as.csr.matrix(1:3) # <- assumes it's a row vector
as.csc.matrix(1:3) # <- assumes it's a column vector

library(float)
m.f32 = float::fl(matrix(1:10, nrow=5))
as.csr.matrix(m.f32)

library(data.table)
as.coo.matrix(data.table(col1=1:3))
}
