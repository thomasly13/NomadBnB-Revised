
import { logout } from "../../../store/session";
import React, { useState, useEffect } from "react";
import { useSelector, useDispatch } from 'react-redux';
import './ProfileButton.css'
import { Modal } from "../../../context/Modal";
import SignInFormPage from "../SignInFormPage";
import { useHistory } from "react-router-dom";




export const ProfileButton = () => {


    const history = useHistory();
    //gives access to dispatch
    const dispatch = useDispatch();
    const [showMenu, setShowMenu] = useState(false);
    const [showModal, setShowModal] = useState(false);

  
  
    //finds current user
  
    const sessionUser = useSelector(state => state.session.user);

    //sends a request to log out of the current user
    const handleLogOut = (e) => {
        dispatch(logout());
        return history.push("/");
    }

    const handleModalClose = (e) => {
        setShowModal(false);
    }

    const handleModalOpen = async (e) => {
        setShowModal(true);
    }

    const handleTrip = async (e) => {
        history.push(`/users/${sessionUser.id}/reservations`)
    }


    //helper component to handle to show logout if user is logged in
    const LoggedInNav = () => {
        return (
            <>
                {showMenu && (
                <div className="profile-dropdown">
                    <ul>
                        <li><h2 className="logout-dropdown" onClick={handleTrip}>Trips</h2></li>
                        <li><h2 className="logout-dropdown" onClick={handleLogOut}>Log Out</h2></li>
                    </ul>
                </div>
                )} 
            </>

        )
    }
    //helper component to handle if logged out components
    const LoggedOutNav = () => {
        return (
            <>  
                {/* if menu is set to true, shows dropdown menu*/}
                {showMenu && (
                <div className="profile-dropdown" >
                    <ul>
                        <li><h2 className="signup-dropdown" onClick={handleModalOpen}>Sign Up</h2></li>
                        <li><h2 className="login-dropdown" onClick={handleModalOpen}>Log In</h2></li>
                    </ul>
                </div>
                )} 


                {showModal && (
                    <Modal onClose={handleModalClose}  >
                        <SignInFormPage modalFunction={handleModalClose}/>
                    </Modal>
                )}
            </>
        )
    }
    // variable to hold components
    let sessionLinks;
    
    // saves component depending whether or not user is logged in or not
    if (sessionUser) {
        sessionLinks = <LoggedInNav/>
    } else {
        sessionLinks = <LoggedOutNav />
    }

    //sets menu to true and opens the profile dropdown menu
    const openMenu = () => {
    if (showMenu) return;
        setShowMenu(true);
        const profileElement = document.querySelector(".profileButton")
        if (profileElement) profileElement.classList.add("profileButton-active")
    };
  
    //activates whenever the menu boolean changes
    useEffect(() => {
        //if menu is not open, nothing happens
        if (!showMenu) return;

        //function that sets menu to false 
        const closeMenu = () => {
            setShowMenu(false);  
            const profileElement = document.querySelector(".profileButton")
            if (profileElement) profileElement.classList.remove("profileButton-active") 
        };
        
        //adds event listener that closes menu if someone clicks anywhere in the page
        document.addEventListener("click", closeMenu);
        return () => document.removeEventListener("click", closeMenu);
    }, [showMenu]);


  return (
    <>

        <div className="profileButton-menu">
            <div className="profileButton"onClick={openMenu}>
                <div  className="treeLines" style={{ color: "#595959", fontSize: "16px" }}>
                    <i className="fa-solid fa-bars"></i>
                </div>    
                <div className="profilePicture" style={{ color: "#717171", fontSize: "28.69px" }}>
                    <i className="fa-sharp fa-solid fa-circle-user"></i>
                </div> 
                
            </div>

            {sessionLinks} 
        </div>
        

        
    </>
  );
}
