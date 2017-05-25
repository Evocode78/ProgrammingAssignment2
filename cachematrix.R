## Two functions, to solve and cache a matrix
## Function 1 - Solves a matrix, but cache's the results
## Function 2 - Solves, but checks for a cache, and will pick up from
## there if a cache result exists

## Function 1 - Solving a matrix and cacheing if needed

makeCacheMatrix <- function(x = matrix()) {
  s <- NULL
  set <- function(y) {
    x <<- y
    s <<- NULL
  }
  get <- function() x
  setsolve <-function(solve) s <<- solve
  getsolve <-function() s
  list(set=set, get=get,
       setsolve = setsolve,
       getsolve = getsolve)
}

## Function 2, solves x, but checks to see if already a result in prev function

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("calm your farm, working hard here!")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}
