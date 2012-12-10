\name{mdp_eval_policy_optimality}
\alias{mdp_eval_policy_optimality}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Computes sets of 'near optimal' actions for each state
}
\description{
Determines sets of 'near optimal' actions for all states
}
\usage{
mdp_eval_policy_optimality(P, R, discount, Vpolicy)
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
  \item{Vpolicy}{
value function of the optimal policy. Vpolicy is a S length vector.
}
}
\details{
For some states, the evaluation of the value function may give close results for different actions. It is interesting to identify those states for which several actions have a value function very close the optimal one (i.e. less than 0.01 different). We called this the search for near optimal actions in each state.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{multiple}{existence of at least two 'nearly' optimal actions for a state.
multiple is egal to true when at least one state has several epsilon-optimal actions, false if not.}
 \item{optimal_actions }{actions 'nearly' optimal for each state. optimal_actions is a [S,A] boolean matrix whose element optimal_actions(s, a) is true if the action a is 'nearly' optimal being in state s and false if not.}
%% ...
}

\examples{
# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
Vpolicy <- c(42.4419, 36.0465)
mdp_eval_policy_optimality(P, R, 0.9, Vpolicy)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_eval_policy_optimality(P, R, 0.9, Vpolicy)

}
