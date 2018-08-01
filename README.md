# Data manipulation using Dplyr and Swirl packages
swirl()
install_from_swirl("Getting and Cleaning Data")
mydf <-read.csv(path2csv,stringsAsFactors = FALSE)
dim(mydf)
head(mydf)
packageVersion("dplyr")

cran <- tbl_df(mydf)  # load the data into a 'data frame tbl'
rm("mydf") #remove the original data frame from workspace
cran

# Use select function: To select columns
select(cran, ip_id, package, country)
select(cran, r_arch:country)
select(cran,country:r_arch)
cran
select(cran, -time)
select(cran, -(X:size))

# Use Filter function: To select rows
filter(cran,package == "swirl")
filter(cran,r_version == "3.1.1", country == "US") 
filter(cran,r_version <="3.0.2", country == "IN") 
filter(cran, country == "US" | country == "IN")
filter(cran, r_os == "linux-gnu",size>100500)
filter(cran, !is.na(r_version))

# Use Arrange function:To order the rows according to the values of a particular variable
cran2 <- select(cran,size:ip_id)
arrange(cran2, ip_id)
arrange(cran2, desc(ip_id))
arrange(cran2, package, ip_id)
arrange(cran2, country,desc(r_version), ip_id)

# Use Mutate function:To create a new variable based on the value of one or more variables
cran3 <- select(cran,ip_id,package,size)
mutate(cran3, size_mb = size / 2^20)
mutate(cran3, size_mb = size / 2^20,size_gb = size_mb / 2^10 )
mutate(cran3, correct_size = size+1000)

# Use Summarize function:To collapse the dataset to a single row
summarize(cran, avg_bytes =mean(size))
