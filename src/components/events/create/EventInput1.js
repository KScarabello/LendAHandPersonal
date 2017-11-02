import React from 'react';
import {
  Step,
  Stepper,
  StepLabel,
  StepContent,
} from 'material-ui/Stepper';
import RaisedButton from 'material-ui/RaisedButton';
import FlatButton from 'material-ui/FlatButton';
import TextField from 'material-ui/TextField';
import TimePicker from 'material-ui/TimePicker';
import DatePicker from 'material-ui/DatePicker';
import Footer from '../../../components/Footer';


class EventInput1 extends React.Component {

  state = {
    finished: false,
    stepIndex: 0,
  };

  handleNext = () => {
    const {stepIndex} = this.state;
    this.setState({
      stepIndex: stepIndex + 1,
      finished: stepIndex >= 11,
    });
  };

  handlePrev = () => {
    const {stepIndex} = this.state;
    if (stepIndex > 0) {
      this.setState({stepIndex: stepIndex - 1});
    }
  };

  renderStepActions(step) {
    const {stepIndex} = this.state;

    return (
      <div style={{margin: '12px 0'}}>
        <RaisedButton
          label={stepIndex === 9 ? 'Finish' : 'Next'}
          disableTouchRipple={true}
          disableFocusRipple={true}
          primary={true}
          onClick={this.handleNext}
          style={{marginRight: 12}}
        />
        {step > 0 && (
          <FlatButton
            label="Back"
            disabled={stepIndex === 0}
            disableTouchRipple={true}
            disableFocusRipple={true}
            onClick={this.handlePrev}
          />
        )}
      </div>
    );
  }

  render() {
    const {finished, stepIndex} = this.state;

    return (
      <div style={{maxWidth: 750, maxHeight: 600, margin: 'auto'}}>
        <Stepper activeStep={stepIndex} orientation="vertical">
          <Step>
            <StepLabel>Volunteer Event Title</StepLabel>
            <StepContent>
            <div>
            <TextField fullWidth={true}/>
              <p>
                Give us a brief title for your event. 

                The best titles are short and to the point - remember, you will be asked to provide a full description later.

              </p>
            </div>
              {this.renderStepActions(0)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Event Description</StepLabel>
            <StepContent>
              <div>
                <TextField fullWidth={true}/>
                <p>Give us an appealing message that will encourage lenders to want to help you out!
                    <br />
                    This is a good place to provide all the details and explain why it's worth their time.
                </p>
              </div>
              {this.renderStepActions(1)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Event Date</StepLabel>
            <StepContent>
              <div>
                <DatePicker locale='en-US' fullWidth={true}/>
                <p>
                    What date is the event?
                </p>
              </div>
              {this.renderStepActions(2)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Meetup Time</StepLabel>
            <StepContent>
              <div>
                <TimePicker locale='en-US' fullWidth={true}/>
                <p>
                    What time do you want to meet up?
                </p>
              </div>
              {this.renderStepActions(3)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>End Time</StepLabel>
            <StepContent>
              <div>
                <TimePicker locale='en-US' fullWidth={true}/>
                <p>
                    What time will the event end?
                </p>
              </div>
              {this.renderStepActions(4)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Location</StepLabel>
            <StepContent>
              <div>
                <TextField fullWidth={true}/>
                <p>
                Where should everyone meet you?
                </p>
              </div>
              {this.renderStepActions(5)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Location Address</StepLabel>
            <StepContent>
              <div>
                <TextField hintText='Street Address'fullWidth={true}/>
                <TextField hintText='City' fullWidth={true} />
                <TextField hintText='Zip Code' fullWidth={true} />
                <p>
                    Please provide a specific address that Lenders can use to locate you.
                </p>
              </div>
              {this.renderStepActions(6)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Image URL</StepLabel>
            <StepContent>
              <div>
                <TextField hintText='Image URL Path' fullWidth={true}/>
                <p>
                    Please provide an Image URL. Events with images are significantly more attractive to Lenders.
                </p>
              </div>
              {this.renderStepActions(7)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Any additional perks?</StepLabel>
            <StepContent>
              <div>
                <TextField fullWidth={true} />
                <p>
                    Volunteers love free stuff. Here is a good place to mention any cool benefits to coming to the event (ie. free t-shirts, free food).                    
                </p>
              </div>
              {this.renderStepActions(8)}
            </StepContent>
          </Step>
          <Step>
            <StepLabel>Event Category</StepLabel>
            <StepContent>
              <div>
                //DropDownMenu
                <p>
                    Select a category that best fits your event.
                </p>
              </div>
              {this.renderStepActions(8)}
            </StepContent>
          </Step>
        
        </Stepper>
      <Footer />
      </div>
      
       
      
    );
  }
}

export default EventInput1;