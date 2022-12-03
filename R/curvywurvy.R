#' Sample Generator
#'
#' @param mu the mean
#' @param sigma stdev
#'
#' @return There is no return but through plot output.
#' @export
myncurve = function(mu, sigma){
  curve(dnorm(x,mean=mu,sd=sigma), xlim = c(mu-3*sigma, mu +
                                              3*sigma))
}
