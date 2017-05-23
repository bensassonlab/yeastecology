
#setwd("/Users/douda/github/douda/Robinson_etal/MSrun")
#setwd("/Users/douda/projects/yeast/Robinsonetal14")
outfile<-"byhostTmax.tsv"

			# get byhostdata
data<-read.table("byhostdata.tsv",header=TRUE)
attach(data)

head(data)
sum(sampleCount)	# 781 samples because 16 isolationTemp=10 samples were dropped post-presabs analysis, June data are included, and 15 soil samples are out

library(raster)		# load raster packages
#library(rgdal)

			# get data from 2 different tiles (16=Western UK + Portugal ie longitude < 1)
wAN1 = getData('worldclim', var='tmax', res=0.5, lon=longitude[hostName=="AN1"], lat=latitude[hostName=="AN1"])
wCRO1 = getData('worldclim', var='tmax', res=0.5, lon=longitude[hostName=="CRO1"], lat=latitude[hostName=="CRO1"])


file(paste("tmaxdata.txt"), open="w")
cat("hostName","tmaxlatitude","tmaxlongitude","maxtemp","\n", file="tmaxdata.txt")

s<-0.01				# cell size

# get climate data from tile 16 & print to tmaxdata.txt 
# (there is no real need to create tmaxdata.txt: could have created dataframe on the fly)

attach(data)
data16<-data[longitude>0,]

attach(data16)	# tile 16

for (i in 1:length(hostName)) {
	c<-c(longitude[i],longitude[i]+s,latitude[i],latitude[i]+s)
	e<-extent(c)
	zoom<-crop(wAN1,e)	# crop raster stack to a single cell
				
				# print hostname, nearest worldclim data longitude and latitude, maximum temperature
	cat((paste(hostName[i])),ymin(zoom),xmin(zoom),max(maxValue(zoom)), "\n", file="tmaxdata.txt", sep="\t", fill=FALSE, labels=NULL, append=TRUE)  
}


# get climate data from tile 15

attach(data)
data15<-data[longitude<=0,]

attach(data15)	# tile 15

for (i in 1:length(hostName)) {
	c<-c(longitude[i],longitude[i]+s,latitude[i],latitude[i]+s)
	e<-extent(c)
	zoom<-crop(wCRO1,e)	# crop raster stack to a single cell

				# print hostname, nearest worldclim data longitude and latitude, maximum temperature
	cat((paste(hostName[i])),ymin(zoom),xmin(zoom),max(maxValue(zoom)), "\n", file="tmaxdata.txt", sep="\t", fill=FALSE, labels=NULL, append=TRUE) 

}

# read in tmax data from file tmaxdata.txt
tmaxdata<-read.table("tmaxdata.txt",header=T)
joined<-merge(data,tmaxdata,by="hostName")

length(data)
length(tmaxdata)
length(joined)
head(data)
head(tmaxdata)
head(joined)
tail(joined)
list(joined$hostName,(joined$maxtemp/10))

# write joined data to a new file

write.table(joined,outfile,sep="\t",quote=F,row.names=F)



