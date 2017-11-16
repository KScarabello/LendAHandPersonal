import React from 'react';
import {Switch, Route} from 'react-router-dom';

import TopNav from './components/TopNav';
import Slider from './components/Slider';
import Footer from './components/footer/Footer';
import Categories from './components/categories/Categories';
import DisplayEvent from './components/events/single/DisplayEvent';
import DisplayEventById from './components/events/single/DisplayEventById';
import EventInput2 from './components/events/create/EventInput2';
import DisplayMultEvents from './components/events/multiple/DisplayMultEvents';
import About from './components/About';
import Splashcontent from './components/Splashcontent';
import Splashcontent2 from './components/Splashcontent2';
import Demologin from './components/demologin/Demologin';

export default (

        <Switch>
            <Route exact path='/' render={ () => (
                <div>
                    <TopNav />
                    <Slider />
                    <Splashcontent />
                    <Categories />
                    <Demologin />
                    
                    <Footer />
                </div>
            ) } />
            <Route path='/viewevent' render={ () => (
                <div>
                    <TopNav />
                    <DisplayEventById />
                    <Footer />


                </div>
            ) } />
            <Route path='/viewevents' render={ () => (
                <div>
                    <TopNav />
                    <DisplayMultEvents />
                    <Footer />


                </div>
            ) } />
            <Route path='/newevent' render={ () => (
                <div>
                    <TopNav />
                    <EventInput2 />
                    <Footer />
                    
                </div>
            ) } />
            <Route path='/viewnewevent' render={() => (
                <div>
                    <TopNav />
                    <DisplayEvent />
                    <Footer />
                </div>
            )} />
            <Route path='/about' render={ () => (
                <div>     
                    <TopNav />
                    <About />
                    <Footer />

                </div>
            ) } />

        </Switch>
)