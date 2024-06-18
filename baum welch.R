# Forward Algorithm
forward <- function(Y, A, B, initial_distribution) {
  a <- matrix(A)
  b <- matrix(B)
  alpha <- matrix(nrow = length(Y), ncol = nrow(a))
  alpha[1,] <- initial_distribution * b[Y[1],]
  for (t in 2:length(Y)) {
    alpha[t,] <- alpha[t-1,] %*% a * b[Y[t],]
  }
  return(alpha)
}

# Backward Algorithm
backward <- function (Y, A, B) {
  a <- matrix(A)
  b <- matrix(B)
  beta <- matrix(1, nrow = length(Y), ncol = nrow(a))
  for (t in (length(Y)-1):1) {
    for (i in 1:nrow(a)) {
      beta[t,i] <- sum(a[i,] * b[Y[t+1],] * beta[t+1,])
    }
  }
  return(beta)
}

# Baum-welch Algorithm
baum_welch <- function (Y, A, B, initial_distribution, n_iter) {
  a <- matrix(A, nrow = 2) # Ensure the matrix has 2 rows
  b <- matrix(B, nrow = 2) # Ensure the matrix has 2 rows
  print("old Pi (Initial Distribution):")
  print(initial_distribution)
  print("old A (Transition Matrix):")
  print(a)
  print("old B (Emission Matrix):")
  print(b)
}
print("old B (Emission Matrix):")
print(b)
for (iter in 1:n_iter) {
  alpha <- forward(Y, a, b, initial_distribution)
  beta <- backward(Y, a, b)
  xi <- array(0, dim = c(length(Y) - 1, nrow(a), nrow(a)))
  gamma <- matrix(0, nrow = length(Y), ncol = nrow(a))
  for (t in 1:(length(Y) - 1)) {
    for (i in 1:nrow(a)) {
      for (j in 1:nrow(a)) {
        xi[t, i, j] <- alpha[t, i] * a[i, j] * b[Y[t + 1], j] * beta[t + 1, j]
      }
    }
    gamma[t, i] <- sum(xi[t, i, ])
  }
  gamma <- rbind(gamma, sum(xi[length(Y) - 1,, ]))
  initial_distribution <- gamma[1, ] / sum(gamma[1, ])
  for (i in 1:nrow(a)) {
    for (j in 1:nrow(a)) {
      a[i, j] <- sum(xi[, i, j]) / sum(gamma[, i])
    }
    for (k in 1:max(Y)) {
      b[i, k] <- sum(gamma[Y == k, i]) / sum(gamma[, i])
    }
  }
}
print("Updated Pi (Initial Distribution):")
print(initial_distribution)
print("Updated A (Transition Matrix): ")
print(a)
print("Updated B (Emission Matrix):")
print(b)
return(list(a = a, b = b, initial_distribution = initial_distribution))