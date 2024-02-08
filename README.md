#The full code is in 'App analysis with SQL.sql'


This project uses SQL to analyze over 7000 apps available on the App Store, utilizing a dataset from Kaggle. The dataset contains various details about each app, including its name, price, primary genre, number of supported languages, average user rating, number of supporting devices, and application description.

The project aims to address the following six questions:

-1.Compare average ratings between free apps and paid apps

-2.Find out whether apps with more supported languages have higher ratings 

-3.Identify genre with top 5 lowest ratings

-4.Identify genre with top 5 highest ratings

-5.Is there correlation between App description and rating?

-6.Find out the app with highest rank for each genre


By using SQL queries, such as Case When, group by, order by, join, where, AVG(), MIN(), MAX(), and Count() function, I derive following useful insights:

1.Paid Apps have higher average rating than Free Apps.

2.Apps with 11-20 supported languages have the highest rating.

3.Top 5 lowest-rated genres:

Catalogs, Finance, Book, Navigation and LifeStyle 

4.Top 5 highest-rated genres:

Productivity, Music, Photo&Video, Business, Health&Fitness

5.The app rating tends to increase with longer descriptions.
