module.exports = {
    createEvent: (req, res, next) => {
        let { title, description, date, starttime, endtime, venue, address, city, zipcode, imgUrl, perks, value, quantofvols } = req.body;
      console.log(req.body)  

        // console.log(req.app.get('db'));
        req.app.get('db').create_event([title, description, date, starttime, endtime, venue, address, city, zipcode, imgUrl, perks, value, quantofvols])
        .then(event => {
            console.log('event', event);
            res.status(200).send(event);
        }).catch((err) =>{console.log(err); res.status(500).send(err)})

    },
    getEvents: (req, res, next) => {
        req.app.get('db').get_events()
            .then(events => {
                res.status(200).send(events) 
            })

    },
    getEventById: (req, res, next) => {
        let {params} = req;

        req.app.get('db').get_event_by_id([req.params.id])
            .then(event => res.status(200).send(event))
            .catch(() => res.status(500).send());

    },
    getEventsByCat: (req, res, next) => {
        let {query} = req;
        console.log(req.query.category)
        req.app.get('db').get_events_by_category([req.query.category])
            .then(events => res.status(200).send(events))
            .catch(() => res.status(500).send());
    },
    getEventsByZip: (req, res, next) => {
        let {query} = req;

        req.app.get('db').get_events_by_zipcode([req.query])
            .then(events => res.status(200).send(events))
            .catch(() => res.status(500).send());
    },            
    deleteEvent: (req, res, next) => {
        let {params} = req;
       
        console.log(req.params.id)
        
        req.app.get('db').delete_event([Number(req.params.id)])
            .then(() => res.status(200).send("You successfully deleted your event."))
            .catch(() => res.status(500).send("You did not delete the event"));
    },
    addEventToUser: (req, res, next) => {
        let {eventId, userId} = req.body
        console.log(req.body)
        req.app.get('db').add_event_to_user([Number(eventId), userId])
            .then(() => res.status(200).send("Success"))
            .catch(() => res.status(200).send("Not success"))
    }

};

