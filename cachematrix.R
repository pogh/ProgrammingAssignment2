## Johns Hopkins University Data Science
## Course 2: Programming
## Programming Assignment 2: Lexical Scoping

## There’s way too much commenting, but hey, it’s an assignment

## This initialises a 'factor' function,
## i.e. a function which lists other functions.
## We can use this store matrices in a cache.
makeCacheMatrix <- function(x = matrix()) {
  iM <- NULL                           # initialise variable inverse matrix cache 
  
  set <- function(y) {                 # set function takes matrix y
    x <<- y                            # and assigns it to x (our cached matrix)
    iM <<- NULL                        # and resets the inverse matrix cache
  }
  get <- function() { 
    x                                  # get function just returns cached matrix
  }
  
  setInverse <- function(invMatrix) {  # set function takes inverse matrix invMatrix
    iM <<- invMatrix                   # and assigns it our inverse matrix cache variable
                                       # we have to use <<- because iM not available to set 
                                       # in environment of this function
  }
  getInverse <- function() {           
    iM                                 # just return inverse matrix cache
  }
  
  list(                                # return our functions as a list
    set = set, 
    get = get,
    setInverse = setInverse,
    getInverse = getInverse
  )
}

## Return a matrix that is the inverse of 'x'
## The result is 'solved' the first time and cached.
## Subsequent calls return the cached result.
cacheSolve <- function(x, ...) {
  
  invMatrix <- x$getInverse()               # Get the cached inverse matrix (might be NULL)
  
  if(!is.null(invMatrix)) {                 # If the cached inverse matrix was not empty
    print("Returning inverse matrix from cache.")
    return(invMatrix)                       # return cached inverse matrix and we're done
  }
                                            # Otherwise...
  print("Solving inverse matrix")
  invMatrix <- solve(x$get())               # 'Solve' the matrix
  x$setInverse(invMatrix)                   # and assign it to the cache for next time
  
  invMatrix                                 # and return it
}
