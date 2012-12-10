\name{mdp_LP}
\alias{mdp_LP}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves discounted MDP using linear programming algorithm
}
\description{
Solves discounted MDP with linear programming
}
\usage{
mdp_LP(P, R, discount)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{P}{
transition probability array. P is a 3 dimensions array [S,S,A]. Sparse matrix are not supported.
}
  \item{R}{
reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S] or a 2 dimensional matrix [S,A] possibly sparse.
}
  \item{discount}{
discount factor. discount is a real which belongs to ]0; 1[
}
}
\details{
mdp_LP applies linear programming to solve discounted MDP for non-sparse matrix only.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{V}{optimal value fonction. V is a S length vector}
  \item{policy }{optimal policy. policy is a S length vector. Each element is an integer corresponding to an action which maximizes the value function}
  \item{cpu_time}{CPU time used to run the program}
%% ...
}

\examples{
# Only with a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_LP(P, R, 0.9)
}

