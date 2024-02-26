
import { useSelector } from "react-redux"
import "./ReservationIndexBody.css"

export const ReservationContainerText = ({reservation}) => {

    const listing = useSelector(state => state.listing[reservation.listingId])

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
    
    const Location = ({listing}) => {

        return (
        <>
            { listing ? <span className="reservation-location">{listing.address.split(", ")[1]}</span> : null}
            
        </>)
    }

    const Host = ({listing}) => {
        const owner = useSelector(state => state.user[listing.ownerId])

        return (
            <>
                { owner ? <span className="reservation-host">Hosted by {owner.firstName}</span> : null}
            </>
        )   
    }

    const Date = ({reservation}) => {
        let inDate = reservation.checkInDate.split("-")
        let checkInMonth = months[inDate[1]]
        let outDate = reservation.checkOutDate.split("-")
        let checkoutMonth = months[outDate[1]]

        return (
            <>
                <span className="reservation-date">{checkInMonth} {inDate[2]}-{checkInMonth === checkoutMonth ? `${outDate[2]}` : `${checkInMonth} ${outDate[2]}`}, {outDate[0]}</span>
            </>
        )
    }




    return (
        <>  
            <div className="current-reservation-container-text"> 
                <Location listing={listing}/>
                <Host listing={listing} />
                <Date reservation={reservation} />
            </div>
            
        </>
    )
}