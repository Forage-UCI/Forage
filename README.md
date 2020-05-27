# Forage

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
Forage is a restaurant social media app that allows users to browse dining options, save favorite restaurants, and give recommendations according to your friends' favorite restaurants. 

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Recommendation / Social Networking
- **Mobile:** This app would be primarily developed for mobile but would perhaps be just as viable on a computer. Functionality wouldn't be limited to mobile devices, however mobile version could potentially have more features.
- **Story:** Analyzes users restaurant choices and allows them to view friends' visited locations to help pick their next visit. 
- **Market:** Any individual could choose to use this app.
- **Habit:** This app could be used as often or unoften as the user wanted depending on how often they eat out, and what exactly they're looking for.
- **Scope:** First, user should be able to see their favorite locations and quickly select and check-in to a restaurant. The user can browse new potential favorite restaurants by viewing friends' favorites. The user can also edit their own profile (username or password) if needed.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User can login/logout/signup
* User can browse nearby restaurants 
* User can check-in to the restaurant
* User can favorite a restaurant
* User can view their own favorite list
* User can view friends' favorite restaurant/check-in list 
* User can randomize a choice within the fav list
* App incorporates Google Place API
* User can view the map with restaurant locations (MapKit)
* TabView Controller is used to separate the functions
* User can add new friends
* User can stay logged in 
* User can refresh feed

**Optional Nice-to-have Stories**

* Restaurant categories
* User can sort the feed based on price, distance, number of favorites 
* User has wish list of restaurants they wish to visit 
* User can favorite restaurant through home screen (notification) - widget 

### 2. Screen Archetypes

* Login Screen
   * User can login/signup
* Register - User signs up or logs into their account
   * Upon Download/Reopening of the application, the user is prompted to log in to gain access to their profile information.
* Feed 
   * User can view their own favorite list
   * User can view friends' favorite restaurant/check-in list
   * User can check-in to the restaurant
   * App incorporates Google Place API
   * User can add new friends (bar button)
   * User can refresh feed
* Map/Browse Restaurants
   * User can view the map with restaurant locations (MapKit)
   * User can view their own favorite list (on map)
   * User can browse nearby restaurants 
   * User can view friends' favorite restaurant/check-in list (by swap)
   * User can favorite a restaurant
   * User can randomize a choice within the fav list
   * App incorporates Google Place API
   * User can sort the feed based on price, distance, number of favorites
   * Restaurant categories 
* Profile Screen
   * User can edit their own favorite list
   * User can manage username/password
   * User can logout 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Feed Screen
    * User icon -> User Profile
* Check-in/Add new restaurant
    * Map/Browse Restaurants
* Friends' timeline?/Feed/Restaurant Recommentaions
    * Friends Feed
        * Friends' icon -> Friends profile

**Flow Navigation** (Screen to Screen)

* Forced Log-in -> Account creation if no log in is available
* Restaurant Selection -> Check-in to Restaurant
* Browse Friend Recommendations -> Favorite a Restaurant 
* Profile Screen -> edit settings -> logout 

## Wireframes
[Add picture of your hand sketched wireframes in this section]
[Wireframe PDF](https://github.com/Forage-UCI/Forage/blob/master/Wireframe.pdf)
### [BONUS] Digital Wireframes & Mockups
[Wireframe PDF](https://github.com/Forage-UCI/Forage/blob/master/Wireframe.pdf)
### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
