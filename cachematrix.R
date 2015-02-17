## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
<<<<<<< HEAD
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
=======

>>>>>>> 7f657dd22ac20d22698c53b23f0057e1a12c09b7
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
<<<<<<< HEAD
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
=======
}
>>>>>>> 7f657dd22ac20d22698c53b23f0057e1a12c09b7
