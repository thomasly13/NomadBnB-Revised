import "../../ShowBody.css"
import 'react-date-range/dist/styles.css'; // main style file
import 'react-date-range/dist/theme/default.css'; // theme css file
import { DateRange } from 'react-date-range';
import { useState } from "react";
import { useSelector } from "react-redux";


export const ReservationCalendar = ({handleCheckinDate, handleCheckoutDate, endingDate, startingDate, listingId}) => {

    const reservations = useSelector(state => state.listing[listingId].reservations)

    const blackOutDates = []

    reservations.map(reservation => {
        blackOutDates.push(new Date(reservation))
    });

    const [dateState, setDateState] = useState([
        {
          startDate: new Date(),
          endDate: new Date(),
          key: 'selection',
          color: "black",
        }
    ]);

    const handleSelect = (date) => {
        setDateState([date.selection]);
        handleCheckinDate(date.selection.startDate);            


        if ( date.selection.endDate !== date.selection.startDate) {
            handleCheckoutDate(date.selection.endDate);
        }
    }

    return (
        <div className="reservation-check-in-check-out-calendar-container">
            <DateRange
                ranges={dateState}
                onChange={handleSelect}
                months={2}
                direction="horizontal"
                preventSnapRefocus={true}
                showSelectionPreview={true}
                moveRangeOnFirstSelection={false}
                minDate={new Date()}
                disabledDates={blackOutDates}
            />
        </div>
    )
}   