import React, { Component } from 'react';

import 'normalize.css';
import './styles/App.css';
import router from './router';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import getMuiTheme from 'material-ui/styles/getMuiTheme';
// import TopNav from './components/TopNav';
// import Slider from './components/Slider';
// import Categories from './components/categories/Categories';
// import EventInput from './components/events/create/EventInput';
// import DisplayEvent from './components/events/DisplayEvent';


class App extends Component {


  render() {

    let aLinkTheme = getMuiTheme({fontFamily: "Questrial"});
    return (
  
      <div className="App">
        {router}
      </div>
   
    );
  }
}

export default App;
