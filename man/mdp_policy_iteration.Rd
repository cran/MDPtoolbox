\name{mdp_policy_iteration}
\alias{mdp_policy_iteration}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves discounted MDP using policy iteration algorithm
}
\description{
Solves discounted MDP with policy iteration algorithm
}
\usage{
mdp_policy_iteration(P, R, discount, policy0, max_iter, eval_type)
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
  \item{policy0}{(optional) starting policy. policy0 is a S length vector. By default, policy0 is the policy which maximizes the expected immediate reward.
}
  \item{max_iter}{(optional)
maximum number of iterations to be done.
max_iter is an integer greater than 0. 
By default, max_iter is set to 1000.
}
  \item{eval_type}{(optional)
define function used to evaluate a policy.
eval_type is 0 for mdp_eval_policy_matrix use, mdp_eval_policy_iterative is used in all other cases. 
By default, eval_type is set to 0.
}
}
\details{
mdp_policy_iteration applies the policy iteration algorithm to solve discounted MDP. The algorithm consists in improving the policy iteratively, using the evaluation of the current policy. Iterating is stopped when two successive policies are identical or when a specified number (max_iter) of iterations have been performed.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{V}{optimal value fonction. V is a S length vector}
 \item{policy}{optimal policy. policy is a S length vector. Each element is an integer corre-
sponding to an action which maximizes the value function}
 \item{iter}{number of iterations}
  \item{cpu_time}{CPU time used to run the program}
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_policy_iteration(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_policy_iteration(P, R, 0.9)

}

