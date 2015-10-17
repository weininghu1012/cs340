london_2012 = read.csv(file = '/Users/weininghu/Documents/study/ubc2015w1/cpsc340/assignment/a1/a1/london2012.csv', header = TRUE, sep = ',')
colnames(london_2012) = c('Age','Height','Weight','Gender','bronze','silver','gold')
head(london_2012)
min_age = min(london_2012[,'Age'])
max_age = max(london_2012[,'Age'])

female = london_2012[london_2012$Gender == 1,]
male = london_2012[london_2012$Gender == 0,]
median_female = median(female[,'Age'])
median_male = median(male[,'Age'])

quantile(london_2012[,'Age'],c(0.1,0.25,0.5,0.75,0.9))

par(mfrow=c(1,1))
hist(london_2012[,'Age'],xlab = 'Age',main = 'Histogram of age values')
dev.print(pdf,'Histogram of age values.pdf')
col = ifelse(london_2012$Gender == 1,'red','blue')
plot(london_2012$Height,london_2012$Weight,xlab = 'Height',ylab = 'Weight',main = 'Height VS Weight',pch = 16,col = ifelse(london_2012$Gender == 1,'red','blue'))

legend('topleft', pch=c(16,16), col=c('red', 'blue'), c('Male', 'Female'),  cex=.8,xjust = 0.1 )

attach(london_2012)

boxplot(Weight~Age,xlab = 'Age',ylab = 'Weight',main = 'Boxplot of weight values for each age value')
