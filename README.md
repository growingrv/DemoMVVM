# DemoMVVM
A sample app demonstrating elementary coding style and design principles for MVVM design pattern.

## Functional details:
* Created an app where a user can search for the nearest airports.
* App gets the airport details from following json URL: https://gist.githubusercontent.com/tdreyno/4278655/raw/7b0762c09b519f40397e4c3e100b097d861f5588/airports.json
* When user searches for a city, the app shows the city suggestions while typing.
* When user clicks on one of the city name results, the app shows the top 5 nearest airport names with the runway length and country in a new screen 

## Implementation details:
* First screen shows name of cities (along with state and country details) and seconds screen shows nearest 5 airports.
* Both of these screens are written as 2 separate modules.
* The app downloads the list of airports from provided web service.
* First screen displays the city list in a scrollable list. User can search for a city name and the app suggests names based on user's inputs. 
* Second screen displays top 5 nearest airports based on user's selection. 
* Along with airport name, it also displays country's name, runway length (in km), airport's code and airport's distance (in km) from selected airport.
* The app is iPhone only and proper use of Autolayouts makes the app compatible for all main iPhone models.
* Have added app's screenshots. 

## Design Details:
* Used MVVM design pattern.
* Have kept minimum possible code in VCs and kept business logic separate from VCs.
* For both modules, have segregated dataSource also from VC so that VC becomes even lighter. 
* Logical and reasonable usage of main Swift features like Extensions, Optionals, Tuples, Extensions, Structs and Generics. 
* Minimum to no use of Singleton and forced unwrapping.
* Have written a modular layer for network interactions. 
* Some major UI decisions are taken for making interactive and logical UI.
* Followed 4 design principles:
    * S.O.L.I.D
    * Clean architecture
    * DRY (Dont repeat yourself)
    * POLA (Principle of least astonishment)
* Taken care of coding standards and conventions.
* Have considered cyclomatic complexity.
* Length of methods and file are as per standards.
* Have written modular code which has many "plug & play" components.
* Have used structs and sub structs for storing constant values for better readability. This also helps avoid manual mistakes. 

## Limitations
* The app startup is delayed because of 1 single and huge API being used for whole app's functionality.
* Use of this API also makes the code more coupled. 
* Ideally, there should be one API similar to http://www.geonames.org/export/web-services.html for searching and providing the list of cities. Then another API should take 1 city's code as parameter and should return airports belonging to that city.
