\name{mdp_example_forest}
\alias{mdp_example_forest}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Generates a MDP for a simple forest management problem
}
\description{
Generates a simple MDP example of forest management problem
}
\usage{
mdp_example_forest(S, r1, r2, p)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{S}{
(optional) number of states. S is an integer greater than 0. By default, S is set to 3.
}
  \item{r1}{
(optional) reward when forest is in the oldest state and action Wait is performed. r1 is a real greater than 0. By default, r1 is set to 4.
}
  \item{r2}{
(optional) reward when forest is in the oldest state and action Cut is performed
r2 is a real greater than 0. By default, r2 is set to 2.
}
  \item{p}{
(optional) probability of wildfire occurence. p is a real in ]0, 1[. By default, p is set to 0.1.
}
}
\details{
mdp_example_forest generates a transition probability (SxSxA) array P and a reward (SxA) matrix R that model the following problem.
A forest is managed by two actions: Wait and Cut.
An action is decided each year with first the objective to maintain an old forest for wildlife and second to make money selling cut wood. 
Each year there is a probability p that a fire burns the forest.

Here is the modelisation of this problem.
Let {1, ... S} be the states of the forest. the Sth state being the oldest.
Let Wait be action 1 and Cut action 2.
After a fire, the forest is in the youngest state, that is state 1.

The transition matrix P of the problem can then be defined as follows:

\deqn{ P(,,1) = \left[
					\begin{array}{llllll}
					p & 1-p & 0 & \ldots & \ldots & 0 \\
					p & 1-p & 0 & \ldots & \ldots & 0 \\
					\vdots & \vdots & \vdots & \ddots & \ddots & \vdots \\
					\vdots & \vdots & \vdots & \ddots & \ddots & 0 \\
					\vdots & \vdots & \vdots & \ddots & \ddots & 1-p \\
					p & 0 & 0 & \ldots & 0 & 1-p \\
					\end{array}
				\right] }{ (non-Latex version) }

\deqn{ P(,,2) = \left[
					\begin{array}{lllll}
					1 & 0 & \ldots & \ldots & 0 \\
					\vdots & \vdots & \ddots & \ddots & \vdots \\
					\vdots & \vdots & \ddots & \ddots & \vdots \\
					1 & 0 & \ldots & \ldots & 0 \\
					\end{array}
				\right] }{ (non-Latex version) }

The reward matrix R is defined as follows:

\deqn{ R(,1) = \left[
					\begin{array}{l}
					0 \\
					\vdots \\
					\vdots \\
					\vdots \\
					0 \\
					r1 \\
					\end{array}
				\right] }{ (non-Latex version) }

\deqn{ R(,2) = \left[
					\begin{array}{l}
					0 \\
					1 \\
					\vdots \\
					\vdots \\
					1 \\
					r2 \\
					\end{array}
				\right] }{ (non-Latex version) }

}
\value{

\item{P}{transition probability array. P is a [S,S,A] array.}
\item{R}{reward matrix. R is a [S,A] matrix}

}

\examples{
mdp_example_forest()
}

