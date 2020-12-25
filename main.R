install_from_swirl("Exploratory Data Analysis")
install.packages("OpenImageR")
library(OpenImageR)
pic <- readImage("sss.jpg")
imageShow(pic)
pic <- rgb_2gray(pic)
dim(pic)
imgsvd <- svd(scale(pic))
d <- diag(imgsvd$d)
dim(d)
u <- imgsvd$u
v <- imgsvd$v
par(mar=c(1,1,1,1))
plot(1:length(imgsvd$d), imgsvd$d)
#########
depth <- 50
us <- as.matrix(u[, 1:depth])
vs <- as.matrix(v[, 1:depth])
ds <- as.matrix(d[1:depth, 1:depth])
ls <- us %*% ds %*% t(vs)
imageShow(ls)
object.size(ls)
object.size(pic)
###########
if (!requireNamespace("BiocManager", quietly = TRUE)){
	install.packages("BiocManager")
}
BiocManager::install("impute")
library(impute)
pic2 <- pic
pic2[sample(1:(650*3), size=1000,replace=FALSE)] <- 25
imageShow(pic2)
pic2 <- impute.knn(data = pic2)
imgsvd1 <- svd(scale(pic2))
############
library(ggplot2)
install.packages("plotly")
library(plotly)
x <- rnorm(20000)
y <- x + rnorm(20000, 0.05)
View(df)
df <- data.frame(x = x, y = y,
		 d = densCols(x, y, colramp = colorRampPalette(rev(rainbow(10, end = 4/6)))))
g <- ggplot(df) +
	geom_point(aes(x, y, col = d), size = 1) +
	scale_color_identity()
ggplotly(g,tooltip = "text", dynamicTicks = )

ggplot(data = as.data.frame(hc)) +
	geom_tile(aes(fill = value)) +
	scale_fill_gradient2() +
	theme(axis.text.y = element_text(size = 6))
