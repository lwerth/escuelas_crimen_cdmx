```{r}

loadWorkbook_url <- function(url) {
  temp_file <- tempfile(fileext = "https://github.com/lwerth/escuelas_crimen_cdmx/blob/master/buffer_250_crime1_TableToExcel.xlsx")
  download.file(url = url, destfile = temp_file, mode = "wb", quiet = TRUE)
  loadWorkbook(temp_file)
}

data_50 <- download.file(url = "https://github.com/lwerth/escuelas_crimen_cdmx/blob/master/buffer_250_crime1_TableToExcel.xlsx", destfile = tempdir(check = FALSE))


#data_250 <- getURL("https://github.com/lwerth/escuelas_crimen_cdmx/blob/master/buffer_250_crime1_TableToExcel.xlsx", ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)


```


Looking at the statistics of spread of the crimes in a 50m radius in the order of:
  
  Variance, Standard Deviation, Range, Max, Min, IQR, Inter-quartile Range, and 20%-80% Quartiles

```{r}
#variance
var(bc50$Join_Count)

#standard deviation
sd(bc50$Join_Count)

range(bc50$Join_Count)

max(bc50$Join_Count)

min(bc50$Join_Count)

```{r}


df <- data.frame(data_250)

df %>% top_n(n()*.1)

df %>% top_frac(.1)


crimenestop10 <- data.frame(data_250)

quantile(data_250$Join_Count, c(.10))

```

```{r}

suppressPackageStartupMessages(install.packages('writexl'))

library('readxl')
library('writexl')

write_xlsx(topdies, "C://Users//LW//Box//Mexico City 2020//data//toptenpercent.xlsx")

out <- read_xlsx("C://Users//LW//Box//Mexico City 2020//data//toptenpercent.xlsx")

```

gghistogram(topdies$Join_Count, 
            xlab="Top 10% Crime Within a 250m Radius",
            ylab= "Number of Schools",
            bandwidth = 75)

IQR(bc50$Join_Count)

#inter-quartile range
quantile(bc50$Join_Count)


quantile(bc50$Join_Count, probs=c(0.2, 0.8))
```

```{r}
library(dplyr)
library(ggplot2)
```

```{r}
#bc50_0 <- filter(bc50, undesirable == 0, drop.na=TRUE)
#bc50_0 <- (bc50 na.rm=TRUE)
hist(bc50$Join_Count)
```
```{r}
ggplot(bc50) +
  geom_histogram(aes(x = bc50$Join_Count),
                 binwidth = 05, fill = "blue", color = "black")

```

```{r}
freq <- table(bc50$Join_Count)
barplot(freq, main="Frequency of crimes within a 50m radius")
```

```{r}
boxplot(bc50$Join_Count)
```