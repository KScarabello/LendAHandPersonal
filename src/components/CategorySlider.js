import React, {Component} from 'react';
import Carousel from 'react-bootstrap-carousel';
import 'react-bootstrap-carousel/dist/bootstrap.min.css';
// import 'react-bootstrap-carousel/dist/react-bootstrap-carousel-css';
import {React_Bootstrap_Carousel} from 'react-bootstrap-carousel';
import {connect} from 'react-redux';

 class CategorySlider extends Component{
    render(){

        console.log(this.props.currentCat)
        return(
            <div className="event-slider-container">
                <React_Bootstrap_Carousel
                    animation={true}
                    onSelect={this.onSelect}
                    className="carousel-fade"
                    indicators={false}
                >
                    
                    
                <div className="event-slide1">    
                    <h1>{this.props.currentEventId[0].title}</h1>          
                        
                </div> 
                    <div className="event-slide2">
                        <h1>{this.props.currentEventId[1].title}</h1>
                    </div>

                    <div className="event-slide3">
                       <h1>{this.props.currentEventId[2].title}</h1>
                    
                    </div>
                    
                    <div className="event-slide4">
                        <h1>>{this.props.currentEventId[3].title}</h1>
                    </div>
                </React_Bootstrap_Carousel>




           </div>
        )
    }


}

function mapStateToProps(state){
    return state
}


export default connect(mapStateToProps)(CategorySlider)