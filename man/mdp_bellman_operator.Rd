\name{mdp_bellman_operator}
\alias{mdp_bellman_operator}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Applies the Bellman operator
}
\description{
Applies the Bellman operator to a value function Vprev and returns a new value function and a Vprev-improving policy.
}
\usage{
mdp_bellman_operator(P, PR, discount, Vprev)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].
}
  \item{PR}{
reward array. PR can be a 2 dimension array [S,A] possibly sparse.
}
  \item{discount}{
discount factor. discount is a real number belonging to ]0; 1].
}
  \item{Vprev}{
value fonction. Vprev is a vector of length S.
}
}
\details{
mdp_bellman_operator applies the Bellman operator: PR + discount*P*Vprev to the value function Vprev. Returns a new value function and a Vprev-improving policy.
}
\value{

\item{V}{new value fonction. V is a vector of length S.}
\item{policy}{policy is a vector of length S. Each element is an integer corresponding to an action.}

}

\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_bellman_operator(P, R, 0.9, c(0,0))

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_bellman_operator(P, R, 0.9, c(0,0))

}

