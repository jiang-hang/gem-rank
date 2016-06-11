library(ggplot2)
library(plyr)
library(reshape2)
library(yaml)

gems <- llply(dir("./", pattern="*.spec",full.names = TRUE), yaml.load_file)

gendf<-function(x){
		if( is.null(x) ) {
			#data.frame(name="__noname", author=" " , dependency=" ", desc=" ", home=" " )
			data.frame(name="__noname", dependency=" ")
		}else{
		        print( x$name)
		        aut = unlist(x$authors)
                        aut = ifelse(length(aut)>0,aut[1]," ")
			aut = ifelse(is.null(aut), " ", aut)
			dep = x$dependencies
		        dep= paste( laply (dep , function(y) y$name)  , collapse="," )
		        dep= ifelse(is.null(dep)," ",dep)
		        des= ifelse(nchar(x$description)>10, x$description, x$summary)
		        des = ifelse(is.null(des)," ",des)
		        home = ifelse(is.null(x$homepage)," ",x$homepage)
		        print( aut)
		        print( dep)
		        print( des)
		        print( home)
		        print( "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx")
		        data.frame(
		        	name = x$name,
		        	#author = aut,
		        	dependency = dep
		        	#desc = des 
		        	)
		} 
}

gemdf <- ldply (gems, function(x) try(gendf(x)))

saveRDS(gemdf, "gemdf.rds")
