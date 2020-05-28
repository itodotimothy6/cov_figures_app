<img src="https://github.com/itodotimothy6/cov_figures_app/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/114.png">

# cov_figures_app

An cross-platform app that detects a user's location and provides up-to-date covid-19 data. User's can also check other US counties to compare/view covid-19 info about the selected county.

<p align="center">
  <img src="https://github.com/itodotimothy6/cov_figures_app/blob/master/cov-figs-android-demo.gif">
  <img src="https://github.com/itodotimothy6/cov_figures_app/blob/master/cov-figs-iphone-demo.gif">
</p>

### Run
Because COVID-19 is a pulic health crisis, this app can only be published to the app/play store by a legal entity. As of now, this app can only be run locally. To run loccally follow the instructions below:
* First install [Flutter](https://flutter.dev/docs/get-started/install) for your device and set up an emulator/simulator
* Clone the project & open in Android Studio or VScode
* Select an emulator/simulator and click run

### Data Sources/API
* [ncov19.us API](https://documenter.getpostman.com/view/10962932/SzYevF7i?version=latest)
* [geo.fcc.gov area API](https://geo.fcc.gov/api/census/#!/area/get_area)
* [US Census Bureau Population Data](https://www.census.gov/data/datasets/time-series/demo/popest/2010s-counties-total.html#par_textimage_739801612)


### Data shown in app
Data | Description 
---------------------------| ------------------------------
Confirmed Cases | This is simply the amount of people who have been infected and tested positive for the coronavirus.
Recent Cases | This is the amount of cases that have been confirmed from the last time new data was received from ncov19.us API to the recent update.
Total Deaths | According to ncov19.us, this is the total number of confirmed Coronavirus cases that have resulted in deaths.
Recent Deaths| This is the amount of recent deaths as provided by ncov19.us
Infected Density | Taking the ratio of the number of confirmed cases to the total population of a county multiplied by a thousand, the infected density is simply the amount of confirmed cases per 1000 people living in that county.
Mortality Rate | This is the percentage of confirmed cases that result in death in a particular county. Simply put, it is the ratio of confirmed deaths to confirmed cases multiplied by 100. This is also based on the data from the ncov19.us. 
Danger Rank | This is a ranking of all the counties in the US based on how high their infected densities are. This ranges from #3007(lowest infected density)  to #1(highest infected density).


### Flutter Packages used
* [flappy_search_bar: 1.7.2](https://pub.dev/packages/flappy_search_bar)
* [flutter_spinkit: 4.1.2+1](https://pub.dev/packages/flutter_spinkit)
* [geolocator: 5.3.1](https://pub.dev/packages/geolocator)
* [auto_size_text: 2.1.0](https://pub.dev/packages/auto_size_text)
* [intl: 0.16.1](https://pub.dev/packages/intl)
