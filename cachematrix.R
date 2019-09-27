## Put comments here that give an overall description of what your
## functions do


#The following functions are used to create a special object that stores
#a matrix and caches its inverse. The first function, makeCacheMatrix creates
#a special "matrix", which is really a list containing a function to:
  
#set the value of the matrix
#get the value of the matrix
#set the value of the inverse
#get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set,
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
matriz1 <- matrix(c(3,4,5,6),2,2)
invertir <-   makeCacheMatrix(matriz1)


#This function computes the inverse of the special "matrix" returned by makeCacheMatrix above
#..

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting the data catched")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinverse(i)
  i
}
cacheSolve(invertir)
