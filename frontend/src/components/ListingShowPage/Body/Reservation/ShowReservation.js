import { useState, useEffect } from "react";
import { useDispatch } from "react-redux";
import { ReservationCalendar } from "./ReservationCalendar/ReservationCalendar";
import "../ShowBody.css";
import { GuestsDropDown } from "./GuestsDropDown/GuestsDropDown";
import { postCreateReservation } from "../../../../store/reservation";
import { useHistory } from "react-router-dom";





export const ShowReservation = ({listing}) => {


  const history = useHistory();
  const dispatch = useDispatch();

  const [checkInDate, setCheckInDate] = useState("");
  const [checkOutDate, setCheckOutDate] = useState("");
  const [guests, setGuests] = useState(1);

  const [showMenu, setShowMenu] = useState(false)
  const [showGuestsMenu, setShowGuestsMenu] = useState(false)
  const [errors, setErrors] = useState(false)

  const handleToggleMenu = (e) => {
    e.preventDefault();
    if (showMenu) return;
    setShowMenu(true);
  }

  const closeGuestMenu = () => {
    setShowGuestsMenu(false)
  }

  const handleToggleGuestMenu = (e) => {
    e.preventDefault();
    if (showGuestsMenu) return;
    const element = document.querySelector(".reservation-form-guests-container")
    if (element) element.classList.add("reservation-form-guests-container-active")
    setShowGuestsMenu(true);
  }

  const handleCheckinDate = (date) => {
    const actualMonth = date.getMonth() + 1
    setCheckInDate(`${actualMonth}/${date.getDate()}/${date.getFullYear()}`)
  }

  const handleCheckoutDate = (date) => {
    const actualMonth = date.getMonth() + 1
    setCheckOutDate(`${actualMonth}/${date.getDate()}/${date.getFullYear()}`)
    setShowMenu(false)
  }

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

  const dateChanger = (date) => {
    const newDate = date.split('/');
    const year = newDate.pop();
    newDate.unshift(year);
    return newDate.join("/");
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    const newCheckIn = dateChanger(checkInDate);
    const newCheckOut = dateChanger(checkOutDate);



    const reservationDetails = {
      numOfGuests: guests,
      checkInDate: newCheckIn,
      checkOutDate: newCheckOut,
      listingId: listing.id
    }


    const res = await dispatch(postCreateReservation(reservationDetails))


    if (res.errors === "Awesome Made!") {

      return history.push("/");
    } else {
      setErrors(true);
    }
    
    
  }


  useEffect(() => {
    //if menu is not open, nothing happens
    if (!showMenu) return;

    //function that sets menu to false 
    const closeMenu = (e) => {
        const current_target = document.querySelector(".reservation-check-in-check-out-calendar-container");
        const current_children = Array.from(current_target.querySelectorAll("*"))

        if (e.target === current_target || current_children.includes(e.target)) {return};
        setShowMenu(false);   
    };
    
    //adds event listener that closes menu if someone clicks anywhere in the page
    document.addEventListener("click", closeMenu);
    return () => document.removeEventListener("click", closeMenu);
  }, [showMenu]);


  useEffect(() => {
    //if menu is not open, nothing happens
    if (!showGuestsMenu) return;

    //function that sets menu to false 
    const closeMenu = (e) => {
        const current_target = document.querySelector(".reservation-form-guests-container");
        const current_children = Array.from(current_target.querySelectorAll("*"))
        const element = document.querySelector(".reservation-form-guests-container")
        if (element) element.classList.remove("reservation-form-guests-container-active")

        if (e.target === current_target || current_children.includes(e.target)) {return};
        setShowGuestsMenu(false);   
    };
    
    //adds event listener that closes menu if someone clicks anywhere in the page
    document.addEventListener("click", closeMenu);
    return () => document.removeEventListener("click", closeMenu);
  }, [showGuestsMenu]);



  return (
    <div className="show-body-reservation">
      <div className="reservation-container">
          <div className="reservation-div">
              <div className="reservation-title">
                  <div className="reservation-title-price-night">
                      <span className="reservation-title-price">${listing.price}</span>
                      <span className="reservation-title-night"> night</span>
                  </div>
                  <span></span>
              </div>

              <div className="reservation-form-container">
                <form onSubmit={handleSubmit}>
                  <div className="reservation-form-input">
                    <button className="reservation-form-date-container" onClick={handleToggleMenu}>
                      <div className="check-in-form">
                        <span className="check-in-text">CHECK-IN</span>
                        { checkInDate ? <span className="check-in-input">{checkInDate}</span> : <span className="check-in-input">Add date</span>}
                      </div>
                      <div className="check-out-form">
                        <span className="check-out-text">CHECKOUT</span>
                        { checkOutDate ? <span className="check-in-input">{checkOutDate}</span> : <span className="check-in-input">Add date</span>}
                      </div>
                      { showMenu && <ReservationCalendar handleCheckinDate={handleCheckinDate} handleCheckoutDate={handleCheckoutDate} listingId={listing.id} startingDate={checkInDate} endingDate={checkOutDate}/>}
                    </button>
                    <div className="reservation-form-guests-container" onClick={handleToggleGuestMenu}>
                      <span className="guests-text">GUESTS</span>
                      { guests === 1 ? <div className="guests-input">{guests} guest</div> : <div className="guests-input">{guests} guests</div> }
                      {showGuestsMenu && <GuestsDropDown guests={guests} listing={listing} intervalGuestsDown={intervalGuestsDown} intervalGuestsUp={intervalGuestsUp} coolMethod={closeGuestMenu}/>}
                    </div>
                                        
                  </div>

                  <button className="reservation-submit-button" type="submit">
                    <span >Reserve</span> 
                  </button>
                  {errors ?
                  <div className="cool-errors">
                    <div  style={{ color: "#c13515", fontSize: "16px" }}>
                        <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
                    </div>
                    
                    <div >
                        <span className="sign-up-error">Log in to reserve a listing</span>        
                    </div>
                  </div> : null }                
                </form>


              </div>

          </div>
      </div>
    </div>    
  )

}