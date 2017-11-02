import React, {Component} from 'react';
import {Carousel} from 'react-bootstrap-carousel';
import 'react-bootstrap-carousel/dist/bootstrap.min.css';
import 'react-bootstrap-carousel/dist/react-bootstrap-carousel.css';
import {React_Bootstrap_Carousel} from 'react-bootstrap-carousel';

export default class Slider extends Component{
    render(){
        return(
            <div>
<React_Bootstrap_Carousel
            animation={true}
            onSelect={this.onSelect}
            className="carousel-fade"
            indicators={false}
            wrap={true}
          >
             
              
           <div className="gif-slide1">    
               <h1>Discover what's possible when people come together!</h1>          
                   
           </div> 
            <div className="gif-slide2">
                         
            </div>

            <div className="gif-slide3">
                <div className="slide3-text">
                      <h1>See a need.
                      Recruit some Lenders.
                      Solve a problem.</h1>
                      <p>Start A <span>Lend A Hand</span> Project Today</p>
                </div>
            </div>
            
            <div className="gif-slide4">
                
            </div>
          </React_Bootstrap_Carousel>




           </div>
        )
    }
}