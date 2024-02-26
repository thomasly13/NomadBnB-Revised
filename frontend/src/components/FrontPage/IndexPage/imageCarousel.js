import { useState } from "react";
import "./ListingsIndex.css"
import { VscChevronLeft } from "react-icons/vsc";
import { VscChevronRight } from "react-icons/vsc";


export const ImageCarousel = ({images, imageIndex}) => {
    const [index, setIndex] = useState(0)
    const [showButton, setShowButton] = useState(false)



    const handleLeftClick = (e) => {
        e.preventDefault();
        if (index === 0) {
            setIndex(images.length - 1)
        } else {
            setIndex(index - 1)
        };
    }

    const handleRightClick = (e) => {
        e.preventDefault();
        if (index === images.length - 1) {
            setIndex(0)
        } else {
            setIndex(index + 1)
        };
    }

    const handleMouseOver = () => {
        setShowButton(true)
    }

    const handleMouseOut = () => [
        setShowButton(false)
    ]

    return (
        <div className="image-container" onMouseOver={handleMouseOver} onMouseLeave={handleMouseOut}>
            {showButton === true ?<div onClick={handleLeftClick} className="left-arrow-button" style={{ fontSize: "28px"}}>
                <VscChevronLeft />
            </div> : null}
            {showButton === true ? <div onClick={handleRightClick} className="right-arrow-button" style={{fontSize: "28px"}}>
                <VscChevronRight />
            </div> : null }    
            <img src={images[index]} className="index-left-image"/>
        </div>

        
    )
}   

// style={{transform: `translateX(-${index * 100}%)`, transition: "transform 0.5s ease-in-out"}}