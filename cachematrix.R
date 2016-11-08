## Put comments here that give an overall description of what your
## functions do
## Author: Marcone Albuquerque
## Date  : 8th November 2016


# Function   : makeCacheMatrix
# Description: calculates the inverse of a matrix and cache the result
makeCacheMatrix <- function(x = matrix()) {
  message("value of x:")
  print(x)
  
  m <- NULL
  set <- function(y) {
    message("Setting value of y")
    print(y)
    x <<- y*
    m <<- NULL
  }
  get <- function() { 
    message("Getting value of x...")
    print(x)
    x
  }
  setInverse <- function(solve) { 
    message("Setting the value of inverse")
    m <<- solve
    print(m)
  }
  getInverse <- function() { 
     message("Getting the value of m (inverse of the matrix)")
     print(m)
     m
  }
  
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


# Function   : cacheinverse
# Description: 
# get the cached the matrix
cacheinverse <- function(x, ...) {
  m <- x$getInverse()
  if(!is.null(m)) {
    message("\n*** Inverse already calculated. Getting cached data ***\n")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setInverse(m)
  m
}