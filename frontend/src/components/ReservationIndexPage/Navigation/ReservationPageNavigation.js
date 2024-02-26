import { NavLink } from "react-router-dom";
import "./ReservationPageNavigation.css"
import { ProfileButton } from "../../FrontPage/Navigation/ProfileButton";

export const ReservationPageNavigation = () => {

    return (
        <header className="show-nav-header">
            <div className="main-show-nav-bar">  
                <NavLink className="companyLogo" to="/">
                    <div className="companyIcon" style={{ color: "#ff385c", fontSize: "50px" }}>
                        <i className="fa-brands fa-airbnb"></i>
                    </div>      
                    <span>NomadBnB</span>          
                </NavLink>


                < ProfileButton />
            </div> 
            <hr className="nav-line"></hr>    
        </header>

    )
};