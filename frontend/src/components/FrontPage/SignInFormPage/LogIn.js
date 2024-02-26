import React, { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import { login } from "../../../store/session";
import "./SignIn.css"


export const ExistingSignInPage = ({email, goBack}) => {

    // gives access to dispatch
    const dispatch = useDispatch();

    //gets the current user
    const sessionUser = useSelector(state => state.session.user);
    
    //states of credentials
    const [password, setPassword] = useState("");

    
    // state of error messages
    const [errors, setErrors] = useState({});

    //return to home if user is logged in
    if (sessionUser) return <Redirect to="/" />;


    const handleExistingSignInSubmit = async (e) => {
        //stops instant refresh from form submit
        e.preventDefault();
  
        //calls thunk action and gets a response
        const res = await dispatch(login({ email, password }))
        //sets errors to any errors the response gets\
        if (res.errors) {
          if (res.errors.length > 0){
            setErrors({password: res.errors})
          } else {
            setErrors({})
          }
                    
        }

    }

    //log in errors component
    const LogInErrors = ({errors}) => {
        return (
          <div className="errors-container">
            <div className="errorLogo" style={{ color: "#c13515", fontSize: "44px" }}>
              <i className="fa-sharp fa-solid fa-circle-exclamation"></i>
            </div>
            <div className="error-messages">
              <span className="sign-in-bold">Let's try that again</span>
              <span className="sign-in-error">{errors.password}</span>        
            </div>
              
          </div>
  
        )
    }
  

    //login page component
    return (
        <div className="sign-in-page">
          <div className="exit-button" style={{ color: "#222222", fontSize: "18px" }} onClick={goBack}>
            <i className="fa-solid fa-chevron-left"></i>
          </div> 
          <div className="sign-in-header">
              <h2>Log in</h2>
          </div>

          <div className="sign-in-form-container"> 
              <form onSubmit={handleExistingSignInSubmit}>
              {errors.password ? < LogInErrors errors={errors} /> : null}

              <div className="sign-in-form-label">
                  <label>
                  <div className="sign-in-form-input">
                      <input
                          type="password"
                          value={password}
                          placeholder="Password"
                          onChange={(e) => setPassword(e.target.value)}
                          required
                      />  
                  </div>

                  </label>
              </div>  

              <button className="sign-in-submit-button" type="submit">
                  <span>Login</span>
              </button>
              
              </form>
          </div>


        </div>    
    )
}
