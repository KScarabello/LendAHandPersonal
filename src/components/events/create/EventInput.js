import React, {Component} from 'react';
import TextField from 'material-ui/TextField';
import TimePicker from 'material-ui/TimePicker';
import DatePicker from 'material-ui/DatePicker';
import DropDownMenu from 'material-ui/DropDownMenu';
import MenuItem from 'material-ui/MenuItem';
import './EventInput.css';

export default class EventInput extends Component{
        constructor(){
            super()

            this.state = {
                value: {}





            }
        // this.handleChange = this.handleChange.bind(this);

        }


    // handleChange(e, index, value){
    //     this.setState({value});
    // };

        render(){
            return(
                <div className="create-event-container">
                    <div className="input-box">
                        <div className="textfield-width">
                                <div className="image">

                                </div>
                                <div className="event-title">
                                    <TextField hintText="Event title" fullWidth={true} />
                                </div>
                                <div className="event-description">
                                    <TextField hintText="Tell us a little about what you want to do" fullWidth={true}/>
                                </div>
                                <div className="event-date">
                                    <DatePicker hintText="Date" locale="en-US" fullWidth={true}/>                        
                                </div>
                                <div className="event-start-time">
                                    <TimePicker hintText="Start Time" fullWidth={true}/>                        
                                </div>
                                <div className="event-end-time">
                                    <TimePicker hintText="End Time" fullWidth={true} />
                                </div>
                                <div className="event-venue">
                                    <TextField hintText="Location" fullWidth={true} />
                                </div>
                                <div className="event-venue-address">
                                    <TextField hintText="Enter Street Address" fullWidth={true} />
                                </div>
                                <div className="event-venue-city">
                                    <TextField hintText="Enter City" fullWidth={true}/>
                                </div>
                                <div className="event-venue-zip">
                                    <TextField hintText="Enter Zip Code" fullWidth={true} />
                                </div>
                                <div className="event-image">
                                    <TextField hintText="Enter an Image URL" fullWidth={true} />
                                </div>
                                <div className="event-perks">
                                    <TextField hintText="Any extra perks?" fullWidth={true} />
                                </div>
                                
                                <div>
                                
                                
                                </div> 
                            </div>
                    </div>
                </div>
            )
        }







}