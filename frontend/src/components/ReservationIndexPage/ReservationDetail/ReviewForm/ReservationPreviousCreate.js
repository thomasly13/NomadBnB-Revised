import { useDispatch} from "react-redux"
import { useState} from "react"
import { createNewReview } from "../../../../store/review";
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export const ReservationPreviousCreate = ({reservation, review}) => {

    const history = useHistory()

    const dispatch = useDispatch();

    const [rating, setRating] = useState(1);

    const [body, setBody] = useState("");

    const handleCreate = async (e) => {
        e.preventDefault();

        const revBody = {
            body: body,
            rating: rating,
            listingId: reservation.listingId,
            reservationId: reservation.id
        }

        const res = await dispatch(createNewReview(revBody))
        history.push(`/users/${reservation.renterId}/reservations`)
    }

    return (
        <>
            <div className="super-cool-edit-container">
                <form onSubmit={handleCreate}>
                    <span className="rate-your-stay">Rate your Stay</span>
                    <div className="review-create-rating-container">
                        <div onClick={() => {setRating(1)}}>
                            {rating > 0 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div> : 
                            <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div>}                        
                        </div>
                        <div onClick={() => {setRating(2)}}>
                            {rating > 1 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div> : 
                            <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div>}                        
                        </div>
                        <div onClick={() => {setRating(3)}}>
                            {rating > 2 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div> : 
                            <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div>}                        
                        </div>
                        <div onClick={() => {setRating(4)}}>
                            {rating > 3 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div> : 
                            <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div>}                        
                        </div>
                        <div onClick={() => {setRating(5)}}>
                            {rating > 4 ? <div style={{ color: "#ecd041", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div> : 
                            <div style={{ color: "#c8cdd5", fontSize: "44px" }}>
                                <i className="fa-solid fa-star"></i>
                            </div>}                        
                        </div>

                    </div>

                    <textarea 
                        className="super-duper-cool-text-area"
                        value={body}
                        placeholder="How was your experience?"
                        cols="50"
                        rows="10"
                        onChange={(e) => setBody(e.target.value)}
                    />

                    <button className="reservation-edit-button" type="submit">
                        <span>Submit Review</span> 
                    </button> 

                </form>
            </div>
        </>
    )
}