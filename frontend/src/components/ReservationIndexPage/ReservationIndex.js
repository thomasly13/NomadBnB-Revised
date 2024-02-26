import { ReservationIndexBody } from "./FutureTrips/ReservationIndexBody"
import { ReservationPageNavigation } from "./Navigation/ReservationPageNavigation"
import { useParams } from "react-router-dom";
import { useSelector, useDispatch} from "react-redux";
import { useEffect} from "react";
import { fetchUserDetail } from "../../store/user";
import { PastReservationIndexBody } from "./PastTrips/ReservationIndexBody";


export const ReservationIndex = () => {
    const {userId} = useParams();
    const dispatch = useDispatch();

    const user = useSelector(state => {return state.session.user})
    const reservation = useSelector(state => state.reservation)

    useEffect(() => {
        window.scrollTo({top: 0, left:0 , behavior: "smooth"})

        dispatch(fetchUserDetail(userId))
    }, [dispatch, userId])


    return (
        <>
            { user === undefined || Object.keys(reservation).length === 0 ? null :
                <div>
                    < ReservationPageNavigation/>
                    < ReservationIndexBody user={user} reservation={reservation} userId={userId}/>
                    < PastReservationIndexBody user={user} reservation={reservation} userId={userId} />        
                </div>
              
            }
   
        </>

    )
}