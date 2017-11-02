import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import {HashRouter} from 'react-router-dom';
import registerServiceWorker from './registerServiceWorker';
import MuiThemeProvider from 'material-ui/styles/MuiThemeProvider';
import {Provider} from 'react-redux';
import store from './store';




ReactDOM.render(




    <Provider store={store}>
        <HashRouter>
            <MuiThemeProvider >
                    <App />
            </MuiThemeProvider>
        </HashRouter>
    </Provider>
, document.getElementById('root'));
registerServiceWorker();
