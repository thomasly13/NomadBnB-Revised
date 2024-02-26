import "./PreviousReservationIndexBody.css"
import { ReservationImage } from "./ReservationImage"
import { ReservationContainerText } from "./ReservationContainerText"
import { useState, useEffect } from "react"
import { useHistory } from "react-router-dom/cjs/react-router-dom.min"
import { useDispatch } from "react-redux"
import { login, logout } from "../../../store/session"


export const PastReservationIndexBody = ({user, reservation}) => {
    const dispatch = useDispatch();
    const history = useHistory();

    const previousReservations = Object.values(reservation.previousReservations)



    const handleDemo = async (e) => {
        e.preventDefault();
        dispatch(logout());
        dispatch(login({ email: "demo@user.com" , password: "password" }))
        history.push("/users/1/reservations")
    }

    return (
        <>
        { (previousReservations === undefined ) ? null : 
        <main className="reservation-index-body-container">
            <div className="reservation-current-trips-container">
                <h1 className="reservation-current-title">Past Trips</h1>
                { previousReservations[0] === null ? 
                <div className="reservation-current-trips-1">
                    <div className="coolHand" style={{ color: "#ff385c", fontSize: "48px" }}>
                        <i className="fa-solid fa-hand-peace"></i>
                    </div>
                    <span className="state-searching-title">No past trips...try our demo!</span>
                    <span className="state-searching-description">Click below to be logged out and logged into our demo user </span>
                    <button onClick={handleDemo} className="start-searching-button">Demo User</button>

                    
                </div> :

                <div className="reservation-current-trips">
                    {previousReservations.map(reservation => {
                        return (
                            <div className="current-reservation-container"  onClick={() => {history.push(`/users/${user.id}/reservations/${reservation.id}`)}} >
                                < ReservationImage reservation={reservation}/>
                                < ReservationContainerText reservation={reservation} />
                            </div>
                        )
                    })} 
                </div>
                    }
            </div>

        </main>}        
        </>

    )
}