import "./CoolFooter.css"


export const CoolFooter = () => {
  return (
    <div className="cool-footer">
      <a className="cool-company-footer" href="https://github.com/thomasly13">
        <div className="companyIcon" style={{ color: "black", fontSize: "50px" }}>
          <i className="fa-brands fa-github"></i>
        </div> 
        <p>Github</p>  
      </a>
      <a className="cool-company-footer" href="https://www.linkedin.com/in/thomas-ly-88559b255">
        <div className="companyIcon" style={{ color: "black", fontSize: "50px" }}>
          <i className="fa-brands fa-linkedin"></i>
        </div>
        <p>Linked In</p>
      </a>
    </div>
  )
}