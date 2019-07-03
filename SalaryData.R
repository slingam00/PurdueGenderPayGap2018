my_data <- read.csv("C:/Users/sling/Documents/PurdueStaffSalaries2018.csv", header = F)
males <- my_data[my_data$V11 == 'M',]
m <- males$V10
m <- as.numeric(gsub('[$,]', '', m))
# ma <- m[m < 500000 & m > 2000]
mean(m)
mean(ma)
median(m)
median(ma)
sd(m)
sd(ma)
summary(m)
ci(m, confidence=0.95, alpha=1 - confidence, ...)

head(sort(m), 350)
females <- my_data[my_data$V11 == 'F',]
f <- females$V10
f <- as.numeric(gsub('[$,]', '', f))
f
# fe <- f[f < 500000 & f > 2000]
mean(f)
mean(fe)
median(f)
median(fe)
sd(f)
sd(fe)
summary(f)
tail(sort(f), 10)

m[m > 500000]
