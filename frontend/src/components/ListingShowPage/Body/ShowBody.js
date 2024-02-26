import { useSelector } from "react-redux";
import { ShowHeader } from "./Header/ShowHeader";
import { ShowReservation } from "./Reservation/ShowReservation";
import { useEffect } from "react";
import GoogleMapReact from 'google-map-react';
import "./ShowBody.css"



export const ShowBody = ({listing}) => {
    const locationHelper = () => {
        let address = listing.address.split(", ");
        let location = address.slice(1, 3);
        return location.join(", ")
    }

    const CoolMarker = () => {
        return (
            <div className="houseIcon" style={{ color: "#ffffff", fontSize: "21px" }}>
                <i className="fa-solid fa-house-chimney"></i>
            </div>   
        )
    }


    let defaultProps;
    let coordinates;
    
    (listing ? coordinates = listing.coordinates.split(' ') : coordinates = null)

    if (listing) {
        defaultProps = {
            center: {
            lat: parseFloat(coordinates[0]),
            lng: parseFloat(coordinates[1])
            },
            zoom: 16
        };        
    }



    const owner = useSelector(state => state.user[listing.ownerId]);

    const reviews = useSelector(state => Object.values(state.review))
    return (
        <>     
            {(owner === undefined || owner === null) || (reviews === undefined || reviews === null) ? null :    
            <div className="show-body">
                < ShowHeader listing={listing} locationHelper={locationHelper}/>
                <div className="show-body-information">
                    <div className="show-body-information-tab">
                        <div className="show-listing-information">
                            <span className="show-listing-owner">Entire home hosted by {owner.firstName} {owner.lastName}</span>
                            <span className="show-listing-specific-information">{listing.numOfGuests} guests &bull; {listing.numOfBedrooms} bedrooms &bull; {listing.numOfBeds} beds &bull; {listing.numOfBaths} baths</span>
                        </div>
                        <hr className="information-line"></hr>

                        <div className="show-listing-highlight-information">

                            <div className="show-listing-superhost">
                                <div className="superhostIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    <i className="fa-solid fa-medal"></i>
                                </div>
                                <div className="highlight-information-container">
                                    <span className="highlight-title">{owner.firstName} {owner.lastName} is a Superhost</span>
                                    <span className="highlight-information">Superhosts are experienced, highly rated hosts who are committed to providing great stays for guests.</span>                                     
                                </div>
    
                            </div>

                            <div className="show-listing-location">
                                <div className="superlocationIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    < i className="fa-solid fa-location-dot"></i>
                                </div>

                                <div className="highlight-information-container">
                                    <span className="highlight-title">Great Location</span>
                                    <span className="highlight-information">95% of recent guests gave the location a 5-star rating.</span>                                     
                                </div>

                            </div>

                            <div className="show-listing-experience">
                                <div className="superhostIcon" style={{ color: "#ff385c", fontSize: "24px" }}>
                                    <i className="fa-solid fa-key fa-flip-horizontal"></i>
                                </div>

                                <div className="highlight-information-container">
                                    <span className="highlight-title">Great check-in experience</span>
                                    <span className="highlight-information">95% of recent guests gave the check-in process a 5-star rating.</span>                                     
                                </div>

                            </div>
                        </div>

                        <hr className="information-line"></hr>
                        
                        <div className="show-body-description-container">
                            <span className="show-listing-owner">About the home</span>
                            <span className="show-body-description">{listing.description}</span>
                        </div>

                        <hr className="information-line"></hr>

                        <div className="reviews-container">
                            <div className="review-title-container-1">
                                <div  style={{ color: "#ecd041", fontSize: "25px" }}>
                                    <i className="fa-solid fa-star"></i>
                                </div>
                                <span>{listing.review}</span>
                                <span>&#x2022;</span>
                                <h2 >{reviews.length} Reviews </h2>
  
                            </div>
                            
                            {reviews.map( (review) => {
                                return (
                                    <>  
                                        {review ? 
                                        <div>
                                            <div className="review-title-container">
                                                {review.reviewer ? 
                                                <span>{review.reviewer.first_name}</span> : null }
                                                <div className="cool-container">
                                                    <span>{review.rating}</span>
                                                    <div  style={{ color: "#ecd041", fontSize: "25px" }}>
                                                        <i className="fa-solid fa-star"></i>
                                                    </div>                                                 
                                                </div>  
                                            </div>

                                            <span className="review-body">{review.body}</span>
                                        </div> : null }
                                    </>
                                )
                            })}
                        </div>                       
                    </div>
                    
                    <ShowReservation listing={listing} />

                 
                </div>
                <div className="cool-map">
                    <GoogleMapReact
                            bootstrapURLKeys={{ key:  "AIzaSyCL1buWaa613e2kJz-1qY5HBNNZamJaWG8" }}
                            defaultCenter={defaultProps.center}
                            defaultZoom={defaultProps.zoom}
                        >
                            <CoolMarker
                            lat={coordinates[0]}
                            lng={coordinates[1]}
                            text="My Marker"
                            />
                    </GoogleMapReact>
                </div>
            </div>}
        </>
    )
}