\name{mdp_value_iteration_bound_iter}
\alias{mdp_value_iteration_bound_iter}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes a bound for the number of iterations for the value iteration algorithm
}
\description{
Computes a bound on the number of iterations for the value iteration algorithm
}
\usage{
mdp_value_iteration_bound_iter(P, R, discount, epsilon, V0)
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
discount factor.
discount is a real which belongs to ]0; 1[.
}
  \item{epsilon}{
(optional) : search for an epsilon-optimal policy
epsilon is a real in ]0; 1]. 
By default, epsilon is set to 0.01.
}
  \item{V0}{
(optional) : starting value function.
V0 is a S length vector.
By default, V0 is only composed of 0 elements.
}
}
\details{
mdp_value_iteration_bound_iter computes a bound on the number of iterations for the value iteration algorithm to find an epsilon-optimal policy with use of span for the stopping criterion.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{max_iter }{maximum number of iterations to be done.
max_iter is an integer greater than 0.}
  \item{cpu_time }{CPU time used to run the program.}
%% ...
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_value_iteration_bound_iter(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_value_iteration_bound_iter(P, R, 0.9)

}

