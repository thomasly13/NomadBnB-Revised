import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import './reset.css'
import App from './App';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import configureStore from './store/index.js';
import csrfFetch, { restoreCSRF } from './store/csrf';
import * as sessionActions from './store/session';
import { ModalProvider } from './context/Modal';


//creates the store
const store = configureStore();

//for dev purposes
if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
}

//the root component
const Root = () => {
  return (
    <ModalProvider>
      <Provider store={store}>
        <BrowserRouter>
          <App />
        </BrowserRouter>
      </Provider>
    </ModalProvider>
  )
}

//renders the page
const renderApplication = () => {
  ReactDOM.render(
  <React.StrictMode>
    <Root />
  </React.StrictMode>,
  document.getElementById('root')
  );
}

//decides which application to render
if (
  sessionStorage.getItem("currentUser") === null ||
  sessionStorage.getItem("X-CSRF-Token") === null 
) {
  store.dispatch(sessionActions.restoreSession()).then(renderApplication);
} else {
  renderApplication();
}