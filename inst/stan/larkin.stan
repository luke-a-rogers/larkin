data {
  // Constants
  int<lower=0> T; // Number of brood years
  // Observations
  real R[T]; // Array of recruit abundance
  real S[T]; // Array of spawner abundance
  // Prior parameters
  real mu_a;
  real sd_a;
  real<lower=0> min_b[4];
  real<lower=0> max_b[4];
}

transformed data {
  real R_fudge[T];
  for (t in 1:T) {
    R_fudge[t] = R[t] + 1e-6;
  }
}

parameters {
  real a; // Per-capita log population growth rate at low abundance
  real<lower=0> b[4]; // Density dependence parameters
  real<lower=0> sigma; // Process error standard deviation
}

model {
  real log_R_hat;
  for (t in 4:T) {
    // Compute log predicted recruits
    log_R_hat = log(S[t])
    + a
    - b[1] * S[t]
    - b[2] * S[t - 1]
    - b[3] * S[t - 2]
    - b[4] * S[t - 3];
    // Define sampling statement
    R_fudge[t] ~ lognormal(log_R_hat, sigma);
  }
  // Define priors
  a ~ normal(mu_a, sd_a);
  b ~ uniform(min_b, max_b);
}
