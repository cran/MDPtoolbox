\name{mdp_check}
\alias{mdp_check}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checks the validity of a MDP
}
\description{
Checks the validity of a MDP
}
\usage{
mdp_check(P, R)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].
}
  \item{R}{
reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S] or a 2 dimensional matrix [S,A] possibly sparse.
}
}
\details{
mdp_check checks whether the MDP defined by the transition probability array (P) and the reward matrix (R) is valid. If P and R are correct, the function returns an empty error message. In the opposite case, the function returns an error message describing the problem.
}
\value{
Returns a character string which is empty if the MDP is valid. In the opposite case, the variable contains problem information
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_check(P, R)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_check(P, R)
}

