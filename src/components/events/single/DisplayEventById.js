import React, {Component} from 'react';
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
import FlatButton from 'material-ui/FlatButton';
import {connect} from 'react-redux';
import axios from 'axios';
import {Link} from 'react-router-dom';
import Dialog from 'material-ui/Dialog';
import RaisedButton from 'material-ui/RaisedButton';



class DisplayEventById extends Component {
    constructor(props){
        super(props)

            this.state = {
                currentEvent: [],
                open: false,
                open2: false,
                isSignedUp: false



            }

       



    }


 handleOpen = () => {
    this.setState({open: true});
  };

handleSignUpClose = () => {
    this.setState({
        open: false,
        isSignedUp: true
    });
  };

handleCancel = (eventId, userId) => {
    let events ={
        eventId: eventId,
        userId: userId
    }

    axios.delete(`/api/event/${eventId}`)
         .then(response => console.log(response))
}

 handleSignUp = (eventId, userId) =>{
   
    // this.setState({isSignedUp: true, open: true})

    let events = {
        eventId: eventId, 
        userId: userId
    }

    

    axios.post('/api/eventtouser', events)
        .then(response => {
            console.log(response)
            
            
    // this.setState({isSignedUp: true})
            
        })

    console.log("signedup", this.state.isSignedUp, "open", this.state.open)

 }
    render(){
        // console.log(this.props.currentEventId.title)
        //  console.log("current event id: ", this.props.currentEventId)
        //  console.log(this.state.currentEvent)
        //  console.log(this.state.currentEvent.title)
        //  console.log(this.state.currentEvent.description)
        
        console.log(this.props)
         return(

         <div className="bigger-container">   
            <div className="display-event-container">
                
                <div className="card-container">
                    
                    <Card className='card'>
                          
                        <CardMedia
                        overlay={<CardTitle title={this.props.currentEventId.title} subtitle={this.props.currentEventId.venue} />}
                        >
                            <img src={this.props.currentEventId.imageurl} alt="" />
                        </CardMedia>

                        <CardTitle title={this.props.currentEventId.title} subtitle={this.props.currentEventId.address} />
                        <CardText> 
                        <p><b>{this.props.currentEventId.description}</b></p>

                        <p><b>Where?:</b> {this.props.currentEventId.venue}</p>
                        <p><b>Address:</b> {this.props.currentEventId.address}</p>
                        <p><b>City:</b> {this.props.currentEventId.city}</p>
                        <p><b>Date:</b> {this.props.currentEventId.date}</p>
                        <p><b>Starts at: </b>{this.props.currentEventId.starttime}</p>
                        <p><b>Ends at:</b> {this.props.currentEventId.endtime}</p>
                        <p><b>Any perks?</b> {this.props.currentEventId.perks}</p>
                        <p><b>Category:</b> {this.props.currentEventId.category}</p>

                        </CardText>

                        <CardActions>
                                                     
                              {this.state.isSignedUp 

                        ?
                        <div>
                        <RaisedButton label="Cancel" onClick={this.handleCancel} />
                            <Dialog
                            title="Sorry you can't make it!"
                            modal={false}
                            open={this.state.open2}
                            onRequestClose={this.handleClose}
                            >
                            Thanks for letting us know!                      
                            </Dialog>
                        </div> 
                           :  
                        <div>
                            <RaisedButton label="Sign Me Up!" onClick={() => {
                                this.handleSignUp(this.props.currentEventId.id, this.props.user.id)
                                this.handleOpen()}} />
                            <Dialog
                            title="Thanks for lending a hand!"
                            
                            modal={false}
                            open={this.state.open}
                            onRequestClose={this.handleSignUpClose}
                            >
                            You are all signed up! Please be prompt in your arrival!
                            
                            </Dialog>
                        </div>
                              } 
                                        
                        
                        </CardActions>

                        
                    </Card>


                </div>
            </div>
        </div>  
        )
    }


}

function mapStateToProps(state){
    return {
        currentEventId: state.currentEventId,
        user: state.user
    }
}

export default connect(mapStateToProps)(DisplayEventById);