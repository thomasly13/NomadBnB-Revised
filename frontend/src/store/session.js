import csrfFetch from './csrf';


//action Types
const SET_CURRENT_USER = 'session/setCurrentUser';
const REMOVE_CURRENT_USER = 'session/removeCurrentUser';
const SIGN_UP_CURRENT_USER = 'SIGN_UP_CURRENT_USER'

//action controllers
//login action
const setCurrentUser = (user) => {

    return {
        type: SET_CURRENT_USER,
        payload: user
    };
};

const setSignUpUser = (user) => {
    return {
        type: SIGN_UP_CURRENT_USER,
        payload: user
    }
}

//logout action
const removeCurrentUser = () => {
    return {
        type: REMOVE_CURRENT_USER,
   
    };
};

//stores token inside session
const storeCSRFToken = response => {
  const csrfToken = response.headers.get("X-CSRF-Token");
  if (csrfToken) sessionStorage.setItem("X-CSRF-Token", csrfToken);
}

//stores current user into session
const storeCurrentUser = user => {
  if (user) sessionStorage.setItem("currentUser", JSON.stringify(user));
  else sessionStorage.removeItem("currentUser");
}


//login thunk action controller
export const login = (user) => async (dispatch) => {

    const { email, password } = user;
    const response = await csrfFetch('/api/session', {
        method: 'POST',
        body: JSON.stringify({
        email,
        password
        })
    });
    const data = await response.json();
    storeCurrentUser(data.user.currentUser)

    if (data.user.currentUser) dispatch(setSignUpUser(data.user.currentUser)); 

    return data;
};

//TODO logout thunk action controller
export const logout = () => async (dispatch) => {
    const response = await csrfFetch('/api/session', {
        method: 'DELETE'
    });
    storeCurrentUser(null);
    dispatch(removeCurrentUser());
    return response;
};

// signup thunk action controller
export const signup = (user) => async (dispatch) => {
    const { email, password, firstName, lastName } = user;
    const response = await csrfFetch("/api/users", {
      method: "POST",
      body: JSON.stringify({
        email,
        password,
        firstName,
        lastName
      })
    });
    const data = await response.json();
    if (data.user) storeCurrentUser(data.user)
    if (data.user) dispatch(setCurrentUser(data.user)); 
    return data;
};

export const signin = (email) => async (dispatch) => {

    const response = await csrfFetch("/api/users/check", {
        method: "POST",
        body: JSON.stringify({
            email
        })
    });

    const data = await response.json();

    return data.checkmark
};


//restores the session if the user were to refresh
export const restoreSession = () => async dispatch => {
    const response = await csrfFetch("/api/session");
    storeCSRFToken(response);
    const data = await response.json();
    storeCurrentUser(data.user);
    dispatch(setSignUpUser(data.user));
    return response;
};



const initialState = { 
  user: JSON.parse(sessionStorage.getItem("currentUser"))
};


//session reducer that controls the actions
const sessionReducer = (state = initialState, action) => {
    Object.freeze(state) 
    const nextState = {...state};

    switch (action.type) {
        case SIGN_UP_CURRENT_USER:
            return { ...nextState, user: action.payload};
        case SET_CURRENT_USER:
            return { ...nextState, user: action.payload.currentUser };
        case REMOVE_CURRENT_USER:
            return { ...nextState, user: null };
        default:
            return nextState;
    }
};



export default sessionReducer;