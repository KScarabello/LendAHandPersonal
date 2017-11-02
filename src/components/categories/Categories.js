import React, {Component} from 'react';
import catInfo from './category_info';
import {GridList, GridTile} from 'material-ui/GridList';
import {Link} from 'react-router-dom';
import {connect} from 'react-redux';
import {getCategoryEvents} from '../../ducks/reducer';

class Categories extends Component{
    render(){


  const styles = {
            root: {
                display: 'flex',
                flexWrap: 'wrap',
                justifyContent: 'space-between',
                alignItems: 'center',
                border: '1px',
                borderColor: 'black',
                margin: '10px'

                
            },
            gridList: {
                width: 600,
                height: 550,
                overflowY: 'auto',
                
            },
            
            
        };

        

        return(
            <div className="cat-container">
                
                    

                    <div style={styles.root}>
                        <GridList
                        cellHeight={200}
                        cellWidth={300}
                        cols={5}
                        padding={15}
                        
                        > 

                            {catInfo.map((tile) => (
                              <Link to="/viewevents">
                                <GridTile
                                    style={styles.gridtile}
                                    key={tile.img}
                                    title={tile.category}
                                    onClick={(e) => {this.props.getCategoryEvents(tile.category)}}
                                    
                                    
                            >

                                <img className="img" src={tile.img}/>
                                </GridTile>
                              </Link>

                            ))}
                        </GridList> 
                    </div>  

                     <h1>Select a Category to find an event today!</h1>       
              </div>
        )           
}
    }

    


function mapStateToProps(state){
        return {
            currentCat: state.currentCat
        }
    }

let outputActions = {
    getCategoryEvents
}

export default connect (mapStateToProps, outputActions)(Categories);