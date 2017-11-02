import axios from 'axios';

const initialState ={
    user: {},
    currentId: 0,
    currentEvent: {
        address: '',
        category: '',
        city: '',
        date: '',
        description: '',
        endtime: '',
        id: 0,
        imageurl: '',
        perks: '',
        quantofvols: 0,
        starttime: '',
        title: '',
        user_id: null,
        venue: '',
        zipcode: ''
    },
    currentCat: [],
    currentEventId: [],
}

const GET_USER_INFO = "GET_USER_INFO";
const SET_NEW_EVENT = "GET_NEW_EVENTID";
const GET_CATEGORY_EVENTS = "GET_CATEGORY_EVENTS";
const SET_EVENT_ID = "SET_EVENT_ID";

export function getUserInfo(){
    const userInfo = axios.get('/me').then(res => {
       
        return res.data;
    })

   console.log(userInfo)

    return {
        type: GET_USER_INFO,
        payload: userInfo
    }

}

export function setNewEvent(newEvent, cb){
    const newEventToDisplay = axios.post('http://localhost:3001/api/event/', newEvent)
            .then(response => {
                console.log(response)
                return response.data[0]
            })

    return {
        type: SET_NEW_EVENT,
        payload: newEventToDisplay
    };
}

export function getCategoryEvents(category){
   var selectCat;
   if(!category){
       selectCat = null
   } else if (category == 'Education'){
       selectCat = "Education"
   } else if (category == 'Parks & Recreation'){
       selectCat = 'parks+and+rec'
   } else {
       selectCat = category.toString().replace(/ & /g, ' and ').replace(/ /g, '+').toLowerCase()
   }
   
    // (!category) ? null :
    // selectCat = category.toString().replace(/ & /g, ' and ').replace(/ /g, '+').toLowerCase()
    
    const catEvents = axios.get('http://localhost:3001/api/viewevents?category=' + selectCat)
            .then(response => {
               
                return response.data
            })
            
    return{
        type: GET_CATEGORY_EVENTS,
        payload: catEvents
    }
}


export function setEventId(id){
     let eventId = axios.get('http://localhost:3001/api/events/' + id)
        .then(response => {
            // console.log(response)
            return response.data[0]     
            }) 

    return {
        type: SET_EVENT_ID,
        payload: eventId
    }
}



export default function reducer(state = initialState, action){
    switch(action.type){
        case GET_USER_INFO + '_FULFILLED':
            return Object.assign({}, state, {user: action.payload});
        case SET_NEW_EVENT + '_FULFILLED':
            console.log(action.payload);
            return Object.assign({}, state, {currentEvent: action.payload});
        case GET_CATEGORY_EVENTS + '_FULFILLED':
            return Object.assign({}, state, {currentCat: action.payload});
        case SET_EVENT_ID + '_FULFILLED':
            return Object.assign({}, state, {currentEventId: action.payload});
        default:
            return state;
    }
}