load("example_datasets/politics/politics.RData")
politics$supportgmar <- politics$gaymarriage=="Support gay marriage" | politics$gaymarriage=="Civil unions"
politics$evangelical <- politics$relig=="Evangelical Protestant"
tab <- table(politics$supportgmar, politics$evangelical)
tab
prop.table(tab, 2)
OR <- tab[1,1]*tab[2,2]/(tab[1,2]*tab[2,1])
OR