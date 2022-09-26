### Done in collaboration with my group in class

######################################################################################
#load in data 
drug_group = read.csv("hw6_week5mon/drug_group_treatment.csv")
#View(drug_group)

#preliminary plot to visualize data
plot(drug_group$Change~drug_group$Cholesterol)

######################################################################################
#fitting a linear model to the data and plotting
fit = lm(drug_group$Change~drug_group$Cholesterol)
summary(fit)
plot(drug_group$Change~drug_group$Cholesterol) + abline(-304.897, 1.437, col="blue")

#getting an estimate of Bo for the null 
B_0 = mean(drug_group$Change)

######################################################################################
#error distribution from the model fit
e_fit = fit$residuals
hist(e_fit, freq=FALSE, col="#56B4E9", main="Distribution of residuals")

#define values 
reps <- 2000
boot_beta0 <- rep(NA, reps)
#get data in the format of x,y 
df_boot <- data.frame(drug_group$Cholesterol, drug_group$Change)
colnames(df_boot) = c("Cholesterol", "Change")
boot_pval <- rep(NA, reps)

#Estimate for sigma = sqrt(Var(e)), where the denominator for Var(e) is the
# residual degrees of freedom, n - 2 in the simple linear model because we
# estimate two parameters.
var_e_hat <- sum(fit$residuals ^ 2) / fit$df.residual
sigma_hat <- sqrt(var_e_hat)
n = length(df_boot$Cholesterol)

#Bootstrapping
for ( i in 1:reps ) {
    # Sample errors from the Normal distribution--this is the assumption 
    e_boot <- sample(e_fit, replace=TRUE)
    #create new y-values from the estimated parameters and errors UNDER THE ASSUMPTION THAT THE SLOPE = 0 (the null model)
    df_boot$Change <- B_0 + e_boot
    # Fit the linear model on 'fake' data
    fit_boot <- lm(Change ~ Cholesterol, data=df_boot)
    # Keep the parameter estimates
    boot_beta0[i] <- coef(fit_boot)[1]
    boot_beta1[i] <- coef(fit_boot)[2]
}

#p-value: probability of a sample statistic larger or as large as the one observed
#given that the null hypothesis is true
#null hypothesis: Beta1 = 0
#so probability of beta1 as large or larger than 0
#get instances of beta1 >= 0, and divide those by the total number of beta1s to get a probability (the p-value!)
sum(abs(boot_beta1)>=abs(coef(fit)[2]))/length(boot_beta1)

#plotting distibution of bootstrap beta1
hist(boot_beta1, freq=FALSE, col="#56B4E9", main="Bootstrap distribution of Beta1")
#plotting the distribution of beta1s 
