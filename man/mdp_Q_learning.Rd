\name{mdp_Q_learning}
\alias{mdp_Q_learning}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves discounted MDP using the Q-learning algorithm (Reinforcement Learning)
}
\description{
Solves discounted MDP with the Q-learning algorithm (Reinforcement learning)
}
\usage{
mdp_Q_learning(P, R, discount, N)
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
discount is a real which belongs to ]0; 1[
}
  \item{N}{
(optional) : number of iterations to perform.
N is an integer that must be greater than the default value.
By default, N is set to 10000.
}
}
\details{
mdp_Q_learning computes the Q matrix, the mean discrepancy and gives the optimal value function and the optimal policy when allocated enough iterations. It uses an iterative method.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{Q }{an action-value function that gives the expected utility of taking a given action in a given state and following an optimal policy thereafter. Q is a [S,A] matrix.}
  \item{mean_discrepancy }{discrepancy means over 100 iterations. mean_discrepancy is a vector of V discrepancy mean over 100 iterations. Then the length of the vector for the default value of N is 100.}
  \item{V }{value function. V is a S length vector.}
  \item{policy }{policy. policy is a S length vector. Each element is an integer corresponding to an action which maximizes the value function}
%% ...
}


\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_Q_learning(P, R, 0.9)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_Q_learning(P, R, 0.9)

}

