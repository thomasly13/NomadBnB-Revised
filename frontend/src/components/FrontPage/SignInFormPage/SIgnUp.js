import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { signup } from "../../../store/session";
import "./SignIn.css"

export const NewSignUpPage = ({emailFiller, goBack}) => {
    // gives access to dispatch
    const dispatch = useDispatch();

    //gets the current user
    const sessionUser = useSelector(state => state.session.user);

    //states of credentials
    const [email, setEmail] = useState(emailFiller);
    const [firstName, setFirstName] = useState("");
    const [lastName, setLastName] = useState("");
    const [password, setPassword] = useState("");


    // state of error messages
    const [errors, setErrors] = useState({});

    //current form displaying 



    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />;

    const handleNewSignUp = async (e) => {
        //stops the default functionality of a form submit
        e.preventDefault();

        //resets errors at the start of the request
        setErrors([]);

        //sends sign up request
        const res = await dispatch(signup({ email, firstName, lastName, password }))

        //if signup failed, adds errors to their receptive sections
        if (res.errors) {
          if (res.errors.last_name) {
                setErrors(state => { return {...state, "lastName": "Last name is required."}})
            }

          if (res.errors.password) {
            setErrors(state => { return {...state, "password": "Password is required."}})}

          if (res.errors.first_name) {
            setErrors(state => { return {...state, "firstName": "First name is required."}})
          };      
        }

    };

    //Sign up First Name Error component
    const SignUpFirstNameError = ({errors}) => {
        return (
          <div className="sign-up-first-name-error">
            <div  style={{ color: "#c13515", fontSize: "16px" }}>
              <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
            </div>
            <div >
              <span className="sign-up-error">{errors.firstName}</span>  
            </div>
          </div>
        )
      }
    
    //Sign up Last Name Error component
    const SignUpLastNameError = ({errors}) => {
        return (
            <div className="sign-up-last-name-error">
            <div  style={{ color: "#c13515", fontSize: "16px" }}>
                <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
            </div>
            <div >
                <span className="sign-up-error">{errors.lastName}</span>        
            </div>
            </div>
        )
    }

    //Sign Up Password Error component
    const SignUpPasswordError = ({errors}) => {
        return (
            <div className="sign-up-password-error">
            <div  style={{ color: "#c13515", fontSize: "16px" }}>
                <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
            </div>
            <div >
                <span className="sign-up-error">{errors.password}</span>        
            </div>
            </div>
        )
    }
  

    //adds first name and last name components together
    const SignUpNameError = ({errors}) => {
        return (
          <>
            {errors.firstName ? < SignUpFirstNameError errors={errors}/> : null}
            {errors.lastName ? < SignUpLastNameError errors={errors}/> : null}
          </>
        )
    }
    
    //sign up page component
    return (
    <div className="sign-up-page">
      <div className="exit-button" style={{ color: "#222222", fontSize: "18px" }} onClick={goBack}>
        <i className="fa-solid fa-chevron-left"></i>
      </div> 
      <div className="sign-up-header">
        <h2>Finish signing up</h2>
      </div>

      <hr className="sign-up-form-line"></hr>

      <div className="sign-up-form-container">
        <form onSubmit={handleNewSignUp}>
          <div className="sign-up-name-container">
            <div className="sign-up-first-name-label">
              <label>
                <div className="sign-up-first-name-input">
                  <input
                      type="text"
                      value={firstName}
                      placeholder="First name"
                      onChange={(e) => setFirstName(e.target.value)}
                  />
                </div>
              </label>
            </div>
            <hr className="sign-up-name-line"></hr>
            <div className="sign-up-last-name-label">
              <label>
                <div className="sign-up-last-name-input">
                  <input
                      type="text"
                      value={lastName}
                      placeholder="Last name"
                      onChange={(e) => setLastName(e.target.value)}
                  />
                </div>
              </label>
            </div>
          </div>
          { (errors.firstName || errors.lastName) ? <SignUpNameError errors={errors}/> : <div className="sign-up-name-message">Make sure it matches the name on your government ID.</div> }
          <div className="sign-up-email-container">
            <div className="sign-up-email-label">
              <label>
                <div className="sign-up-email-input">
                  <input
                      type="text"
                      value={email}
                      placeholder="Email"
                      onChange={(e) => setEmail(e.target.value)}
                  />
                </div>
              </label>
            </div> 
            <div className="sign-up-email-message">We'll email you trip confirmations and receipts.</div>               
          </div>

          <div className="sign-up-password-label">
            <label>
              <div className="sign-up-password-input">
                <input
                    type="password"
                    value={password}
                    placeholder="Password"
                    onChange={(e) => setPassword(e.target.value)}
                />
              </div>
            </label>
          </div>

          { errors.password ? < SignUpPasswordError errors={errors}/> : null}
          <div className="contract-div">By selecting Agree and continue, I agree to Airbnb’s Terms of Service, Payments Terms of Service, and Nondiscrimination Policy and acknowledge the Privacy Policy.</div>
          <button className="sign-up-submit-button" type="submit">
            <span>Agree and continue</span> 
          </button>

        </form>  
      </div>

    </div>   
  )}
