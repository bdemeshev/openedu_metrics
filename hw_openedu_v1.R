library("pander")
library("knitr")
library("lmtest")
library("psych")
library("memisc")
library("psych")
library("dplyr")
library("knitr")
library("rlms")
library("sandwich")
library("ggplot2")
library("scales")
library("gridExtra")
library(lmtest)
library(car)

setwd("~/Documents/University/master_2_year/Open_edu")
#df <- read.rlms("r23i_os25a.sav")
df <- rlms_read("r23i_os25c.sav")

data_h <- mutate(df,
sex = as.numeric(sh5=="МУЖСКОЙ"),
wage = sj13.2,
city = as.numeric(status),
married = as.numeric(sj322),
uni_educ = as.numeric(sj72.5a),
hours = as.numeric(sj6.2),
udovl = as.numeric(sj1.1.2)) %>%
dplyr::select(sex, s_age, wage, city, married, uni_educ, hours, udovl)

data_h3 <- dplyr::filter(data_h, data_h$city < 3, data_h$udovl < 3, data_h$married < 6, 
                         data_h$uni_educ < 4)


data_h5 <- na.omit(data_h3)

data_h5$sex <- as.factor(data_h5$sex)

library(plyr)
data_h5$city <- as.factor(data_h5$city)
data_h5$city <- revalue(data_h5$city, c("1"="0", "2"="1"))

data_h5$udovl <- as.factor(data_h5$udovl)
data_h5$udovl <- revalue(data_h5$udovl, c("1"="1","2"="0"))
data_h5$udovl <- relevel(data_h5$udovl, ref = "0")

data_h5$uni_educ <- as.factor(data_h5$uni_educ)
data_h5$uni_educ <- revalue(data_h5$uni_educ, c("1"="1","2"="1","3"="0"))
data_h5$uni_educ <- relevel(data_h5$uni_educ, ref = "0")

data_h5$married <- as.factor(data_h5$married)
data_h5$married <- revalue(data_h5$married, c("1" = "1", "2" = "2", "3" = "2", "4" = "4", "5" = "5"))

data_h6 <- mutate(data_h5,
                  single = as.numeric(data_h5$married == 1),
                  marr = as.numeric(data_h5$married == 2),
                  divorsed = as.numeric(data_h5$married == 4),
                  widow = as.numeric(data_h5$married == 5))

data_h6$single <- as.factor(data_h6$single)
data_h6$marr <- as.factor(data_h6$marr)
data_h6$divorsed <- as.factor(data_h6$divorsed)
data_h6$widow <- as.factor(data_h6$widow)

data <- data_h6

summary(data)
summary(data$wage)

table(data$marr, data$sex)

ggplot(data = data, aes(x = hours, y = wage)) + geom_point() 

data$wageth <- data$wage/1000 
wage <- ggplot(data=data, aes(wageth)) + geom_histogram(fill="pink", color="red") + facet_grid(~sex) + labs(x="",y="Частота") + scale_x_continuous(limits=c(0,100))
# ggplot(data=data, aes(wage)) + geom_histogram(binwidth=10000, fill="lightblue", color="blue") + facet_grid(~sex) + labs(title = "Гистограмма по доходам", x="Заработная плата (в рублях)", y="Частота")+scale_x_continuous(limits=c(0,100000),labels=comma)

age <- ggplot(data=data, aes(s_age)) + geom_histogram(fill=" lightblue",binwidth=5, color="blue") + 
      facet_grid(~sex) + labs( x="", y="Частота")
# ggplot(data=data, aes(age)) + geom_histogram(fill="pink",binwidth=5, color="red") + facet_grid(~sex) + labs(title = "Гистограмма по возрасту", x="Возраст (в годах)", y="Частота")

grid.arrange(wage, age)



model1 <- lm(wage ~ sex + s_age + uni_educ + city + udovl + hours + marr + divorsed + widow, data = data)
# значимость и интерпретация
summary(model1)

model2 <- lm(wage ~ sex + s_age + uni_educ + city + udovl + hours, data = data)
summary(model2)

# сравнение моеделей
waldtest(model1, model2)

# мультиколлинеарность
vif(model1)

# гетероскедастичность
coefs <- coeftest(model1)
coefs2 <- coeftest(model1, vcov. = vcovHC(model1))

bptest(model1, data = data) 

resettest(model1)
mtable(model1, model2)


