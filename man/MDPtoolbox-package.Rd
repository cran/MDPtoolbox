\encoding{UTF-8}

\name{MDPtoolbox-package}
\alias{MDPtoolbox-package}
\alias{MDPtoolbox}
\docType{package}
\title{
Markov Decision Processes toolbox
}
\description{
The Markov Decision Processes (MDP) toolbox proposes functions related to the resolution of discrete-time Markov Decision Processes: finite horizon, value iteration, policy iteration, linear programming algorithms with some variants  and also proposes some functions related to Reinforcement Learning.
}
\details{
\tabular{ll}{
Package: \tab MDPtoolbox\cr
Type: \tab Package\cr
Version: \tab 4.0.2\cr
Date: \tab 2014-07-21\cr
License: \tab BSD (4.4)\cr
}
}
\author{

Iadine Chadès <Iadine.Chades@csiro.au>\cr
Guillaume Chapron <gchapron@carnivoreconservation.org>\cr
Marie-Josée Cros <Marie-Josee.Cros@toulouse.inra.fr>\cr
Fredérick Garcia <fgarcia@toulouse.inra.fr>\cr
Régis Sabbadin <Regis.Sabbadin@toulouse.inra.fr> \cr

}
\references{
Chadès, I., Chapron, G., Cros, M.-J., Garcia, F. & Sabbadin, R. 2014. MDPtoolbox: a multi-platform toolbox to solve stochastic dynamic programming problems. Ecography DOI:10.1111/ecog.00888 \cr
Puterman, M. L. 1994. Markov Decision Processes. John Wiley & Sons, New-York.

}

\examples{
# Generates a random MDP problem
set.seed(0)
mdp_example_rand(2, 2)
mdp_example_rand(2, 2, FALSE)
mdp_example_rand(2, 2, TRUE)
mdp_example_rand(2, 2, FALSE, matrix(c(1,0,1,1),2,2))

# Generates a MDP for a simple forest management problem
MDP <- mdp_example_forest()

# Find an optimal policy
results <- mdp_policy_iteration(MDP$P, MDP$R, 0.9)

# Visualise the policy
results$policy

}
