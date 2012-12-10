\name{mdp_example_rand}
\alias{mdp_example_rand}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates a random MDP problem
}
\description{
Generates a random MDP problem
}
\usage{
mdp_example_rand(S, A, is_sparse, mask)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{S}{
number of states. S is an integer greater than 0
}
  \item{A}{
number of actions. A is an integer greater than 0
}
  \item{is_sparse}{
(optional) used to generate sparse matrices. is_sparse is a boolean. If it is set to true, sparse matrices are generated. By default, it is set to false.
}
  \item{mask}{
(optional) indicates the possible transitions between states. mask is a [S,S] ma- trix composed of 0 and 1 elements (0 indicates a transition probability always equal to zero). By default, mask is only composed of 1.
}
}
\details{
mdp_example_rand generates a transition probability matrix (P) and a reward matrix (R). Optional arguments allow to define sparse matrices and pairs of states with impossible transitions.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
  \item{P}{transition probability array. P can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S].}
 \item{R }{reward array. R can be a 3 dimensions array [S,S,A] or a list [[A]], each element containing a sparse matrix [S,S]. Elements of R are in ]-1; 1[}
%% ...
}

\examples{
mdp_example_rand(2, 2)
mdp_example_rand(2, 2, FALSE)
mdp_example_rand(2, 2, TRUE)
mdp_example_rand(2, 2, FALSE, matrix(c(1,0,1,1),2,2))

}
