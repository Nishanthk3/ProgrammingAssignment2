# Below are two functions that are used to create a special object that stores a matrix and cache's its inverse.

# The first function, makeCacheMatrix creates a special "matrix", which is really a list containing a function to
# * setMatrix set the value of a matrix
# * getMatrix get the value of a matrix
# * setInverse get the cahced value (inverse of the matrix)
# * getInverse get the cahced value (inverse of the matrix)
# and it will return list of functions
# makeCacheMatrix goal is to store a martix and a cached value of the inverse of the matrix. 

makeCacheMatrix <- function(x = matrix()) {
# stores the cached value or NULL if nothing is cached
# We set the cache to NULL intially beacise nothing is cached
cache <- NULL
# a matrix is stored here
setMatrix <- function(newValue) {
# we'll store a matrix into x
x <<- newValue
# we flush the cache as a matrix is assigned to newValue
cache <<- NULL
}
# returns the stored matrix
getMatrix <- function() {
x
}
# cache the given argument
setInverse <- function(solve) {
cache <<- solve
}
# get the cached value
getInverse <- function() {
cache
}
# return a list. Each named element of the list is a function
list(setMatrix = setMatrix, getMatrix = getMatrix, setInverse = setInverse, getInverse = getInverse)
}



# The following function calculates the inverse of a "special" matrix created with makeCacheMatrix function
# However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the cache and skips the computation. 
# Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setInverse function.
cacheSolve <- function(x, ...) {
# get the value that is cached
inverseValue <- x$getInverse()
# if a cached value exists return the cached value
if(!is.null(inverseValue)) {
message("getting cached data")
return(inverseValue)
}
# if not, caclulate the inverse of the matrix and store it in the cache
data <- x$getMatrix()
inverseValue <- solve(data)
x$setInverse(inverseValue)
# return the inverseValue
inverseValue
}
