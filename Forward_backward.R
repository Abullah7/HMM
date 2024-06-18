# Function to perform the forward algorithm
forward_algorithm <- function(observations, states, start_prob, transition_prob, emission_prob) {
  
  num_states <- length(states)
  num_obs <- length (observations)
  
  # Initialize the forward probabilities matrix
  forward <- matrix (0, nrow = num_states, ncol = num_obs)
  
  # Initialization: Compute forward probabilities for the first observation
  for (i in 1:num_states) {
    forward [i, 1] <- start_prob[i] * emission_prob [i, observations [1]]
  }
  
  # Recursion: Compute forward probabilities for subsequent observations
  for (t in 2:num_obs) {
    for (jin 1:num_states) {
      forward[j, t] <- sum (forward[, t-1] * transition_prob[, j] * emission_prob [j, observations [t]])
    }
  }
  
  # Termination: Compute the likelihood of the sequence
  likelihood <- sum(forward[, num_obs])
  
  return(list("forward_probabilities" = forward, "likelihood" = likelihood))
}
backward_algorithm <- function(observations, states, transition_prob, emission_prob) {
  num_states <- length(states)
  num_obs <- length(observations)
  backward <- matrix(0, nrow = num_states, ncol = num_obs)
  backward[ , num_obs] <- 1

  for (t in (num_obs - 1):1){
    for (i in 1:num_states) {
      backward[i, t] <- sum(backward[, t + 1] * transition_prob[i, ] * emission_prob[, observations[t + 1]])
    }
  }

  return(backward)
}
# Example HMM parameters (use the same as in the forward algorithm)
states <- c("Sunny", "Rainy")
observations <- c(1, 2, 1) # observation sequence
transition_prob <- matrix (c(0.7, 0.3, 0.4, 0.6), nrow = 2, byrow = TRUE) # Transition matrix
emission_prob <- matrix (c(0.1, 0.9, 0.8, 0.2), nrow = 2, byrow = TRUE) # Emission matrix

# Run the backward algorithm
backward_result <- backward_algorithm (observations, states, transition_prob, emission_prob)

# Display the backward probabilities matrix
print("Backward Probabilities:")
print (backward_result)