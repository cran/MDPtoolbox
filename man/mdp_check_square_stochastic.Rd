\name{mdp_check_square_stochastic}
\alias{mdp_check_square_stochastic}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Checks if a matrix is square and stochastic
}
\description{
Checks whether a matrix is square and stochastic
}
\usage{
mdp_check_square_stochastic(X)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{a matrix}
}
\details{
mdp_check_square_stochastic checks if the matrix (X) is square and stochastic (sums of rows equal to 1).
If it is the case, the function returns an empty error message. In the opposite case, the function returns an error message describing the problem.
}
\value{
Returns a character string which is empty if the matrix is square and stochastic. In the opposite case, the variable contains problem information.
}

\examples{
M <- matrix(c(0.6116, 0.3884, 0, 1.0000), 2, 2, byrow=TRUE)

mdp_check_square_stochastic(M)
}

