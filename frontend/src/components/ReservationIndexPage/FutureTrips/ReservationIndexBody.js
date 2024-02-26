import { useDispatch } from "react-redux"
import "./ReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { useState} from "react"
import { useHistory } from "react-router-dom"





export const ReservationIndexBody = ({user, userId, reservation}) => {

    const history = useHistory();


    const futureReservations = Object.values(reservation.futureReservations)
    
    const toHome = (e) => {
        e.preventDefault();
        history.push("/")
    }

    return (
        <>
        { (futureReservations === undefined) ? null 
        : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Trips</h1>
                { futureReservations[0] === null ? 
                <div className="reservation-current-trips-1">
                    <div className="coolHand" style={{ color: "#ff385c", fontSize: "48px" }}>
                        <i className="fa-solid fa-hand-peace"></i>
                    </div>
                    <span className="state-searching-title">No trips booked...yet!</span>
                    <span className="state-searching-description">Time to dust off your bads and start planning your next adventure</span>
                    <button onClick={toHome} className="start-searching-button">Start Searching</button>

                    
                </div> 



                : 
                <div className="reservation-current-trips">
                    {futureReservations.map(reservation => {
                        return (
                            <>
                                <div className="current-reservation-container" onClick={() => {history.push(`/users/${userId}/reservations/${reservation.id}`)}}>
                                    < ReservationImage reservation={reservation}/>
                                    < ReservationContainerText reservation={reservation} />
                                </div>
                            </>

                        )
                    })}      
                </div>}

            </div>

        </main>}        
        </>

    )
}