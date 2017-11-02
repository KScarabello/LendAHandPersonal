import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import {Button} from 'react-bootstrap';


export default class Splashcontent extends Component{
    render (){
        const logoStyle = {fontFamily: "Racing Sans One", fontSize: "60"}
        
        
        return(
            <div className="content-container">
                <div className="content-text">
                    <div className="asking-for-help"> 
                            <h1>Asking for help is hard.</h1>
                    </div>
                    <div className="logo-image">
                        <img src="https://vignette3.wikia.nocookie.net/community-sitcom/images/e/e9/Friends.png/revision/latest?cb=20140212223818" />
                    </div>
                    <div className="makes-it-easier">
                        <h1><span style={logoStyle}> Lend A Hand </span> makes it easier.</h1>
                    </div>
                    <div className="learn-more">
                      <Link to='/about'> <Button type="button" className=" btn-lg btn-outline-primary">Learn more</Button></Link>
                    </div>
                </div>
            </div>





        )
        
    }

}