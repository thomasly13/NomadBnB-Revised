import { useDispatch, useSelector } from "react-redux";
import "./ReservationDetail.css"
import { useState } from "react";
import { deleteExistingReservation, updateExistingReservation } from "../../../store/reservation";
import { ReservationPreviousCreate } from "./ReviewForm/ReservationPreviousCreate";
import { ReservationPreviousEdit } from "./ReviewForm/ReservationPreviousReviewEdit";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export const ReservationDetailText = ({reservation, user, listing, changeLoad}) => {

    const history = useHistory();

    const review = useSelector( state => state.review[reservation.reviewId])

  
    const months = {
        "01": 'Jan',
        "02": 'Feb',
        "03": 'Mar',
        "04": 'Apr',
        "05": 'May',
        "06": 'Jun',
        "07": 'Jul',
        "08": 'Aug',
        "09": 'Sep',
        "10": 'Oct',
        "11": 'Nov',
        "12": 'Dec'
    }


    const splitInDate = reservation.checkInDate.split('-');
    const splitOutDate = reservation.checkOutDate.split('-');
    const wordInDate = `${months[splitInDate[1]]} ${splitInDate[2]}, ${splitInDate[0]}`
    const wordOutDate = `${months[splitOutDate[1]]} ${splitOutDate[2]}, ${splitOutDate[0]}`

    const jsInDate = new Date(`${months[splitInDate[1]]}/${splitInDate[2]}/${splitInDate[0]}`)
    const jsOutDate = new Date(`${months[splitOutDate[1]]}/${splitOutDate[2]}/${splitOutDate[0]}`)

    const nights = Math.floor((jsOutDate.getTime() - jsInDate.getTime()) / (1000 * 3600 * 24))

    const dispatch = useDispatch();

    const [edit, setEdit] = useState(false)
    
    const [guests, setGuests] = useState(reservation.numOfGuests)

    const intervalGuestsDown = () => {
        if (guests !== 1) {
          setGuests(guests - 1)   
        }
      }
    
      const intervalGuestsUp = () => {

        if (guests !== listing.numOfGuests) {
          setGuests(guests + 1)   
        }   
    }

    const handleUpdate = async (e) => {
        const reservationDetails = {
            numOfGuests: guests,
            checkInDate: reservation.checkInDate,
            checkOutDate: reservation.checkOutDate,
            listingId: reservation.listingId,
            id: reservation.id
        }
        const res = await dispatch(updateExistingReservation(reservationDetails))
        changeLoad();
        setEdit(false);
    };

    const handleDelete = async (e) => {
        const res = dispatch(deleteExistingReservation(reservation.id, user.id));
        history.push(`/users/${reservation.renterId}/reservations`)
    }

    const handleEditToggle = () => {
        setEdit(true);
    }


    return (
        <>
            <div className="reservation-edit-container">
                <div className="reservation-edit-image-container">
                    <img src={listing.images[0]} className="reservation-edit-image"></img>                           
                </div>
                <div className="reservation-edit-date-container">
                    <div className="reservation-edit-check-in-date-container">
                        <span className="reservation-edit-check-date-words">Check-in</span>
                        <span className="reservation-edit-check-date-words-2">{wordInDate}</span>
                        <span className="reservation-edit-check-date-words-3">3:00 PM</span>
                    </div>
                    <div className="reservation-edit-check-out-date-container">
                        <span className="reservation-edit-check-date-words">Checkout</span>
                        <span className="reservation-edit-check-date-words-2">{wordOutDate}</span>
                        <span className="reservation-edit-check-date-words-3">1:00 PM</span>
                    </div>
                </div>
                <div className="reservation-about-home-details-container">
                    <span className="payment-big-title">About the Home</span>
                    <span className="reservation-about-home-address">Address: {listing.address}</span>
                    <span className="reservation-about-home-description">{listing.description}</span>
                </div>
                <div className="reservation-information-payment-information-container">
                    <span className="payment-big-title">Payment Info</span>
                    <span className="reservation-information-payment-total-cost">Total Cost</span>
                    <span className="reservation-information-payment-total-cost-money">${listing.price} &#215; {nights} nights = ${nights * listing.price}</span>
                </div>

                { !edit ?
                <div className="reservation-information-payment-information-container">
                    <span className="payment-big-title">Guests</span>
                    <span className="reservation-information-payment-total-cost-money">{reservation.numOfGuests}</span>
                </div>
                 : 
                <div className="reservation-edit-guests-container">
                    <div className="guest-drop-down-adults-container-1">
                        <div className="adults-text-container-1">
                            <span className="adults-text-1">Guests:</span>
                        </div>
                        <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                            <i className="fa-solid fa-minus"></i>
                        </div>
                        <span>{guests}</span>
                        <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                            <i className="fa-solid fa-plus"></i>
                        </div>

                    </div>     
                </div>}
                {reservation.previous === false ?  
                <div className="reservation-edit-cool-buttons">
                    { edit ? <button onClick={handleUpdate} className="reservation-edit-button">
                        <span>Finish Edit</span> 
                    </button> :
                    <button onClick={handleEditToggle} className="reservation-edit-button">
                        <span>Edit Event</span>
                    </button>}

                    <button onClick={handleDelete} className="reservation-edit-button">
                        Cancel Event
                    </button>                      
                </div>
                    :
                    <>
                        {reservation.reviewId ? < ReservationPreviousEdit reservation={reservation} review={review}/>  : < ReservationPreviousCreate reservation={reservation} review={review}/>}
                    </>
                }
            </div>

        </>

    )
};