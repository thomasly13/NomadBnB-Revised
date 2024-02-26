import "../../ShowBody.css"



export const GuestsDropDown = ({guests, listing, intervalGuestsDown, intervalGuestsUp, coolMethod}) => {
    return (
        <div className="guest-drop-down">
            <div className="guest-drop-down-adults-container">
                <div className="adults-text-container">
                    <span className="adults-text">Adults</span>
                    <span className="adults-age-text">Age 13+</span>
                </div>
                <div className="guest-number-buttons">
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-minus"></i>
                    </div>
                    <span>{guests}</span>
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-plus"></i>
                    </div>
                </div>
            </div>
            <div className="guest-drop-down-children-container">
                <div className="adults-text-container">
                    <span className="adults-text">Children</span>
                    <span className="adults-age-text">Ages 2-12</span>
                </div>
                <div className="guest-number-buttons">
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-minus"></i>
                    </div>
                    <span>{guests}</span>
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-plus"></i>
                    </div>
                </div>  
            </div>
            <div className="guest-drop-down-infants-container">
                <div className="adults-text-container">
                    <span className="adults-text">Infacts</span>
                    <span className="adults-age-text">Under 2</span>
                </div>
                <div className="guest-number-buttons">
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsDown} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-minus"></i>
                    </div>
                    <span>{guests}</span>
                    <div className="guest-reservation-button-counters" onClick={intervalGuestsUp} style={{ color: "#717171", fontSize: "15px" }}>
                        <i className="fa-solid fa-plus"></i>
                    </div>
                </div>  
            </div>
            <span className="disclaimer">This place has a maximum of {listing.numOfGuests} guests, not including infants.</span>
            <span className="close-button" onClick={coolMethod}>Close</span>
        </div>
    )
}