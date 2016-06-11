library(ggplot2)
library(plyr)
library(reshape2)
library(yaml)

gem=readRDS("gemdf.rds")
gem$dependency=as.character(gem$dependency)

validgem=gem[which(nchar(gem$dependency)>1),]


revDep=list()

#gen the revd gem
revd<-function(x)
{
	print(x[1])
	ggs=strsplit(x[2],",")[[1]]
	for (gg in ggs){
	  if(is.null(revDep[[ gg ]])){
	  	revDep[[ gg ]] <<- x[1]
	  }else{
	  	revDep[[ gg ]] <<- c(revDep[[ gg ]],x[1])
		#print(revDep[[ gg ]])
	  }
	}
}

apply(validgem,1,revd)

saveRDS(revDep,"./revDep.rds")
