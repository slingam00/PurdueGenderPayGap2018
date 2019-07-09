my_data <- read.csv("C:/Users/sling/Documents/PurdueStaffSalaries2018.csv", header = F)
males <- my_data[my_data$V11 == 'M',]
m <- males$V10
m <- as.numeric(gsub('[$,]', '', m))
sd(m)
summary(m)

females <- my_data[my_data$V11 == 'F',]
f <- females$V10
f <- as.numeric(gsub('[$,]', '', f))
f
sd(f)
summary(f)

total<- sum(m) + sum(f)

athletics <- my_data[my_data$V4 == 'WL - 4Interc Athl',]
athletics
a <- athletics$V10
a <- as.numeric(gsub('[$,]', '', a))
sum(a)

sum(a) /total


# without Athletics
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

summary(m)
sd(m)
summary(f)
sd(f)


# sorting through each department and the total money they spend 
l <- list();
theSum = 0
for (i in unique(my_data$V4)) {
  xx <- my_data[my_data$V4 == i,]
  xx
  experiment <- xx$V10
  experiment
  experiment <- as.numeric(gsub('[$,]', '', experiment))
  experiment
  theSum = theSum + sum(experiment)
  theSum
}
