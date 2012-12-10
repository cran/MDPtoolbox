\name{mdp_finite_horizon}
\alias{mdp_finite_horizon}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Solves finite-horizon MDP using backwards induction algorithm
}
\description{
Solves finite-horizon MDP with backwards induction algorithm
}
\usage{
mdp_finite_horizon(P, R, discount, N, h)
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
  \item{N}{
number of stages. N is an integer greater than 0.
}
  \item{h}{(optional) terminal reward. h is a S length vector. By default, h = numeric(S).
}
}
\details{
mdp_finite_horizon applies backwards induction algorithm for finite-horizon MDP. The optimality equations allow to recursively evaluate function values starting from the terminal stage. This function uses verbose and silent modes. In verbose mode, the function displays the current stage and the corresponding optimal policy.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{V}{value fonction. V is a [S,(N+1)] matrix. Each column n is the optimal value fonction at stage n, with n = 1, ... N. V[,N+1] is the terminal reward.}
  \item{policy}{optimal policy. policy is a [S,N] matrix. Each element is an integer correspond- ing to an action and each column n is the optimal policy at stage n.}
  \item{cpu_time}{CPU time used to run the program}
%% ...
}

\examples{

# With a non-sparse matrix
P <- array(0, c(2,2,2))
P[,,1] <- matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE)
P[,,2] <- matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE)
R <- matrix(c(5, 10, -1, 2), 2, 2, byrow=TRUE)
mdp_finite_horizon(P, R, 0.9, 3)

# With a sparse matrix
P <- list()
P[[1]] <- Matrix(c(0.5, 0.5, 0.8, 0.2), 2, 2, byrow=TRUE, sparse=TRUE)
P[[2]] <- Matrix(c(0, 1, 0.1, 0.9), 2, 2, byrow=TRUE, sparse=TRUE)
mdp_finite_horizon(P, R, 0.9, 3)
}

