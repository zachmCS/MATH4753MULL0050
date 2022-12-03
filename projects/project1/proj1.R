# mu = np
# sig^2 = npq
# given p, 

ntickets <- function(N, gamma, p)
{
  list <- qbinom(1-gamma, N:(N+N/10), p) # Change to N:N+20
  #list <- qbinom(1-0.02, 200:210, 0.95) # Change to N:N+20
  ctr = 0
  
  for (x in list){
    if (x == N){
      nd = x + ctr
      break
    }
    ctr=ctr+1
  }
  mu = nd * p
  print(nd)
  sig = sqrt(mu*(1-p))
  
  #1 -pnorm(0.02, mu, sig)
  #N+0.5 = qnorm(1-0.02, mu, sig) N = 200, output = 200.1931
  plot(N:(N+N/10), 1 - pbinom(N, N:(N+N/10), p)-gamma, type = "o", pch = 19, col = "blue", xlab = "N", ylab = "ObjectiveDiscrete") # discrete plot
  abline(h=0, v=nd+1)
  list <- qnorm(1-gamma, seq(nd, nd+1, by=0.001)*p, sqrt(seq(nd, nd+1, by=0.001)*p*(1-p))) # Find N + 0.5 = qnorm
  # After finding, we know the approximation is n + num_sequences. 
  # CHANGE 204, 205 to n, n+1
  ctr = 1
  tmp =1
  
  for(num in list){

    if (num > (N+0.5)){ # CHANGE 200 to N
      nc = (tmp * 0.001) + nd
      break
    }
    tmp = tmp+1
  }
  plot(seq(N,floor(N+(N/10)), by=0.001),pnorm(seq(N,floor(N+(N/10)), by=0.001), floor((N+(N/10)+N)/2), sig) - gamma,type='S',col = "red", xlab = "n", ylab = "ObjectiveCont") # cont plot
  abline(v=nc, h=0, col='Blue')
  print(list("N":N, "nc":nc, "nd":nd, "gamma":gamma, "Pr"=p))
}


ntickets(N=400, gamma=0.02, p=0.95)

