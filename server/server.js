require('dotenv').config({path:`${__dirname}/../.env`});
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const massive = require('massive');
const session = require('express-session');
const ec = require('../controllers/events_controller');
const uc = require('../controllers/users_controller');
//const strategy = require('./strategy');
const passport = require('passport');
const Auth0Strategy = require('passport-auth0');

const app = express();
app.use(bodyParser.json());
app.use(cors());
app.use( express.static( `${__dirname}/../build` ) );


massive(process.env.DB_LINK).then(db => {
    app.set('db', db)
}).catch(err => {
    console.log(err)
})
console.log(app.get('db'))

app.use(session({
    resave: true,
    saveUninitialized: true,
    secret: process.env.SESSION_SECRET,
}))

app.use(passport.initialize());
app.use(passport.session());

passport.use(new Auth0Strategy({
    domain: process.env.DOMAIN,
    clientID: process.env.AUTH_CLIENT_ID,
    clientSecret: process.env.CLIENT_SECRET,
    callbackURL: './login'
}, function(accessToken, refreshToken, extraParams, profile, done){
    console.log(profile)
    app.get('db').findUser(profile.id).then(user => {
        if(user[0]){
            return done(null, user[0]);
        } else {
            app.get('db').createUser([profile.id, profile.emails[0].value, profile.picture, profile.name.givenName, profile.name.familyName])
               .then(user => {
                   return done(null, user[0])
               })
        }
    }) 


}));

passport.serializeUser(function (user, done) {
    console.log(user);
    // var userInfo = {
    //     id: user.id,
    //     displayName: user.displayName,
    //     nickname: user.nickname,
    //     email: user.email,
    //     picture: user.picture
    // }
    done(null, user)
})

passport.deserializeUser(function (user, done) {
    done(null, user)
})

//auth0 endpoints
app.get('/api/auth/login', passport.authenticate('auth0', {
    successRedirect: process.env.SUCCESS_REDIRECT,
    failureRedirect: process.env.FAILURE_REDIRECT,
    failureFlash: true
}))

app.get('/me', function (req, res, next) {
    console.log(req.user)
    if(!req.user){
        console.log("bingo")
        return res.status(404).send('User not found')
    } else {
        return res.status(200).send(req.user);
    }
})

app.get('/logout', (req, res) => {
    req.logOut();
    return res.redirect(302, process.env.SUCCESS_REDIRECT);
})



// events endpoints using events_controller

app.post('/api/event', ec.createEvent);
app.get('/api/events', ec.getEvents);
app.get('/api/events/:id', ec.getEventById);
app.get('/api/viewevents', ec.getEventsByCat)
// app.get(`/api/events?zipcode=${#}`, ec.getEventsByZip)
app.delete('/api/event/:id', ec.deleteEvent);

app.post('/api/eventtouser', ec.addEventToUser);

//user endpoints using users_controller

//app.post('/api/user', uc.createProfile) - but how does this work with Auth0?
app.get('/api/user/:id', uc.getProfile);
app.put('/api/user/:id', uc.updateProfile);

const path = require('path')
app.get('*', (req, res)=>{
  res.sendFile(path.join(__dirname, '../build/index.html'));
})

const port = 3001;
app.listen(port, () => { console.log(`Listening on port ${port}`) });