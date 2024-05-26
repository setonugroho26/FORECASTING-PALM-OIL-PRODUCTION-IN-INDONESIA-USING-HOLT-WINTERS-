# library
library(ggplot2)
library(tidyverse)
library(tidyr)
library(forecast)
library(TSstudio)
library(plotly)

minyaksawit<-read.csv('C:/Kuliah/Dataset/produksawit.csv',sep=';')
head(minyaksawit)

data<-ts(minyaksawit$Produksi, frequency=12)
data

# Plot Data
ts_plot(data,
        title='Data Produksi Minyak Sawit',
        Xtitle='Bulan',
        Ytitle='Produksi/ton')

# Statistika Deskriptif
summary(data)

vis.data<-decompose(data)
plot(vis.data)

# Pemodelan
model<-HoltWinters(data)
model

# Peramalan
prediksi<-forecast(object=model, h=12)
prediksi

train<-data %>% head(-12)
test<-data %>% tail(12)
autoplot(prediksi)+autolayer(test)

# Akurasi Hasil Peramalan
accuracy(model$fitted[,1], data)










