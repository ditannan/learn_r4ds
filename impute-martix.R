impute.matrix <- function (matrix) {
  missing <- which(is.na(matrix) | !is.finite(matrix), arr.ind=TRUE)
  if (length(missing)!=0){
    for (j in 1:nrow(missing)){
      mean <- mean(matrix[missing[j,1],][is.finite(matrix[missing[j,1],])], na.rm=TRUE)
      matrix[missing[j,1],missing[j,2]] <- mean
    }
  }
  matrix
}

(matrix1 <- matrix(10 : 18, nrow = 3))
matrix1[2, 3] <- NA
matrix1[3, 3] <- NA
(missing <- which(is.na(matrix1) | !is.finite(matrix1), arr.ind = TRUE))

mean(matrix1[missing[1,1],][is.finite(matrix1[missing[1,1],])], na.rm=TRUE)
