import React, {Component} from 'react';
import {Card, CardActions, CardHeader, CardMedia, CardTitle, CardText} from 'material-ui/Card';
import {connect} from 'react-redux'


 class DisplayMultEventsBig extends Component{
    render(){

        console.log(this.props.currentEventId)
        return (
            <Card>
                
                <CardMedia
                overlay={<CardTitle title={this.props.currentEventId.title} subtitle="Overlay subtitle" />}
                >
                <img src="images/nature-600-337.jpg" alt="" />
                </CardMedia>
                <CardTitle title="Card title" subtitle="Card subtitle" />
                <CardText>
                 {this.props.event.description}
                </CardText>
               
            </Card>
);
        
    }

}

function mapStateToProps(state){
    return state
}

export default connect(mapStateToProps)(DisplayMultEventsBig)