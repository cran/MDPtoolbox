\name{mdp_eval_policy_matrix}
\alias{mdp_eval_policy_matrix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Evaluates a policy using matrix inversion and product
}
\description{
Evaluates a policy using matrix operation
}
\usage{
mdp_eval_policy_matrix(P, R, discount, policy)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].
}
  \item{R}{
reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S] or a 2 dimensional matrix [S,A] possibly sparse.
}
  \item{discount}{
discount factor. discount is a real number which belongs to [0; 1[.
}
  \item{policy}{
a policy. policy is a S length vector. Each element is an integer corresponding
to an action.}
}
\details{
mdp_eval_policy_matrix evaluates the value fonction associated with a policy
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{Vpolicy }{value fonction. Vpolicy is a S length vector}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_eval_policy_matrix(P, R, 0.9, c(1,2))

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_eval_policy_matrix(P, R, 0.9, c(1,2))

}

