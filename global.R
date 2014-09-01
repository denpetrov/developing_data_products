# Author: Denis Petrov
# petrovdenis [at] gmail [dot] com
# Date: 2014-06-21

# The data was collected from http://globalelectionsdatabase.com/
# and wikipedia.org
# the indices were calculated by Maxim Litvak 
# (https://github.com/maxlit/powerindex).

# global variables

# read and organize the data
ds.countries <- read.csv (file = './data/countries.csv', sep = ',')
flds.order <- c ('country', 'year', 'Party', 'Seats', 'perc.of.seats', 
                 'Banzhaf.Power.Index', 'Shapley.Shubik.Power.Index')

ds.countries <- ds.countries [, flds.order]

# set the names for the representation
names (ds.countries) <- gsub ('\\.', ' ', names (ds.countries))

GetCountriesList <- function ()
{
  return (as.character (unique (ds.countries$country)))
}

flds.view <- c ('Party', 'Seats', 'perc of seats', 
                'Banzhaf Power Index', 'Shapley Shubik Power Index')

flds.plot <- c ('Party', 'Seats')
