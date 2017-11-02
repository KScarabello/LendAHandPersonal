import React,{Component} from 'react';


export default class Splashcontent2 extends Component{
    render (){
        const logoStyle = {fontFamily: "Racing Sans One", fontSize: "60"}
        return(
            <div className="content-container">
                <div className="content-text">
                    <div className="see-a-need"> 
                            <h1>See a need.</h1>
                    </div>
                   
                    <div className="recruit-some-lenders">
                        <h1>Recruit some Lenders.</h1>

                    </div>
                    <div className="solve-a-problem">
                        <h1>Solve a problem.</h1>
                    </div>
                </div>
            </div>





        )
        
    }

}