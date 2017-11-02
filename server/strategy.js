
const config = require('../config')
const Auth0Strategy = require('passport-auth0');

module.exports = new Auth0Strategy({
    domain: config.domain,
    clientID: config.clientID,
    clientSecret: config.clientSecret,
    callbackURL: './login'
}, function(accessToken, refreshToken, extraParams, profile, done){
    console.log(profile)
    req.app.get('db').findUser(profile.id).then(user => {
        if(user[0]){
            return done(null, user);
        } else {
            req.app.get('db').createUser([profile.id, profile.emails[0].value, profile.name.familyName, profile.name.givenName])
               .then(user => {
                   return done(null, user[0])
               })
        }
    }) 


    return done(null, profile)
})