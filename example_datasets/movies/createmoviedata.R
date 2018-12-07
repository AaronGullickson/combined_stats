library(dplyr)
library(RSQLite)
library(ggvis)
library(data.table)

db <- src_sqlite("movies.db")
omdb <- tbl(db, "omdb")
tomatoes <- tbl(db, "tomatoes")

# Join tables, filtering out those with <10 reviews, and select specified columns
all_movies <- inner_join(omdb, tomatoes, by = "ID") %>%
  filter(Reviews >= 10) %>%
  select(ID, imdbID, Title, Year, Rating_m = Rating.x, Runtime, Genre, Released,
         Director, Writer, imdbRating, imdbVotes, Language, Country, Oscars,
         Rating = Rating.y, Meter, Reviews, Fresh, Rotten, userMeter, userRating, userReviews,
         BoxOffice, Production)

reviews <- 0
oscars <- 0
minyear <- 0
maxyear <- 2100
minboxoffice <- 0
maxboxoffice <- 1000000000000000000

m <- all_movies %>%
  filter(
    Reviews >= reviews,
    Oscars >= oscars,
    Year >= minyear,
    Year <= maxyear,
    BoxOffice >= minboxoffice,
    BoxOffice <= maxboxoffice
  ) %>%
  arrange(Oscars)
movies <- as.data.frame(m)
movies <- movies[(movies$Genre %like% "Documentary" | movies$Genre %like% "Short")==FALSE,]
movies <- movies[substr(movies$Language,1,7)=="English" & movies$Country %like% "USA",]
movies <- movies[,c("Genre","Title","Year","Rating_m","Runtime",
                    "Oscars","Rating","Meter","BoxOffice")]

write.table(movies$Genre, row.names=FALSE, col.names="FALSE", eol=",", quote=FALSE, file="temp.csv")
genres <- sort(na.omit(as.character(unique(as.factor(scan("temp.csv", 
                                                          what="character", 
                                                          sep=",", strip.white=TRUE))))))

genres <- genres[genres!="" & genres!="FALSE"]
genreData <- NULL
for(i in 1:length(genres)) {
  temp <- movies$Genre %like% genres[i]
  genreData <- cbind(genreData,as.numeric(temp))
}

colnames(genreData) <- genres

movies <- cbind(movies[,-1], genreData)

movies <- movies[movies$Runtime>0,]

movies$Rating_m[!is.na(movies$Rating_m) & movies$Rating_m=="TV-PG"] <- "PG"
movies$Rating_m[!is.na(movies$Rating_m) & movies$Rating_m=="Not Rated"] <- "Unrated"
movies$Rating_m[!is.na(movies$Rating_m) & movies$Rating_m=="Approved"] <- NA
#movies$Rating_m[!is.na(movies$Rating_m) & movies$Rating_m=="NC-17"] <- "Unrated"


movies$Rating_m <- as.factor(movies$Rating_m)

movies$Rating_m <- relevel(movies$Rating_m, "Unrated")
movies$Rating_m <- relevel(movies$Rating_m, "NC-17")
movies$Rating_m <- relevel(movies$Rating_m, "R")
movies$Rating_m <- relevel(movies$Rating_m, "PG-13")
movies$Rating_m <- relevel(movies$Rating_m, "PG")
movies$Rating_m <- relevel(movies$Rating_m, "G")

#we only have a few movies before 2001, so eliminate
movies <- movies[movies$Year>=2001 & movies$Year<2014,]


#convert dollars to 2010 dollars or something for BoxOffice
movies$BoxOffice <- movies$BoxOffice/1000000

movies <- na.omit(movies)

#need to create a simplified single genre category based on a cascading list of priorities

Genre <- rep("Other", nrow(movies))
Genre[movies$Drama==1] <- "Drama"
Genre[movies$Mystery==1] <- "Mystery"
Genre[movies$Thriller==1] <- "Thriller"
Genre[movies$Action==1] <- "Action"
Genre[movies$Romance==1] <- "Romance"
Genre[movies$Comedy==1] <- "Comedy"
Genre[movies$`Sci-Fi`==1 | movies$Fantasy==1] <- "SciFi/Fantasy"
Genre[movies$Horror==1] <- "Horror"
Genre[movies$Musical==1 | movies$Music==1] <- "Musical/Music"
Genre[movies$Family==1] <- "Family"
Genre[movies$Animation==1] <- "Animation"
movies$Genre <- as.factor(Genre)


movies <- movies[,-1*c(9:28)]
colnames(movies) <- c("Title","Year","Rating","Runtime","Oscars","TomatoRating","TomatoMeter","BoxOffice","Genre")


save(movies, file="../movies.RData")
