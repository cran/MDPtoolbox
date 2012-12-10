\name{mdp_eval_policy_iterative}
\alias{mdp_eval_policy_iterative}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Evaluates a policy using an iterative method
}
\description{
Evaluates a policy using iterations of the Bellman operator
}
\usage{
mdp_eval_policy_iterative(P, R, discount, policy, V0, epsilon, max_iter)
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
to an action.
}
  \item{V0}{
(optional) starting point. V0 is a S length vector representing an inital guess of the value function. By default, V0 is only composed of 0 elements.
}
  \item{epsilon}{
(optional) search for an epsilon-optimal policy. epsilon is a real greater than 0. By default, epsilon = 0.01.
}
  \item{max_iter}{
(optional) maximum number of iterations. max_iter is an integer greater than 0. If the value given in argument is greater than a computed bound, a warning informs that the computed bound will be used instead. By default, max_iter = 1000.
}
}
\details{
mdp_eval_policy_iterative evaluates the value fonction associated to a policy applying iteratively the Bellman operator.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
\item{Vpolicy}{value fonction. Vpolicy is a S length vector.}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
policy <- c(2,1)
mdp_eval_policy_iterative(P, R, 0.8, policy)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_eval_policy_iterative(P, R, 0.8, policy)

}

