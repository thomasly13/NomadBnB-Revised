import {createStore, combineReducers, applyMiddleware, compose } from 'redux';
import thunk from 'redux-thunk';
import sessionReducer from './session';
import listingReducer from './listing';
import userReducer from './user';
import reservationReducer from './reservation';
import reviewReducer from './review';



//root reducer
const rootReducer = combineReducers({
  session: sessionReducer,
  listing: listingReducer,
  user: userReducer,
  reservation: reservationReducer,
  review: reviewReducer
});


let enhancer;

//applies middleware to code
if (process.env.NODE_ENV === 'production') {
  enhancer = applyMiddleware(thunk);
} else {
  const logger = require('redux-logger').default;
  const composeEnhancers =
    window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ || compose;
  enhancer = composeEnhancers(applyMiddleware(thunk, logger));
}

//creates the store to our liking
const configureStore = (preloadedState) => {
    return createStore(rootReducer, preloadedState, enhancer);
};

export default configureStore