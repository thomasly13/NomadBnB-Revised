import "../ShowBody.css"

export const ShowHeader = ({listing, locationHelper}) => {

  return (
    <>
      <div className="show-header">
        <h1 className="listing-name">{listing.name}</h1>
        <h2 className="listing-location">{locationHelper()}</h2>                    
      </div>
      <div className="show-image-container">
        <img src={listing.images[0]} className="show-left-image"/>
        <div className="smaller-image-container">
            <div className="smaller-image-column-1">
                <img src={listing.images[1]} className="show-image"/>
                <img src={listing.images[2]} className="show-image-2"/>
            </div>
            <div className="smaller-image-column-2">
                <img src={listing.images[3]} className="show-image"/>
                <img src={listing.images[4]} className="show-image-2"/>
            </div>
        </div>
      </div>  
    </>
  )
}