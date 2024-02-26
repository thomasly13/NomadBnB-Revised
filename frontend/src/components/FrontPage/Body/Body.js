import { ListingsIndex } from "../IndexPage/IndexPage"
import { NavigationBar } from "../Navigation/Navigation"
import "./Body.css"

export const FrontPageBody = () => {
   
    return (
        <div className="front-page-body">
            < NavigationBar />
            < ListingsIndex />
            
        </div>
        
    )
}