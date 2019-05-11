
#using R library
kmeanArray = kmeans(mtcars, 5)
datafr = data.frame("means" = kmeanArray[1][1])
datafrClusters = data.frame("centers" = kmeanArray[2])

library(plotly)
library(MASS)

parcoord(datafrClusters, col=rainbow(sample.int(5,5)))


# or implement kmeans
# 
# #generate 5 datapoints with dimenstion [1, 11]
# centerData = c()
# 
# for (i in 1:6) {
#   rnd = sample.int(20, 11)
#   centerData = c(centerData, rnd)
# }
# 
# centroids = array(centerData, dim = c(5, 11))
# centroids
# 
# 
# #cars array
# cars = mtcars
# num_cols = 11
# 
# for (i in 1:nrow(cars)) {
#   for (j in 1:nrow(centroids)) {
#     
#   }
# }
