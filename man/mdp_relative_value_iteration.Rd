\name{mdp_relative_value_iteration}
\alias{mdp_relative_value_iteration}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves MDP with average reward using relative value iteration algorithm
}
\description{
Solves MDP with average reward using relative value iteration algorithm
}
\usage{
mdp_relative_value_iteration(P, R, epsilon, max_iter)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].
}
  \item{R}{
reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S] or a 2 dimensional matrix [S,A] possibly sparse.
}
  \item{epsilon}{
(optional) : search for an epsilon-optimal policy.
epsilon is a real in [0; 1]. 
By default, epsilon is set to 0.01
}
  \item{max_iter}{
(optional) : maximum number of iterations.
max_iter is an integer greater than 0. 
By default, max_iter is set to 1000.
}
}
\details{
mdp_relative_value_iteration applies the relative value iteration algorithm to solve MDP with average reward. The algorithm consists in solving optimality equations iteratively. Iterating is stopped when an epsilon-optimal policy is found or after a specified number (max_iter) of iterations is done.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{policy }{optimal policy. policy is a S length vector. Each element is an integer corresponding to an action which maximizes the value function.}
  \item{average_reward }{average reward of the optimal policy. average_reward is a real.}
\item{cpu_time }{CPU time used to run the program}
%% ...
}


\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_relative_value_iteration(P, R)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_relative_value_iteration(P, R)

}

