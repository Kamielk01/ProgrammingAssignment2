## Put comments here that give an overall description of what your
## functions do
## These functions create a matrix object and cache the inverse
## and a function to compute the inverse of said matrix and retrieve it from cache
## if it has been calculated before.

## Write a short comment describing this function
## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	i <- NULL

	set <- function(y) {
		x <<- y
		i <<- NULL
	}

	get <- function() x
	
	setInv <- function(inv) i <<- inv

	getInv <- function() i

	list(set= set, get= get,
		setInv = setInv,
		getInv = getInv)
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above.
## If the inverse has already been calculated (and the matrix has not changed),
## then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
	i <- x$getInv()
	if (!is.null(i)) {
		message("Getting chace data")
		return(i)
	}

	data <- x$get()
	i <- solve(data, ...)
	x$setInv(i)
	i
}

## I took inspiration from the example shown in the assignment on how to
## cache the mean of a vector
