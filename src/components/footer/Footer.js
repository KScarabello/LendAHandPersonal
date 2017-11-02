import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import './footer.css';
import {connect} from 'react-redux';
import {getCategoryEvents} from '../../ducks/reducer';
import catInfo from '../categories/category_info';
import RaisedButton from 'material-ui/RaisedButton';

class Footer extends Component{

render(){
    const buttonStyle = {backgroundColor: "#A9CEF4"}
    
    return(
      <div className="big-container">  
        <div className="footer-container">
            <div className="logo">
                <Link to='/'><h4>Lend A Hand</h4></Link>
            </div>
            <div className="category-links">    
                <ul>How would <span>YOU</span> like to make a difference?
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('event+staffing')}}>Event Staffing</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('environmental')}}>Environmental</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('parks+and+rec')}}>Parks and Recreation</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('arts+and+crafts')}}>Arts and Crafts</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('infrastructure')}}>Infrastructure</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('household+tasks')}}>Household Tasks</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('Education')}}>Education</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('animals')}}>Animals</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('disaster+relief')}}>Disaster Relief</li></Link>
                    <Link to="/viewevents"><li onClick={(e) => {this.props.getCategoryEvents('poverty+alleviation')}}>Poverty Alleviation</li></Link>
                </ul>
            </div>
            <div className="post-event-link">
                <h4>Need some help?</h4>
                <Link to='/newevent'><RaisedButton style={buttonStyle} primary={true}>Create Event</RaisedButton></Link>
            </div>    
        </div>
    </div>




    )
}

}

function mapStateToProps(state){
    return{
        currentCat: state.currentCat
    }
}

let outputActions = {
    getCategoryEvents
}

export default connect (mapStateToProps, outputActions)(Footer);