% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ADPF.R
\name{ADPF}
\alias{ADPF}
\title{Adaptive Degree Polynomial Filter [ADPF]}
\usage{
ADPF(YData, SthDeriv,MaxOrder,FilterLength, DeltaX, WriteFile)
}
\arguments{
\item{YData}{a numeric \code{data.frame}, \code{matrix} or \code{vector} to transform}

\item{SthDeriv}{differentiation order}

\item{MaxOrder}{maximum polynomial order}

\item{FilterLength}{window size (must be odd)}

\item{DeltaX}{optional sampling interval}

\item{WriteFile}{a boolean that writes a \code{data.frame} to the working directory if true}
}
\description{
ADPF outputs a \code{data.frame} containing a column for the original data, the polynomial degree used to smooth it, and the requested derivative(s).
}
\details{
This is a code listing of a smoothing algorithm published in 1995 and written by Phillip Barak. ADPF modifies the Savitzky-Golay algorithm with a statistical heurism that increases signal fidelty while decreasing statisical noise.
Mathematically, it operates simply as a weighted sum over a given window:
\deqn{f_{t}^{n,s}=\sum{_{i=-m}^{m} h_{i}^{n,s,t}y_{i}}}
Where \eqn{h_{i}^{n,s,t}} is the convolution weight of the \eqn{i}th point to the evaluate the \eqn{s}th derivative at point \eqn{t} using a polynomial of degree \eqn{n}
on 2\eqn{m+1} data points, \eqn{y}. These convolution weights \eqn{h} are calculated using Gram polynomials which are optimally selected using a \eqn{F_{chi}} test.
This improves upon the signal fidelity of Savitzky-Golay by optimally choosing the Gram polynomial degree between zero and the max polynomial order give by the user while removing statistical noise.
The sampling interval specified with the \code{DeltaX} argument is used for scaling and get numerically correct derivatives. For more details on the statistical heurism see the Barak, 1995 article. This can be found at http://soils.wisc.edu/facstaff/barak/ under the publications section.
}
\examples{

ADPF::CHROM

smooth<-ADPF(CHROM[,6],0,9,13)
numpoints=length(CHROM[,6])
plot(x=1:numpoints,y=CHROM[,6]);lines(x=1:numpoints, y=smooth[,3])
}
\references{
Barak, P., 1995. Smoothing and Differentiation by and Adaptive-Degree Polynomial filter; Anal. Chem. 67, 2758-2762.

Marchand, P.; Marmet, L. Rev. Sci. Instrum. 1983, 54, 1034-1041.

Greville, T. N. E., Ed. Theory and Applications of Spline Functions; Academic Press: New York, 1969.

Press, W. H.; Flannery, B. P.; Teukolsky, S. A.;Vetterling. W. T. Numerical Recipes; Cambridge University Press: Cambridge U.K., 1986.

Savitzky, A., and Golay, M. J. E., 1964. Smoothing and differentiation of data by simplified least squares procedures. Anal. Chem. 36, 1627-1639.

Macauly, F. R. The Smoothing of Time Series; National Bureau of Economic Research, Inc,: New York, 1931.

Gorry, P. A. Anal. Chem. 1964, 36,1627-1639.

Steiner, J.; Termonia, Y.; Deltour, J. Anal. Chem. 1972, 44. 1906-1909.

Ernst, R. R. Adv. magn. Reson. 1966, 2,1-135.

Gorry P. A. Anal. Chem. 1991, 64, 534-536.

Ratzlaff, K. L.; Johnson, J. T. Adal. Chem. 1989, 61, 1303-1305.

Kuo, J. E.; Wang, H.; Pickup, S. Anal. Chem. 1991, 63,630-645.

Enke, C. G; Nieman, T. A. Anal. Chm 1976, 48, 705A-712A.

Phillips, G. R., Harris, J. M. Anal. Chem. 1990, 62, 2749-2752.

Duran, B.S. Polynomial Regression. In Encyclopedia of the Statistical Sciences, Kotz, S., Johnsonn N. L., Eds.; Wiley: New York, 1986; Vol. 7, pp 700-703.

Bevington, P. R. Data Reduction and Error Analysis for the Physical Sciences; McGraw-Hill Book Co,: New York, 1969; Chapter 10.

Snedecor, G. W.; Cochran, W. G. Statistical Methods, 6th ed.; Iowa State University Press: Ames, IA, 1967; Chapter 15.

Hanning, R. W. Digital Filters, 2nd ed.; Prentice-Hall: Englewood Cliffs, NJ, 1983; Chapter 3.

Ralston, A. A First Course in Numerical Analysis McGraw-Hill: New York, 1965; Chapter 6.

Robert De Levie. 2008. Advanced Excel for Scientific data analysis. 2nd edn. Chapter 3.15 Least squares for equidistant data. Oxford Univ. Press, New York, NY.

Wentzell, P. D., and Brown, C. D., 2000. Signal processing in analytical chemistry. Encyclopedia of Analytical Chemistry, 9764-9800.
}
\author{
Phillip Barak

Samuel Kruse
}
