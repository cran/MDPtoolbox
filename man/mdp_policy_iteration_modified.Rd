\name{mdp_policy_iteration_modified}
\alias{mdp_policy_iteration_modified}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves discounted MDP using modified policy iteration algorithm
}
\description{
Solves discounted MDP using modified policy iteration algorithm
}
\usage{
mdp_policy_iteration_modified(P, R, discount, epsilon, max_iter)
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
discount factor. discount is a real number which belongs to [0; 1[. For discount equals to 1, a warning recalls to check conditions of convergence.
}
  \item{epsilon}{(optional)
search for an epsilon-optimal policy. epsilon is a real in ]0; 1]. By default, epsilon = 0.01.
}
  \item{max_iter}{(optional)
maximum number of iterations to be done. max_iter is an integer greater than 0. By default, max_iter = 1000.
}
}
\details{
mdp_policy_iteration_modified applies the modified policy iteration algorithm to solve discounted MDP. The algorithm consists, like policy iteration one, in improving the policy iteratively but in policy evaluation few iterations (max_iter) of value function updates done. Iterating is stopped when an epsilon-optimal policy is found.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{V }{optimal value fonction. V is a S length vector}
 \item{policy }{optimal policy. policy is a S length vector. Each element is an integer corresponding to an action which maximizes the value function.}
 \item{iter }{number of iterations}
  \item{cpu_time }{CPU time used to run the program}

%% ...
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R<- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_policy_iteration_modified(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_policy_iteration_modified(P, R, 0.9)

}

