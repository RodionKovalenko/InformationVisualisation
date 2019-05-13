

#using R library
kmeanArray = kmeans(mtcars, 5)
datafr = data.frame("means" = kmeanArray[1][1])
datafrClusters = data.frame("centers" = kmeanArray[2])

library(plotly)
library(MASS)

dir.create(file.path(getwd(), 'kovalenkoRodionUebung4'))


colnames(datafrClusters) <- colnames(mtcars)
#save file
pdf('kovalenkoRodionUebung4/parellelCoorPlot.pdf')

parcoord(datafrClusters, col = sample.int(5, 5))
dev.off()

