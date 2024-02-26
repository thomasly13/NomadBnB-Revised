import { useDispatch,  useSelector} from "react-redux"
import { useState} from "react"
import { deleteExistingReview, editExistingReview } from "../../../../store/review";
import "../ReservationDetail.css"
import { useHistory } from "react-router-dom/cjs/react-router-dom.min";


export const ReservationPreviousEdit = ({reservation, review}) => {

    const history = useHistory()
    const dispatch = useDispatch();
   

    const [rating, setRating] = useState(review ? review.rating : 1);

    const [body, setBody] = useState(review ? review.body : "");

    const handleEdit = async (e) => {
        e.preventDefault();
        const revBody = {
            body: body,
            rating: rating,
            listingId: reservation.listingId,
            reservationId: reservation.id,
            id: reservation.reviewId
        }

        const res = await dispatch(editExistingReview(revBody))
        history.push(`/users/${reservation.renterId}/reservations`)
    }

    const handleDelete = async (e) => {
        e.preventDefault();

        dispatch(deleteExistingReview(reservation.reviewId))
        history.push(`/users/${reservation.renterId}/reservations`)
    }

    return (
        <>
            <div className="super-cool-edit-container"> 
                <form onSubmit={handleEdit}>
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
                        <span>Edit Review</span> 
                    </button> 

                </form>
                <button onClick={handleDelete} className="reservation-edit-button" >
                    <span>Delete Review</span> 
                </button> 
            </div>
        </>
    )
}