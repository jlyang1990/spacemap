% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/reportPerformance.R
\name{reportPerf}
\alias{reportPerf}
\title{Report performance of x-y or y-y edge detection}
\usage{
reportPerf(fit, truth, YY = TRUE, aszero = 1e-06, verbose = TRUE)
}
\arguments{
\item{fit}{A numeric matrix encoding the fitted model parameter estimates.}

\item{truth}{A numeric matrix encoding the true model parameters.}

\item{YY}{A logical defaulting to TRUE indicating that 
\code{fit} and \code{truth} are  symmetric matrices 
corresponding to estimated and true partial correlations for y-y edges. 
Otherwise, assume \code{fit} and \code{truth} corresponds to the estimated and true
\eqn{\Gamma} regression coefficient matrix for x-y edges.}

\item{aszero}{A numeric value specifying the point at which a parameter estimate should 
be effectively considered of zero value.}

\item{verbose}{A logical value indicating whether to report the performance to the console.}
}
\value{
A numeric, named vector containing
\itemize{
\item power or sensitivity
\item fdr or false discovery rate
\item mcc or Matthew's Correlation Coefficient
\item tp  or true positive
\item fn or false negative
\item fp or false positive
\item tn or true negative
}
}
\description{
Assesses the performance of space and spaceMap
against a known truth by reporting power and false discovery rate
for either x-y OR y-y edge detection.
}
\seealso{
reportJointPerf
}
