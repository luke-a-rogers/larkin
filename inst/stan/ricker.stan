data {
  // Constants
  int<lower=1> T; // Number of brood years
  // Observations
  real<lower=0> recruits[T]; // Recruitment abundance
  real<lower=0> spawners[T]; // Spawner abundance
  // Prior means
  real mu_alpha;
  real mu_beta;
  real mu_sigma;
  // Prior standard deviations
  real<lower=0> sd_alpha;
  real<lower=0> sd_beta;
  real<lower=0> sd_sigma;
  // Fudge factors
  real<lower=0> fudge;
}

transformed data {
  // Response variable: log recruits per spawner
  real y[T];
  for (t in 1:T) {
    y[t] = log((recruits[t] + fudge) / (spawners[t] + fudge));
  }
}

parameters {
  // Demographic rates
  real alpha; // Per-captica population growth rate at low abundance
  real<lower=0> beta; // Density dependent mortality parameters
  // Process error
  real<lower=0> sigma;
}

model {
  // Predicted response
  real y_hat[T];
  for (t in 1:T) {
    y_hat[t] = alpha - beta * spawners[t];
  }
  // Priors
  alpha ~ normal(mu_alpha, sd_alpha);
  beta ~ normal(mu_beta, sd_beta);
  sigma ~ normal(mu_sigma, sd_sigma);
  // Sampling statement
  y ~ normal(y_hat, sigma);
}
