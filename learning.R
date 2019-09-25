####Setup####
	library(needs)
	needs(ggplot2)
	needs(tidyr)
	needs(drat)
	drat::addRepo("polmine")
	needs(polmineR)
	
	library(GermaParl)


####Read In Bundestag Corpora####
	# read in the parliamentary corpus - only do this once
	# germaparl_download_corpus()
	use("GermaParl")
	
	
####Basics:Read the text####
	
	#Subset by date and speaker, then read the text
	merkel <- partition("GERMAPARL", speaker = "Angela Merkel", date = "2013-09-03")
	read(merkel)
	
	#Learn to read about specific keywords and count them - example here is Finanzkriese 
	#https://polmine.github.io/UCSSR/subcorpora.html#10 for example 
	
	
	
####Check the Attributes of the Corpus####

####Count Words####
	#Note that this is going to be obsolete in new releases 
	
	#Get all 
	merkel2008 <- partition(
		"GERMAPARL",
		speaker = "Angela Merkel",
		year = "2008",
		verbose = FALSE
	)
	
	#Read with highlights
	read(merkel2008, highlight = list(yellow = c("Finanzkrise")))
	
	count(merkel2008, query = "Finanzkrise", verbose = FALSE)
	
	merkel <- partition("GERMAPARLMINI", date = "2009-11-10", speaker = "Merkel", regex = TRUE)
	read(merkel, meta = c("speaker", "date"))
	read(
		merkel,
		highlight = list(yellow = c("Deutschland", "Bundesrepublik"), lightgreen = "Regierung"),
		meta = c("speaker", "date")
	)
		
	