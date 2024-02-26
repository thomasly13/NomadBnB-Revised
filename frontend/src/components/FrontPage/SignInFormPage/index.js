import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { login, signin } from "../../../store/session";
import "./SignIn.css"
import { NewSignUpPage } from "./SIgnUp";
import { ExistingSignInPage } from "./LogIn";



export function SignInFormPage({modalFunction}) {

    // gives access to dispatch
    const dispatch = useDispatch();

    //gets the current user
    const sessionUser = useSelector(state => state.session.user);

    //states of credentials
    const [email, setEmail] = useState("");

    //current form displaying 

    const [currentForm, setcurrentForm] = useState("Email Sign In");


    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />;


    const handleEmailSignInSubmit = async (e) => {
        //stops the default functionality of a form submit
        e.preventDefault();


        //makes a request to see if the email is in the database
        const res = await dispatch(signin(email))

        if (res === 'Cool') {
          setcurrentForm("Sign In")
        } else {
          setcurrentForm("Sign Up")
        }   
    };

    const handleGoBack = (e) => {
      setcurrentForm("Email Sign In")
    };


    //demo sign in function
    const handleDemoSignIn = async () => {
      //demo sign in animation
      setTimeout(()=> {setEmail("d")}, 200);
      setTimeout(()=> {setEmail("de")}, 400);
      setTimeout(()=> {setEmail("dem")}, 600);
      setTimeout(()=> {setEmail("demo")}, 800);
      setTimeout(()=> {setEmail("demo@")}, 1000);
      setTimeout(()=> {setEmail("demo@u")}, 1200);
      setTimeout(()=> {setEmail("demo@us")}, 1400);
      setTimeout(()=> {setEmail("demo@use")}, 1600);
      setTimeout(()=> {setEmail("demo@user")}, 1800);
      setTimeout(()=> {setEmail("demo@user.")}, 2000);
      setTimeout(()=> {setEmail("demo@user.c")}, 2200);
      setTimeout(()=> {setEmail("demo@user.co")}, 2400);
      setTimeout(()=> {setEmail("demo@user.com")}, 2600);

      //demo sign in request
      setTimeout( () => {
        dispatch(login({ email: "demo@user.com" , password: "password" }))}, 2500)
    };


    //Email Sign In Constant
    const EmailSignInPage = (
      <div className="email-sign-in-page">
        <div className="exit-button" style={{ color: "#222222", fontSize: "18px" }} onClick={modalFunction}>
            <i className="fa-solid fa-xmark"></i>
        </div> 
        <div className="email-sign-in-header">
 
            <h2>Log in or sign up </h2>
        </div>
        
        <hr className="email-sign-in-form-line"></hr>

        <div className="email-sign-in-form-container"> 
            <form onSubmit={handleEmailSignInSubmit}>
                <h2>Welcome to Nomadbnb</h2>  
                <div className="email-sign-in-form-label">
                <label>
                    <div className="email-sign-in-form-input">
                    <input
                        type="email"
                        value={email}
                        placeholder="Email"
                        onChange={(e) => setEmail(e.target.value)}
                        required
                    />  
                    </div>
                </label>
                </div>
                <button className="email-submit-button"type="submit">
                <span>Continue</span>
                </button>

                
            </form> 

        </div>
        <h2 className="or-line-block"><span>or</span></h2>

        <button className="demo-login-button" onClick={handleDemoSignIn}>
            <span>Log in with Demo</span>
        </button>

  
      </div>
    )

    let renderForm;

    //displays a form depending on the state currentForm
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
    if (currentForm === 'Email Sign In') {
      renderForm = EmailSignInPage
    }
    else if (currentForm === 'Sign In') {
      renderForm = <ExistingSignInPage email={email} goBack={handleGoBack}/>
    }
    else {
      renderForm = <NewSignUpPage emailFiller={email} goBack={handleGoBack} />
    };
    
    
    //returns the rendered form
    return (
      <>
        {renderForm}
      </>

    );
}

//TODO an exit for the email sign in page
//TODO a back for the sign-in and sign-up page


export default SignInFormPage;