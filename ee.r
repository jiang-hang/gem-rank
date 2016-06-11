library(ggplot2)
library(plyr)
library(reshape2)
library(yaml)

`%||%` <- function(a, b) if (is.null(a)) b else a

vip=readRDS("./vipGem.rds")

##parse the spec , get the homeurl and desc
#name revDep_counter




homeurl = laply(1:nrow(vip), function(x) {
		if(file.exists(paste0(vip[x,1],".spec"))){
		    spec=yaml.load_file(paste0(vip[x,1],".spec"))
		    print(vip[x,1])
		    home=spec$homepage	
		    home %||% " "
		}else{
		    " "
		}
	})

des = laply(1:nrow(vip) , function(x){
		if(file.exists(paste0(vip[x,1],".spec"))){
		  spec=yaml.load_file(paste0(vip[x,1],".spec"))
		  print(vip[x,1])
		  desc=spec$description
		  summary=spec$summary
		  desc %||% summary %||% " "
		}else{
		  " "
		}
		})

vip$home=homeurl
vip$desc=des

saveRDS(vip,"vipGemRes.rds")
