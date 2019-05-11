
#install packages if needed => comment it out and execute
# install.packages("ggplot2", dependencies = TRUE)
# install.packages("ggExtra",dependencies=TRUE)

library(ggplot2)
library(ggExtra)

dir.create(file.path(getwd(), 'kovalenkoRodionUebung4'));

#===================================================
# a) 

species = unique(iris['Species'])
#transpose array to dimension [1][3]
species = array(t(species))
#create empty matrix for filling in the variances
variances = matrix(nrow=0,ncol=2)
#column names for plotting
colspecies =  species;
colvariances = c();

#fill in the for variances in variances

for(i in 1:length(species)) {
  
  kindSpecies = subset(iris, iris[,'Species'] == species[i]);
  variance = var(kindSpecies['Petal.Length'])
  variances = rbind(variances, c(variance, species[i]))
  colvariances = c(colvariances, variance)
}


#define data frame for plotting
data = data.frame("species" = colspecies, "variance" = colvariances)

#display variances
variances

#plot the data to show variance 
ggplot(data, aes(x=species, y=variance)) + geom_point()

#save file
ggsave("kovalenkoRodionUebung4/plotVariance.png")
#===================================================================
# b)

#plot data to show outliers
ggplot(iris, aes(x=Sepal.Width, y=Sepal.Length,color=Species)) + geom_point()

#save file
ggsave("kovalenkoRodionUebung4/plotOutliers.png")
#===================================================================
# c)

plength = iris['Petal.Length']
pwidth = iris['Petal.Width']

slength = iris['Sepal.Length']
swidth = iris['Sepal.Width']

data = data.frame("species" = iris['Species'],"plength" = plength, "pwidth" = pwidth, "slength" = slength, "swidth" = swidth)

#plot the correlation between data 
plot(data, 
     col = ifelse(species == 'versicolor','red', 
                  ifelse(species == 'virginica','green', 
                         ifelse(species =='setosa', 'blue', 'black'))))


#save file
pdf('kovalenkoRodionUebung4/correlationAll.pdf');



plot(data, 
     col = ifelse(species == 'versicolor','red', 
                  ifelse(species == 'virginica','green', 
                         ifelse(species =='setosa', 'blue', 'black'))))

dev.off()


# show correlation indexes
data = data.frame("plength" = plength, "pwidth" = pwidth, "slength" = slength, "swidth" = swidth)
cor(data, method='spearman')









