library(ggplot2)
library(plyr)
library(reshape2)
library(yaml)


revDep=readRDS("./revDep.rds")

gems=names(revDep)

#conv it to data.frame

res = ldply(1:length(gems), function(x) {
			data.frame(gem=gems[x],revdep=length(revDep[[x]]))
		} )

res=res[order(res$revdep,decreasing=T),]

res = head(res,500)

saveRDS(res,"./vipGem.rds")

##parse the spec , get the homeurl and desc



