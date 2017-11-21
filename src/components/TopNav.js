import React, {Component} from 'react';
import {Link} from 'react-router-dom';
import {connect} from 'react-redux';
import {getUserInfo} from '../ducks/reducer';
import Avatar from 'material-ui/Avatar';
import Popover from 'material-ui/Popover';
import Menu from 'material-ui/Menu';
import MenuItem from 'material-ui/MenuItem';
import FlatButton from 'material-ui/FlatButton';
import {getCategoryEvents} from '../ducks/reducer';


class TopNav extends Component{
    constructor(props){
        super(props)

        this.state = {
            open: false,
        }
    }

    handleTouchTap = (e) => {
        e.preventDefault();

        this.setState({
            open: true,
            anchorEl: e.currentTarget,
        });
    };

    handleRequestClose = () => {
        this.setState({
            open: false,
        });
    };

    componentDidMount() {
        this.props.getUserInfo()
    }



    render(){
        const linkStyle = {textDecoration: "none"};
        const logoStyle = {textDecoration: "none", color: "#333333"}
        const avatarStyle ={border: "3px", borderColor: "black"}
        const flatbuttonStyle= {fontFamily: "Lato", fontWeight: "bold"}
        const logOutStyle = {textDecoration: "none", size: "12px"}
        console.log(this.props.user)

        return(
            <div className="top-nav-bar">
                <div className ="left-nav-links" >
                <div className="request-help"> 
                    <Link to="/newevent" style={linkStyle}>REQUEST HELP</Link>
                </div>
                <div className="help-someone">
                    
                        <FlatButton
                                                
                            onClick={this.handleTouchTap}
                            labelStyle={flatbuttonStyle}
                            label="Help Someone" 
                            />
                                        
                        
                            <Popover
                                open={this.state.open}
                                anchor={this.state.anchorEl}
                                anchorOrigin={{horizontal: 'right', vertical: 'top'}}
                                targetOrigin={{horizontal: 'right', vertical: 'top'}}
                                onRequestClose={this.handleRequestClose}
                            >
                                <Menu>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('event+staffing')}} primaryText="Event Staffing" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('environmental')}} primaryText="Environmental" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('parks+and+rec')}} primaryText="Parks and Recreation" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('arts+and+crafts')}} primaryText="Arts and Crafts" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('infrastructure')}} primaryText="Infrastructure" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('household+tasks')}} primaryText="Household Tasks" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('Education')}} primaryText="Education" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('animals')}}primaryText="Animals" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('disaster+relief')}} primaryText="Disaster Relief" /></Link>
                                    <Link to="/viewevents"><MenuItem onClick={(e) => {this.props.getCategoryEvents('poverty+alleviation')}}primaryText="Poverty Alleviation" /></Link>

                                </Menu>
                            </Popover>
                </div>
                
            </div>
            <div className="main-logo">

                <Link to="/" style={logoStyle}>Lend A Hand</Link>

            </div>
            <div className="login-div">
            <div className="about">
                <Link to="/about" style={linkStyle}>ABOUT</Link>
            </div>
            <div>    
                <div className="ternary"> 
                        {this.props.user.id ? 
                        <div className="logged-in"> 
                                <Avatar src={this.props.user.picture} 
                                size={55}
                                margin={10}
                                style={avatarStyle}/>                            

                                <a href={process.env.REACT_APP_LOGOUT} style={logOutStyle}>LOG OUT</a>

                        </div> 
                        : 
                        <div className="login-button" >
                            <a href={process.env.REACT_APP_LOGIN} className="btn" style={linkStyle} >LOG IN</a>
                        </div>
                        }
                </div> 
                </div>

            </div> 
        </div>        
    )
        
    }

}

function mapStateToProps(state){
    return {
        user: state.user
    }
}

let outputActions = {
    getUserInfo: getUserInfo,
    getCategoryEvents: getCategoryEvents,
}

export default connect(mapStateToProps, outputActions)(TopNav);