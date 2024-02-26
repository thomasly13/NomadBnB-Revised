import "./Navigation.css"
import { ProfileButton } from "./ProfileButton";
import { NavLink } from "react-router-dom";


export const NavigationBar = () => {
    return (
        <div className="nav-header">
            <div className="main-nav-bar">  
                <NavLink className="companyLogo" to="/">
                    <div className="companyIcon" style={{ color: "#ff385c", fontSize: "50px" }}>
                        <i className="fa-brands fa-airbnb"></i>
                    </div>      
                    <span>NomadBnB</span>          
                </NavLink>


                < ProfileButton />
            </div> 
            <hr className="nav-line"></hr>    
        </div>

    )
};