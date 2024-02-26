# NomadBnB 

Live website: [NomadBnB](https://nomadbnbs-68808b688fd4.herokuapp.com/)

NomadBnB is a clone of the short-term rental application, Airbnb. NomadBnB allows users to rent out listings posted online, and leave reviews. 

## Technologies Used
- Javascript 
- React 
- Redux
- JBuilder
- Ruby On Rails
- PostgreSQL 
- HTML5
- CSS 
- Google Maps Api 

NomadBnB's core feature is the reservation system, which allows users to book reservations at available listings and organizes relevant information in the users' show page. The backend is built using Ruby On Rails and a PostgreSQL database. The frontend uses React.js, Redux, HTML5, and CSS. 

## Features 
### User Authentication:
- Users can sign up for an account or login with credentaials, as well as log out.
- Users can use a Demo account, which allows for full access to the application.
- The only feature users can use while logged out, is view listings 



### Listings:
- Any user, logged in or out, will be able to view rental locations. 
- Listings contain images featuring the home and it's core features. 
- Listings have a price displayed per night.
- Listings will have a reviews section where users can see reviews from past reservations.
- Listings will have a map at the bottom of the page, showing the general location of the listings.


### Reservations:
- Logged in users can reserve stays at rental locations, and if they are currently logged out, they will be prompted to log in when trying to create a resevation. 
- Logged in users can view their future and past reservations in the user'sshow page
- If it is a future reservation, users will be able to delete the listing for a refund.
- If it is a future reservation, users will be able to edit the amount of guests in a reservations.


### Reviews:
- Any user, logged in or out, will be able to see reviews associated with a listing. 
- If it is a past reservation, logged in users will be able to create a review for that specific reservation.
- If a user has already created a review for a specific reservation, they can edit either the rating, body or both.
- If a user has already created a review for a specific reservation, they can delete the review.

### Locations-Google Maps:
- Each listings has a map attatched which the approximate location.
- The Splash page has a toggle between listings and map to display all of the listings. 

### Highlighted Features:
1. To handle future and past reservations, in the backend, I created active record queries in the Reservations Model that sorts listings into two different arrays to be displayed differently in the same component. 

```ruby
def self.previous_reservations(renter_id)
    return Reservation.includes(:renter)
    .where("check_out_date <= ?", Date.today)
    .where(renter: {id: renter_id})
end 

def self.future_reservations(renter_id)
    return Reservation.includes(:renter)
    .where("check_in_date >= ?", Date.today)
    .where(renter: {id: renter_id})
end 
```

## Features to add in the future
- Experiences 
- User and Host profiles
- websockets to have real time messaging between renters and hosts
