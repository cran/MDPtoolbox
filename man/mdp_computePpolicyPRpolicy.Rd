\name{mdp_computePpolicyPRpolicy}
\alias{mdp_computePpolicyPRpolicy}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes the transition matrix and the reward matrix for a fixed policy
}
\description{
Computes the transition matrix and the reward matrix for a given policy.
}
\usage{
mdp_computePpolicyPRpolicy(P, R, policy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].
}
  \item{R}{
reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S] or a 2 dimensional matrix [S,A] possibly sparse.
}
  \item{policy}{
a policy. policy is a length S vector of integer representing actions.
}
}
\details{
mdp_computePpolicyPRpolicy computes the state transition matrix and the reward matrix of a policy, given a probability matrix P and a reward matrix.
}
\value{
\item{Ppolicy}{transition probability array of the policy. Ppolicy is a [S,S] matrix.}
\item{PRpolicy}{reward matrix of the policy. PRpolicy is a vector of length S.}

}

\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE)
R <- array(0, c(2,2,2))
R[,,1] <- matrix(c(-0.2433, 0.7073, 0, 0.1871), 2, 2, byrow=TRUE)
R[,,2] <- matrix(c(-0.0069, 0.6433, 0, 0.2898), 2, 2, byrow=TRUE)
policy <- c(2,2)
mdp_computePpolicyPRpolicy(P, R, policy)

# With a sparse matrix (P)
P <- list()
P[[1]] <- Matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0.6674, 0.3326, 0, 1.0000), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_computePpolicyPRpolicy(P, R, policy)
}

