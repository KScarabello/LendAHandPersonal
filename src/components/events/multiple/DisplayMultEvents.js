import React, { Component } from 'react';
import { GridList, GridTile } from 'material-ui/GridList';
import IconButton from 'material-ui/IconButton';
import StarBorder from 'material-ui/svg-icons/toggle/star-border';
import axios from 'axios'
import { connect } from 'react-redux';
import { getCategoryEvents, setEventId } from '../../../ducks/reducer';
import {Link} from 'react-router-dom';


const styles = {
  root: {
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'space-around',
  },
  gridList: {
    width: '85vw',
    // height: 1000,
    // overflowY: 'auto',
  },
  
};



class DisplayMultEvents extends Component {




  
  render() {

    const imgStyle = {
      width: 700,
      height: 400,
    }
    
    let catEvents = null;
    if (this.props.currentCat) {
      catEvents = this.props.currentCat.map((cat, i) => (
     
       
       <Link to='viewevent'>
       <div className="align-div">
       <div className="design-container"> 
          <GridTile
            className="grid-tile"
            key={i}
            title={cat.title}
            actionIcon={<IconButton><StarBorder color="white" /></IconButton>}
            actionPosition="left"
            titlePosition="top"
            titleBackground="linear-gradient(to bottom, rgba(0,0,0,0.7) 0%,rgba(0,0,0,0.3) 70%,rgba(0,0,0,0) 100%)"
            onClick={()=>this.props.setEventId(cat.id)}>

            <img src={cat.imageurl} style={imgStyle} />
          </GridTile>
        </div>
        </div>
        </Link>
      
      ))
    }



    return (
    <div>
        
        
          <div style={styles.root}>
           

            <GridList
              cols={1}
              cellHeight={450}
              padding={30}
              style={styles.gridList}
              
            >
              {catEvents}
            </GridList>

        </div>
      </div>
    
    )
  }
}

function mapStateToProps(state) {
  // return {
  //   currentCat: state.currentCat
  // }
  return state
}

let outputActions = {
  setEventId: setEventId
}


export default connect(mapStateToProps, outputActions)(DisplayMultEvents);