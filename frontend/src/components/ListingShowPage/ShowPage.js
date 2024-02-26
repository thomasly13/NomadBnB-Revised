import { useEffect} from "react";
import { useSelector, useDispatch} from "react-redux";
import { fetchListingDetail } from "../../store/listing";
import { useParams } from "react-router-dom";
import "./ShowPage.css";
import { ShowPageNavigation } from "./Navigation/ShowPageNavigation";
import { ShowBody } from "./Body/ShowBody";


export const ListingShow = () => {
    const {listingId} = useParams();
    const dispatch = useDispatch();

  
    const listing = useSelector(state => state.listing[listingId]);


    useEffect(() => {
        window.scrollTo({top: 0, left:0 , behavior: "smooth"})
        dispatch(fetchListingDetail(listingId))
    }, [])


    return (
        <>
            { listing === undefined ? null :
                <div className="show-page">
                    < ShowPageNavigation />    
                    < ShowBody listing={listing} />      
                </div>}
    
        </>

    )
};

