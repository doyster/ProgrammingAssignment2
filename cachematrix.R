## The following functions demonstrates the capability 
## of R to cache data and save you processing time
## 
## You will be able to create an object that will cache 
## a matrix calculate the inverse. By using the functions of 
## the object you will be able to set and retrieve the cached data.

## This function will create a cachedmatrix object that will cache a matrix and it's inverse
## The object will include the following functions
## set - this function will set the matrix
## get - this function will return the cached matrix
## setinverse - this function will set the inversed matrix
## getinverse - this function will return the cached inversed matrix
makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## This function will set/get the inverse of the matrix cached in the cachedmatrix object
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m

}
