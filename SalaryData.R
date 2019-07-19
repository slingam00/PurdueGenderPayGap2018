###Purdue 2018 Gender Pay Gap Code
 
my_data <- read.csv("C:/Users/sling/Documents/PurdueStaffSalaries2018.csv", header = F) #loading in the file

males <- my_data[my_data$V11 == 'M',] #isolating the males 
m <- males$V10
m <- as.numeric(gsub('[$,]', '', m)) #removing the dollar signs
length(m) #number of males
summary(m) #getting the summary

females <- my_data[my_data$V11 == 'F',] #isolating the females
f <- females$V10 
f <- as.numeric(gsub('[$,]', '', f)) 
length(f) 
summary(f)

total <- sum(m) + sum(f) #storing total amount of money



##Sampling + 95% Confidence Intervals
#Male
xxx <- sample(m, 500) #sampling 500 from male data 
mm <- mean(xxx) #getting mean, variance, and standard deviation of male sample
v <- var(xxx) 
sd <- sqrt(v) 

s <- sd
n <- 500
error <- qnorm(0.95)*s/sqrt(n) #getting the error using the formula with the qform() function
leftM <- mm-error #adjusting the error on each side
rightM <- mm+error
leftM
rightM

#Female
yyy <- sample(f, 500) #sampling 500 from female data
ff <- mean(yyy) #getting mean, variance, and standard deviation of male sample
v <- var(yyy)
sd <- sqrt(v)

s <- sd
n <- 500
error <- qnorm(0.95)*s/sqrt(n) #same formula used as with the male sample
leftF <- ff-error 
rightF <- ff+error
leftF
rightF


##Two Sample Z-Test
d <- 0 #supposed difference
z<- ((mean(xxx)-mean(yyy)) - d)/sqrt((sd(xxx)^2/500 +sd(yyy)^2/500)) #z calculation using null hypothesis
p_value= 2*pnorm(-abs(z)) #finding p-value using pnorm() function
p_value


##Athletics Department Statistics
athletics <- my_data[my_data$V4 == 'WL - 4Interc Athl',] 
athletics
a <- athletics$V10
a <- as.numeric(gsub('[$,]', '', a))
sum(a)
length(a)
sum(a)/total #finding the percentage of spending on the athletics department



##Electrical Engineering Department Statistics
electrical <- my_data[my_data$V4 == 'WL - 4Electrical',]
electrical
e <- electrical$V10
e <- as.numeric(gsub('[$,]', '', e))
sum(e)
length(e)


##Looking at the Data without Athletics
theMales <- my_data[my_data$V11 == 'M' & my_data$V4 != 'WL - 4Interc Athl',]
theM <- theMales$V10
theM <- as.numeric(gsub('[$,]', '', theM))
sd(theM)
summary(theM)

theFemales <- my_data[my_data$V11 == 'F' & my_data$V4 != 'WL - 4Interc Athl',]
theF <- theFemales$V10
theF <- as.numeric(gsub('[$,]', '', theF))
sum(theF)
sd(theF)
summary(theF)



## Sorting through each department and the total money they spend 
l <- list();
df = data.frame(x = character(), y = numeric(), stringsAsFactors = FALSE)
for (i in unique(my_data$V4)) { #iteration of each department
  theSum = 0
  xx <- my_data[my_data$V4 == i,]
  experiment <- xx$V10
  experiment <- as.numeric(gsub('[$,]', '', experiment))
  theSum = sum(experiment)
  df <- rbind(df, data.frame(x = i, y = theSum)) #storing it all in a dataframe
  df
}