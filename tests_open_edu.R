# Test 1
4*0.1+7*0.4+8*0.5
-4*3 + 7 + 5

# Var(7X - 2Y + 5)?
49*16+4*25-2*(-2)*7*2

# TSS
0.6*150/0.4+150

# Test 3
data(iris)
iris[3,4]

data(rivers)
mean(rivers)

max(rivers)/min(rivers)
plot(rivers)
plot(df=rivers)
qplot(df=rivers)
qplot(df=rivers, rivers)
?plot

pnorm(85, mean=78, sd=12) - pnorm(24, mean=78, sd=12)

library(titanic)
library(dplyr)
library(car)
library(ggplot2)
tit <- titanic_train
model <- lm(data=tit, Fare ~ Age + Sex + SibSp)
summary(model)
confint(model, level=0.9)
linearHypothesis(model, "Age-SibSp=0")
model2 <- lm(data = tit, Fare ~ Age + I(Age + SibSp) + Sex)
summary(model2)

library(ggplot2)
h <- diamonds
qplot(data=h, carat, price)


# TEST 4
library("dplyr")
setwd("~/Documents/University/master_1_year/coursera_metrics/lab_03")
h <- read.table("flats_moscow.txt", header=TRUE, sep = "\t", dec = ".")
glimpse(h)

model <- lm(data=h, price~metrdist)
summary(model)
vcov(model)
coef(model)

V <- matrix(c(7.128,-0.719,-0.719,0.0886),nrow=2)
V

s2 <- deviance(model)/(nrow(h)-2)
s2

x <- c(1,15)

t(x) %*% V %*% x
t(x) %*% V %*% x + s2


model <- lm(data=h, log(price) ~ kitsp)
summary(model)
model2 <- lm(data=h, price ~ log(kitsp))
summary(model2)


# Res 
250-110
# Unres 
250-205

(140-45)

95*(100-5)/(2*45)

95/2/(45/(100-5))

qf(0.95, df1=2, df2=95)


# Test 5
qplot(data=tit, x=Age, y=log(Fare))

library(ggplot2)
h <- diamonds
str(h)
ggplot(data=diamonds, aes(carat,log(price))) + geom_point(aes(color=clarity)) + facet_grid(~cut)

library(vcd)
setwd("~/Documents/University/master_1_year/coursera_metrics/lab_03")
flat <- read.table("flats_moscow.txt", header=TRUE, sep = "\t", dec = ".")
mosaic(data=flat, ~walk+brick+floor, shade=TRUE)
 
library(titanic)
library(lmtest)
tit.tr <- titanic_train
tit.te <- titanic_test
tit.tr$Sex <- as.factor(tit.tr$Sex)
tit.tr$Pclass <- as.factor(tit.tr$Pclass)
model <- lm(data = tit.tr, Fare ~ Age + Sex + Pclass)

tit.te$Sex <- as.factor(tit.te$Sex)
tit.te$Pclass <- as.factor(tit.te$Pclass)

conf.tit <- predict(model, newdata = tit.te, interval="confidence" )
pred.tit <- predict(model, newdata = tit.te, interval="prediction" )

pred.tit[225,]
conf.tit[225,]

model1 <- lm(data = tit.tr, Fare ~ Age + Sex)
model2 <- lm(data = tit.tr, Fare ~ Age + Sex + Pclass + SibSp)
waldtest(model1, model2)

library(memisc)

mtable(model1, model2)

resettest(model2)

# Test 6
1/(1-0.97)
1/(1-0.93)
1/(1-0.3)

y <- c(15, 21, 24, 11)
x <- c(5, 6, 5, 10)

df <- data.frame(y,x)
beta_ols <- (15*5+21*6+24*5+11*10)/(5^2 + 6^2 + 5^2 + 10^2)
beta_ridge <- (15*5+21*6+24*5+11*10)/(5^2 + 6^2 + 5^2 + 10^2 + 350)
beta_ols/beta_ridge

model <- lm(data=df, y~ 0 + x)

# Test 7
350*0.55
qchisq(df=,0.95)

500/(150-3)/(250/(150-3))
500/250
qf(0.95, df1=147, df2=147)

# Exam
n <- 1000
set.seed(42)
x <- rnorm(n, mean = 10, sd = 2)
eps_c <- rnorm(n) * (x ^ 2)
y_c <- 2 + 8 * x + eps_c
m_c <- lm(y_c~x)
he_c <- resid(m_c)
gr <- qplot(x = x, y = he_c, geom = "point") + labs(x = "x", y = "Остатки") 
gr

hat_sigma2 <- 800
ess <- 200
tss <- 400
r2 <- ess/tss
se2 <- hat_sigma2/((1-r2)*tss)
se2 
  
800/(400-200)

data()

library(ggplot2)
library(dplyr)
?freeny
df <- freeny
str(df)
summary(df)
glimpse(df)

model <- lm(data=df, lag.quarterly.revenue~price.index+income.level)
summary(model)
confint(model, level=0.9)


model2 <- lm(data=df, lag.quarterly.revenue~price.index+income.level+market.potential)
summary(model2)

resettest(model2)

(30+20-40)/sqrt(0.7^2+0.5^2+2*0.25)

anova(model, model2)
waldtest(model, model2)

# Test 8
library(car)
data <- Salaries
str(data)

model <- lm(data = data, salary ~ yrs.since.phd + yrs.service + sex + discipline + rank)
summary(model)
vif(model)

model2 <- lm(data = data, yrs.since.phd ~ yrs.service + sex + discipline + rank)
summary(model2)

x <- model.matrix(data = data, salary ~ 0 + yrs.since.phd + yrs.service + sex + discipline + rank)
x <- x[,-3]
head(x)
cor(x)

library(HSAUR)
h <- heptathlon
str(h)

pca_s <- prcomp(x, scale = TRUE)
pca1 <- pca_s$x[,1]
pca1
v1 <- pca_s$rotation[,1]
v1

summary(pca_s)
cor(pca1, data$salary)
plot(pca_s)
biplot(pca_s)


library(sandwich)
library(ggplot2)
library(lmtest)
ggplot(data = data, aes(x = yrs.since.phd, y = salary)) + geom_point() + 
  labs(x = "Количество лет после получения PhD (в годах)", y = "Заработная плата (в долларах)")

model3 <- lm(data = data, salary ~ yrs.since.phd)
summary(model3)
coeftest(model3)
confint(model3)
vcov(model3)
vcovHC(model3)
coeftest(model3, vcov. = vcovHC(model3))

?bptest
bptest(model3, data = data, varformula = ~ yrs.since.phd + I(yrs.since.phd^2))
bptest(model3, data = data)


df <- freeny
model4 <- lm(data=df, lag.quarterly.revenue~price.index+income.level)
summary(model4)
1-1.56/2
(39 - 2) * 0.15
qchisq(0.9, df = 2)


# Test 9 
182/364


0.5+1.96*round(sqrt(1/728), digits = 2)
2*(182*log(0.5) + 0.5*364)
2*182*(1-0.69)


a <- matrix(c(1,2,3,4), nrow=2)
a
b <- matrix(c(5,6,7,8), nrow=2)
b

a %*% b


#Test 10
library("lubridate")  # работа с датами

library("sandwich")  # vcovHC, vcovHAC
library("lmtest")  # тесты
library("car")  # еще тесты
library("zoo")  # временные ряды
library("xts")  # еще ряды
library("dplyr")  # манипуляции с данными
library("broom")  # манипуляции
library("ggplot2")  # графики

library("quantmod")  # загрузка с finance.google.com
library("rusquant")  # загрузка с finam.ru
library("sophisthse")  # загрузка с sophist.hse.ru
library("Quandl")  # загрузка с Quandl

x <- c("1940-04-13")
y <- ymd(x)  # конвертируем в специальный формат дат
y
wday(y, label = TRUE)


df <- AirPassengers
start(df)
str(df)

df1 <- mts(df)
coredata(df1)

data <- airmiles
head(data)
start(data)

data[9,] <- NA


Sys.setlocale("LC_TIME", "C")  # это шаманское заклинание позволяет избежать проблем с русской кодировкой месяцев под windows
# цены акций компании GOGL:
getSymbols(Symbols = "GOGL", from = "2014-01-01", to = "2016-05-11", src = "google")
head(GOGL)
tail(GOGL)

autoplot(GOGL[,1:4])



df <- freeny
model2 <- lm(data=df, lag.quarterly.revenue~price.index+income.level+market.potential)
d_aug <- augment(model2, df)
glimpse(d_aug)
qplot(data = d_aug, lag(.resid), .resid) + labs(x = "Лаг остатков", y = "Остатки")

vcovHAC(model2)

coeftest(model2, vcov. = vcovHAC(model2))

res <- dwt(model2)
res$dw

library(titanic)
tit <- titanic_train
tit$Sex <- as.factor(tit$Sex)
tit <- na.omit(tit)
m_logit <- glm(data = tit, Survived ~ Sex + Age + Parch + Fare, family = binomial(link = "logit"),
               x = TRUE)

summary(m_logit)
str(tit)
exp(2.49)

library(erer)
maBina(m_logit, x.mean = FALSE) 
??maBina

t2 <- select(tit, Sex, Age, Parch, Survived, Fare) %>% na.omit()
# оцениваем ограниченную модель
m_logit2 <- glm(data = t2, Survived ~ Sex + Age + Fare, family = binomial(link = "logit"),
                x = TRUE)
# проводим LR тест
lrtest(m_logit, m_logit2)

# Test 11
0.6^2-4*0.05
sqrt(0.16)
(0.6-0.4)/(2*0.05)
(0.6+0.4)/(2*0.05)

8 + 0.6 * 3 - 0.05*2


# Test 12
(15*16-8)/16
  
15*16/(16+4)

(10*5+15*16)/16

# Test 13
library("lubridate")  # работа с датами
library("zoo")  # временные ряды
library("xts")  # еще ряды
library("dplyr")  # манипуляции с данными
library("ggplot2")  # графики
library("forecast")
library("quantmod")  # загрузка с finance.google.com
library("sophisthse")  # загрузка с sophist.hse.ru

set.seed(42)
y <- arima.sim(n = 300, list(ar = 0.9))
tsdisplay(y)

data()
dis <- discoveries
str(dis)
head(dis)
?discoveries
tsdisplay(dis)

mod_1 <- Arima(dis, order = c(1, 0, 1))
summary(mod_1)
prognoz <- forecast(mod_1, h = 4)
prognoz
plot(prognoz)

set.seed(1)
y <- arima.sim(n=100, list(ar=0.5))
mod_2 <- Arima(y, order = c(0, 0, 3))
summary(mod_2)

library("dplyr")  # манипуляции с данными
library("caret")  # стандартизованный подход к регрессионным и классификационным моделям
library("AER")  # инструментальные переменные
library("ggplot2")  # графики
library("sandwich")  # робастные стандартные ошибки
library("ivpack")  # дополнительные плющки для инструментальных переменных
library("memisc")  # табличка mtable

library("AER")
data <- data("CollegeDistance")
h <- CollegeDistance

model1 <- ivreg(data=h, wage~gender+unemp+ethnicity+education|gender+unemp+ethnicity+distance)
summary(model1)

coeftest(model1, vcov = vcovHC)


library(sophisthse)
y <- sophisthse("POPNUM_Y")


# Exam
20 + 1.65 * 4

library(AER)
data(CPS1985)
df <- CPS1985
head(df)
summary(df)
?CPS1985
str(df)

model1 <- lm(data = df, wage ~ education + experience + age + gender + 
              occupation + union + married)
summary(model1)

# Значимость 
model2 <- lm(data = df, wage ~ education + experience + age + I(age^2) + gender + 
               occupation + union + married)
summary(model2)

# Мульти
vif(model1)
model_v <- lm(data = df, experience ~ education + age + gender + 
                occupation + union + married)
summary(model_v)

# Гетеро
bptest(model1, data = df)

# Пропущенные переменные
resettest(model1)

# Автокорр
library(broom)
library(dplyr)
library(ggplot2)
d_aug <- augment(model1, df)
glimpse(d_aug)
qplot(data = d_aug, lag(.resid), .resid) + labs(x = "Лаг остатков", y = "Остатки")
# qplot(data = df, y = wage, x = education)

df_n <- as.zoo(Investment)
str(df_n)
mod1 <- lm(data = df_n, RealInv ~ RealInt)
summary(mod1)
dfn_aug <- augment(mod1, df_n)
glimpse(dfn_aug)
qplot(data = dfn_aug, lag(.resid), .resid) + labs(x = "Лаг остатков", y = "Остатки")

# Времен ряды
library("forecast")
set.seed(42)
y <- arima.sim(model = list(ar = c(0.6, 0.2), ma = c(0.5,0.4)), n = 300)
mod_1 <- Arima(y, order = c(1, 0, 1))
mod_2 <- Arima(y, order = c(1, 0, 0))
mod_3 <- Arima(y, order = c(0, 0, 1))
mod_4 <- Arima(y, order = c(1, 1, 1))
AIC(mod_4)
BIC(mod_4)
# mtable(mod_1, mod_2, mod_3, mod_4)

1 + 0.2 * 50


# Второй вариант
data(CPS1988)
data <- CPS1988
str(data)

# Значимость
m <- lm( data = data, wage ~ education + experience + region + parttime)
summary(m)

library(broom)
rss <- deviance(m)
data_au <- augment(m, data)
ess <- sum((data_au$.fitted-mean(data_au$wage))^2)
(ess/(7 - 1))/(rss/(28155 - 7))

# Мульти
matr <- model.matrix(data = data, wage ~ 0 + education + experience + region + parttime)
head(matr)
cor(matr)

m_v <- lm( data = data, education ~ experience + region + parttime)
summary(m_v)
vif(m)

# Гетеро
library(ggplot2)
d_aug1 <- augment(m, data)
qplot(data = d_aug1, y = .resid, x = experience) + labs(x = "Опыт работы", y = "Остатки")

# Тест Вальда
m2 <- lm( data = data, wage ~ education + experience + region + parttime + ethnicity)
summary(m2)
?waldtest
waldtest(m, m2)

# Тест Бройша-Годфри, авто
?bgtest
bgtest(m, order = 2)

# Arima
set.seed(42)
y <- arima.sim(model = list(ar = 0.8, ma = 0.5), n = 400)
mod_a <- auto.arima(y)
prognoz_a <- forecast(mod_a, h = 5)

0.6 + 2 * 0.7

200/1000
sqrt(0.2)


