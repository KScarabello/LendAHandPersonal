import React, { Component } from 'react';
import EventDetails from './EventDetails';
import axios from 'axios';
import { connect } from 'react-redux';
import RaisedButton from 'material-ui/RaisedButton';
import Dialog from 'material-ui/Dialog';
import FlatButton from 'material-ui/FlatButton';
import TextField from 'material-ui/TextField';


class DisplayEvent extends Component {
    constructor() {
        super()

        this.state = {
           open: false,
           canceled: false
          


        }


    // this.onSubmit = this.onSubmit.bind(this);

    }

// onSubmit = () => {
//     return (
//         <div>
//             <Dialog
//             title="You are about to sign up for this event. Are you sure you can make it?"
//             title="Dialog With Date Picker"
           
//             modal={false}
//             open={this.state.open}
//             onRequestClose={this.handleClose}
            
//             />

//         </div>


//     )
// }

handleOpen = () => {
    this.setState({open: true});
  };

  handleClose = () => {
    this.setState({open: false});
  };

onClick = (e) => {
    
    axios.delete('http://localhost:3001/api/event/' + this.props.currentEvent.id)
    
        .then(response =>{
            console.log(response.data)
            this.setState({open: false, canceled: true})
        } )
}
    
   
    render() {

 const actions = [
      <FlatButton
        label="Ok"
        primary={true}
        keyboardFocused={true}
        onClick={this.handleClose}
      />,
    ];



        let styles = {
        button: {
            margin: 12,
        },
        exampleImageInput: {
            cursor: 'pointer',
            position: 'absolute',
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            width: '100%',
            opacity: 0,
  },
};

const spanStyle = {
    fontWeight: 'bold'
}

        // let eventInfo = this.props.currentEvent.map((e,i) => {
        //     return(
        //         <div key={i}>
        //            <div className="displayevent-container">
        //             <div className="event-photo">
        //                 {/* if event photo available, display,
        //                 if not, display holder image */}
        //                 <img src="https://pixy.org/images/placeholder.png" />
        //             </div>
        //             <div className="event-details">
        //                 <div className="event-title">
        //                     {/* //display event title */}
        //                     Nunc neque elit, ullamcorper non aliquet at, suscipit id augue. Ut justo nibh, vulputate eget tincidunt nec
        //                 </div>
        //                 <div className="event-description">
        //                     {/* //display event description */}
        //                     Nunc neque elit, ullamcorper non aliquet at, suscipit id augue. Ut justo nibh, vulputate eget tincidunt nec, aliquet sed elit. Nulla tincidunt blandit aliquam. Nunc molestie facilisis enim. Sed vestibulum tincidunt sagittis. Vestibulum quis ex et est vestibulum iaculis vitae non velit. Sed euismod lacinia molestie. Donec aliquam nisl consequat tortor porta, id interdum orci pulvinar. Etiam leo justo, imperdiet ut tristique eget, fermentum quis arcu.
        //                 </div>
        //                 <div className="event-details">
        //                     {/* //display date, time, venue, address, perks, quantofvols
        //                     //must get user's phone number */}
        //                     adfadf
        //                 </div>
        //             </div>
        //         </div>
        //         </div>
        //     )

        // })


        // let eventInfo = JSON.stringify(this.state.events)


        return (

            <div className="displayevent-container">
                <div className="event-photo">
                    {this.props.currentEvent ?

                        <img src={this.props.currentEvent.imageurl} />
                        :
                        <img src="https://pixy.org/images/placeholder.png" />

                    }

                    {/* if event photo available, display,
                    if not, display holder image */}
                    {/* <img src="https://pixy.org/images/placeholder.png" /> */}
                </div>
                <div className="event-details">
                    <div className="event-title">
                        {/* //display event title */}
                        {this.props.currentEvent && this.props.currentEvent.title}
                    </div>
                    <div className="event-description">
                        {/* //display event description */}
                        {this.props.currentEvent && this.props.currentEvent.description}
                    </div>
                    <div className="event-details">
                        

                       <div className="event-text">  
                          <span style={spanStyle}> Event date:</span> {this.props.currentEvent && this.props.currentEvent.date}
                       </div>
                       <div className="event-text">
                          <span style={spanStyle}> Event start time:</span> {this.props.currentEvent && this.props.currentEvent.starttime}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}> Event end time:</span>  {this.props.currentEvent && this.props.currentEvent.endtime}
                       </div>
                       <div className="event-text">
                          <span style={spanStyle}> Location: </span>{this.props.currentEvent && this.props.currentEvent.venue}
                       </div>
                       <div className="event-text">
                          <span style={spanStyle}>  Address:</span> {this.props.currentEvent && this.props.currentEvent.address}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}>  City: </span> {this.props.currentEvent && this.props.currentEvent.city}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}>  Zipcode:</span> {this.props.currentEvent && this.props.currentEvent.zipcode}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}> Number of lenders requested:</span>  {this.props.currentEvent && this.props.currentEvent.quantofvols}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}>  Extra perks? </span>{this.props.currentEvent && this.props.currentEvent.perks}
                       </div>
                       <div className="event-text">
                         <span style={spanStyle}>  Category: </span>{this.props.currentEvent && this.props.currentEvent.category} 
                        </div>
                    </div>
                    <div className="cancel-button">
                        { this.state.canceled ?

                            <div className="canceled">
                                
                                <RaisedButton
                                label="Event has been cancelled"
                                labelPosition="before"
                                style={styles.button}
                                open={this.state.open}
                                containerElement="label"
                                onClick={this.handleOpen}
                                onRequestClose={this.handleClose}
                                actions={actions}
                                disabled={true}
                                />    

                            </div>                    
                            :

                            <div>
                            <RaisedButton
                            label="Cancel New Event"
                            labelPosition="before"
                            style={styles.button}
                            open={this.state.open}
                            containerElement="label"
                            onClick={this.handleOpen}
                            onRequestClose={this.handleClose}
                            actions={actions}
                            />

                             <Dialog
                               
                                title="You are about to cancel this event. Are you sure?"
                            
                                modal={false}
                                open={this.state.open}
                                onRequestClose={this.handleClose}
                            >
                            

                            
                            <RaisedButton label="Cancel Event" onClick={(e) => this.onClick(this.props.currentEvent.id)}/>
                            
                            </Dialog>  
                            </div>

                        


                        }









                                  
                    </div>

                </div>
            </div>

        )

    }


}

function mapStateToProps(state) {
    return {
        currentEvent: state.currentEvent
    }
}

export default connect(mapStateToProps)(DisplayEvent);