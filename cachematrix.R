## FUNCTION makeCacheMatrix
## Receives x = matrix(), class maxtrix.
##
##      - In the last code lines I creat a variable called init that
##      shows you that makeCacheMatrix creates a list of four elements.
##
##      - These elements will contain, via "set" and "setinverse" the matrix
##      and its inverse, which will be called by init$get and init$getinverse

makeCacheMatrix <- function(x = matrix()) {
        i <- NULL
        set <- function(y) {
                x <<- y
                i <<- NULL
        }
        get <- function() {
                x
        }
        setinverse <- function(inv) {
                i <<- inv
        }
        getinverse <- function() {
                i
        }
        list(set = set, get= get,
             setinverse = setinverse, 
             getinverse = getinverse)
}


## cacheSolve is a function that receives the list created by
## the function makeCacheMatrix and does two things:
##
##      - if the inverse is already calculated (x$getinverse returns null)
##      then it caches it.
##      - else, the function cacheSolve calculates the inverse and returns it.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        if(!is.null(i)){
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data)
        x$setinverse(i)
        i
}

## In the line codes below you will find an example of how you can use
## these functions. The first one (Variation #1) set the inverse manually
## so that the cacheSolve function will not calculate the inverse.
## The second one (Variation #2) is forced to calculate the inverse since
## the "init" list has now no inverse inside.
## If you try bigger matrices you could use Rprof() to
## check that, indeed, caching is efficient.

## Example code lines:
## -------------------

## Variation #1 - Mean is cached and retrieved from cache
## The next piece of code is tested and works OK.
init<-makeCacheMatrix(matrix(c(1, -1, 0, 2, 1, 0, 0, -1, 1), 3, 3))
mt<-init$get()
## We manually enter the inverse, and then caching it
init$setinverse(solve(mt))
init$getinverse()
## Result! (from cache)
cacheSolve(init)


## Variation #2 - Mean is not cached so then calculated
init<-makeCacheMatrix(matrix(c(1, -1, 0, 2, 1, 0, 0, -1, 1), 3, 3))
mt<-init$get()
## Result! (calculated if there is no previous inverse stored)
cacheSolve(init)
