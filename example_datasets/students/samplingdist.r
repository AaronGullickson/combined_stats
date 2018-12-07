load("../ExampleDatasets/studentsCurrent.RData")

x <- students$height
n <- length(x)

#samples of size 2
means2 <- NULL
for(i in 1:(n-1)) {
  for(j in (i+1):n) {
    means2 <- c(means2, mean(x[c(i,j)]))
  }
}

#means of size 3
means3 <- NULL
for(i in 1:(n-2)) {
  for(j in (i+1):(n-1)) {
    for(k in (j+1):n) {
      means3 <- c(means3, mean(x[c(i,j,k)]))
    }
  }
}

#means of size 4
means4 <- NULL
for(i in 1:(n-3)) {
  for(j in (i+1):(n-2)) {
    for(k in (j+1):(n-1)) {
      for(l in (k+1):(n)) {
        means4 <- c(means4, mean(x[c(i,j,k,l)]))
      }
    }
  }
}

#means of size 5
means5 <- NULL
for(i in 1:(n-4)) {
  for(j in (i+1):(n-3)) {
    for(k in (j+1):(n-2)) {
      for(l in (k+1):(n-1)) {
        for(m in (l+1):(n)) {
          means5 <- c(means5, mean(x[c(i,j,k,l,m)]))
          cat(m)
        }
      }
    }
  }
}

#par(mfrow=c(1,1))
#hist(x,breaks=seq(from=56,to=82,by=1), col="red", main="population distribution", xlab="height in inches")

#par(mfrow=c(2,2))
#hist(means2,breaks=seq(from=56,to=82,by=1), col="red", main="sampling distribution (n=2)", xlab="mean height")
#hist(means3,breaks=seq(from=56,to=82,by=1), col="red", main="sampling distribution (n=3)", xlab="mean height")
#hist(means4,breaks=seq(from=56,to=82,by=1), col="red", main="sampling distribution (n=4)", xlab="mean height")
#hist(means5,breaks=seq(from=56,to=82,by=1), col="red", main="sampling distribution (n=5)", xlab="mean height")

#table <- round(cbind(c(mean(x),mean(means2, na.rm=T),mean(means3, na.rm=T),mean(means4, na.rm=T),mean(means5, na.rm=T)),
#               c(sd(x),sd(means2, na.rm=T),sd(means3, na.rm=T),sd(means4, na.rm=T),sd(means5, na.rm=T))),3)

#colnames(table) <- c("mean", "sd")
#rownames(table) <- c("population distribution","sampling distribution (n=2)","sampling distribution (n=3)", "sampling distribution (n=4)", "sampling distribution (n=5)")

save(means2, means3, means4, means5, file="studentsamplingdist.RData")
