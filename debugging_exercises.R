#debugging exercises
message(log(-1))

message <- function(x) {
  if(x > 0)
    print("Hello")
  else
    print("Goodbye")    
}

#doesn't work
x <- log(-1)
message(x)

#works
x1 <- 4
message(x1)

message(log(-1))

##set up estimating a normal mean by minimizing sum of squared differences
SS <- function(mu, x){
  d <- x - mu
  d2 <- d^2
  hist(d2)
  ss <- sum(d2)
  ss
}

set.seed(100)
x <- rnorm(100)
SS(1, x)
debug(SS)


SS(2, x)


SS2 <- function(mu, x){
  d <- x - mu
  d2 <- d^2
  browser()
  hist(d2)
  ss <- sum(d2)
  ss
}

SS(2, x)


###inserting code with trace
set.seed(100)
p <- sort(runif(200))
thin <- rbinom(200, 1, p)
pp <- p[thin == 1]
hist(pp, nclass = 20)

nLL <- function(mu, x) {
  z <- mu * x
  lz <- log(z)
  {
    if(any(is.nan(lz))) {
      browser()
    }
    L1 <- sum(lz)
  }
  L2 <- mu/2
  LL <- -(L1-L2)
  LL
}

optim(100000, nLL, method = "BFGS", x = pp)
z <-4
lz <- log(z)
trace("nLL", quote(if(any(is.nan(lz))) { browser() }), at = 4, print = F )



as.list(body(nLL))
as.list(body(h))

f <- function(x) {
  r <- x-g(x)
  r
}

g <- function(y) {
  r <- y-h(y)
  r
}

h <- function(z) {
  r <- log(z)
  if (r < 10)
    r^2
  else r^3
}

as.list(body(h))

trace("h", quote( if(is.nan(r)) { recover() }), at = 3, print = F)
f(23)
f(-10)
g(x)



