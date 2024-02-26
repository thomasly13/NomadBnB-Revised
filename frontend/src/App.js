import React, { useEffect } from 'react';
import { Route, Switch } from "react-router-dom";
import { FrontPageBody } from './components/FrontPage/Body/Body.js';
import { ListingShow } from './components/ListingShowPage/ShowPage.js';
import "./index.css"
import { useDispatch } from 'react-redux';
import { ReservationIndex } from './components/ReservationIndexPage/ReservationIndex.js';
import { ReservationDetail } from './components/ReservationIndexPage/ReservationDetail/ReservationDetail.js';
import { CoolFooter } from './components/Footer/footer.js';






//app component
function App() {
  

  return (
    <div className="App">
      
      <Switch>
        <Route exact path="/listings/:listingId">
          <ListingShow/>
        </Route>
        <Route  exact path="/users/:userId/reservations/:reservationId">
          < ReservationDetail />
        </Route>
        <Route exact path="/users/:userId/reservations">
          <ReservationIndex />
        </Route>
        <Route exact path="/">
          <FrontPageBody />
        </Route>
      </Switch>
      {/* <CoolFooter /> */}

    </div>

  );
}

export default App;
