# cov_figures_app

An cross-platform app that provides important current data&#x2F;information about COVID-19 relative to the user’s location.


### Data Sources/API
* ncov19.us API
* geo.fcc.gov area API
* US Census Bureau Population Data  

![App Demo](https://github.com/itodotimothy6/cov_figures_app/blob/master/Cov-Figures-Demo.gif)

### Data provided per county
Markdown | Less 
---------------------------| ------------------------------
Confirmed Cases | This is simply the amount of people who have been infected and tested positive for the coronavirus according to …
Recent Cases | This is the amount of cases that have been confirmed from the last time new data was received from … to the recent update.
Total Deaths | According to …, this is the total number of confirmed Coronavirus cases that have resulted in deaths.
Recent Deaths| This is the amount of deaths that have been confirmed from positively tested patients from the last time new data was received from …to the present data update.
Infected Density | Taking the ratio of the number of confirmed cases to the total population of a county multiplied by a thousand, the infected density is simply the amount of confirmed cases per 1000 people living in that county.
Mortality Rate | This is the percentage of confirmed cases that result in death in a particular county. Simply put, it is the ratio of confirmed deaths to confirmed cases multiplied by 100. This is also based on the data from the source. 
Danger Rank | This is a ranking of all the counties in the US based on how high their infected densities are. This ranges from #3007(lowest infected density)  to #1(highest infected density).


## Flutter Packages used
* flappy_search_bar: 1.7.2
* flutter_spinkit: 4.1.2+1
* geolocator: 5.3.1
* auto_size_text: 2.1.0
