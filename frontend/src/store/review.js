import csrfFetch from "./csrf"

const RECEIVE_LISTING = 'RECEIVE_LISTING'
const RECEIVE_USER = 'RECEIVE_USER'
const CREATE_REVIEW = 'CREATE_REVIEW'
const EDIT_REVIEW = 'EDIT_REVIEW'
const DELETE_REVIEW = 'DELETE_REVIEW'
const RECEIVE_RESERVATION = 'RECEIVE_RESERVATION'

const createReview = (payload) => {
    return {
        type: CREATE_REVIEW,
        payload
    }
}

const editReview = (payload) => {
    return {
        type: EDIT_REVIEW,
        payload
    }
}

const deleteReview = (payload) => {
    return {
        type: DELETE_REVIEW,
        payload
    }
}




export const createNewReview = (reviewBody) => async (dispatch) => {
    const response = await csrfFetch('/api/reviews', {
        method: 'POST', 
        body: JSON.stringify(reviewBody)
    })

    const data = await response.json();

    dispatch(createReview(data))
}

export const editExistingReview = (reviewBody) => async (dispatch) => {

    const response = await csrfFetch(`/api/reviews/${reviewBody.id}`, {
        method: 'PATCH',
        body: JSON.stringify(reviewBody)
    })

    const data = await response.json();

    dispatch(editReview(data))
}

export const deleteExistingReview = (reviewId) => async (dispatch) => {

    const reponse = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE',
    })

    const data = await reponse.json();
    dispatch(deleteReview(data))
    
}


const reviewReducer = (state, action) => {
    Object.freeze(state);
    const nextState = {...state};


    switch (action.type) {
        case RECEIVE_LISTING:
            return {...action.payload.reviews};
        case RECEIVE_USER:
            return {...action.payload.reviews};
        case CREATE_REVIEW:
            return {...action.payload.reviews};
        case EDIT_REVIEW:
            return {...action.payload.reviews};
        case DELETE_REVIEW:
            return {...action.payload.reviews};
        case RECEIVE_RESERVATION:
            return {...action.payload.reviews}     
        default:
            return nextState;
    }
}

export default reviewReducer;