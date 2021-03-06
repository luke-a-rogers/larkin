% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{sim}
\alias{sim}
\title{Simulate Sockeye Dynamics From A Larkin Stock-Recruitment Model}
\usage{
sim(
  alpha = 2,
  beta = c(-8, -6, -4, -2),
  init = rep(0.1, 8),
  p_bar = c(0.003, 0.917, 0.08),
  phi = 0,
  sigma = 0.1,
  burn = 100,
  span = 100,
  lrp = 0,
  usr = 0,
  h_min = 0,
  h_max = 0.2,
  gamma = NULL,
  environs = NULL,
  extirp = 1e-06
)
}
\arguments{
\item{alpha}{\code{\link[=numeric]{numeric()}} per-capita log population growth rate at low
spawner abundance}

\item{beta}{\code{\link[=numeric]{numeric()}} \code{\link[=vector]{vector()}} density dependence parameters}

\item{init}{\code{\link[=numeric]{numeric()}} \code{\link[=vector]{vector()}} initial spawner abundances}

\item{p_bar}{\code{\link[=numeric]{numeric()}} \code{\link[=vector]{vector()}} mean age at maturity proportions}

\item{phi}{\code{\link[=numeric]{numeric()}} process error autocorrelation parameter}

\item{sigma}{\code{\link[=numeric]{numeric()}} process error standard deviation parameter}

\item{burn}{\code{\link[=integer]{integer()}} number of burn-in steps before the simulation}

\item{span}{\code{\link[=integer]{integer()}} number of steps in the simulation}

\item{lrp}{\code{\link[=numeric]{numeric()}} limit reference point}

\item{usr}{\code{\link[=numeric]{numeric()}} upper stock reference}

\item{h_min}{\code{\link[=numeric]{numeric()}} harvest rate in the critical zone}

\item{h_max}{\code{\link[=numeric]{numeric()}} harvest rate in the healthy zone}

\item{gamma}{\code{\link[=numeric]{numeric()}} environmental variable influence parameter}

\item{environs}{\code{\link[tibble:tibble]{tibble::tibble()}} environmental variables}

\item{extirp}{\code{\link[=numeric]{numeric()}} extirpation threshold}
}
\value{
\code{\link[=data.frame]{data.frame()}} simulated spawner and recruitment at age abundances
}
\description{
Simulate Sockeye Dynamics From A Larkin Stock-Recruitment Model
}
\examples{
s1 <- sim()

environs <- simulate_environmental_covariates(100, rep(0, 3), 0.5, 1)
s2 <- sim(gamma = rep(0.5, 3), environs = environs)

}
