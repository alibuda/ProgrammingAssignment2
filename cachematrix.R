## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    s <- NULL
    set <- function(y) {
        x <<- y
        s <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) s <<- solve
    getsolve <- function() s
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    s <- x$getsolve()
    if(!is.null(s)) {
        message("getting cached data")
        return(s)
    }
    data <- x$get()
    s <- solve(data, ...)
    x$setsolve(s)
    s
}

##Test

# # test <- matrix(c(1,2,2,0,-1,1,0,0,1),nrow = 3, ncol = 3)
# test <- matrix(c(0,1,-1,2,1,-1,-1,2,-1),nrow = 3, ncol = 3)
# temp <- makeCacheMatrix(test)
# # debug(cacheSolve)
# cacheSolve(temp)
