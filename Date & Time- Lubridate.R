help(package = lubridate)

this_day <- today()
this_day
year(this_day)
wday(this_day)
wday(this_day, label = TRUE)

this_moment <- now()
this_moment
hour(this_moment)

# Parsing date-time with lubridate
my_date <- ymd("1989-05-17")
my_date
class(my_date)
ymd("1989 May 17") 
ymd("March 12, 1975")
mdy("March 12, 1975")
dmy(25081985)
ymd("192012")  # will produce NA
ymd("1920/1/2")

dt1  # "2014-08-23 17:23:02"
ymd_hms(dt1)
hms("03:22:14")
dt2  # a vector containing: "2014-05-14" "2014-09-22" "2014-07-11"
ymd(dt2)

#update() function allows us to update one or more components of a date-time
update(this_moment, hours = 8, minutes = 34, seconds = 55)
this_moment
this_moment <- update(this_moment,hours = 20, minutes = 00, seconds = 55)
this_moment

# finding the current date in New York
nyc <- now(tzone = "America/New_York")
nyc
# departure time calculation
depart <- nyc + days(2)  # setting departure date 2 days from now
depart
depart <- update(depart,  hours = 17, minutes = 34)
depart

# receiving time calculation
arrive <- depart + hours(15) + minutes(50)
arrive <- with_tz(arrive, tzone = "Asia/Hong_Kong") # set to arriving place time-zone
arrive

last_time <- mdy("June 17, 2008", tz = "Singapore")
last_time
# calculating time interval
how_long <- interval(last_time, arrive)
as.period(how_long)

stopwatch()
