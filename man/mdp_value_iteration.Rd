\name{mdp_value_iteration}
\alias{mdp_value_iteration}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves discounted MDP using value iteration algorithm
}
\description{
Solves discounted MDP with value iteration algorithm
}
\usage{
mdp_value_iteration(P, R, discount, epsilon, max_iter, V0)
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
For discount equals to 1, a warning recalls to check conditions of convergence.
}
  \item{epsilon}{
 (optional) : search for an epsilon-optimal policy.
epsilon is a real in ]0; 1].
By default, epsilon = 0.01.
}
  \item{max_iter}{
(optional) : maximum number of iterations.
max_iter is an integer greater than 0. If the value given in argument is greater than a computed bound, a warning informs that the computed bound will be considered.
By default, if discount is not egal to 1, a bound for max_iter is computed, if not max_iter = 1000.
}
  \item{V0}{
(optional) : starting value function.
V0 is a (Sx1) vector.
By default, V0 is only composed of 0 elements.
}
}
\details{
mdp_value_iteration applies the value iteration algorithm to solve discounted MDP. The algorithm consists in solving Bellman's equation iteratively. Iterating is stopped when an epsilon-optimal policy is found or after a specified number (max_iter) of iterations.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{policy }{optimal policy.
policy is a S length vector. Each element is an integer corresponding to an action which maximizes the value function.}
 \item{iter }{number of done iterations.}
 \item{cpu_time }{CPU time used to run the program.}
%% ...
}

\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R<- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_value_iteration(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_value_iteration(P, R, 0.9)

}

