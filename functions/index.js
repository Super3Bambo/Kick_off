
const functions = require('firebase-functions');
const admin=require('firebase-admin');
admin.initializeApp(functions.config().functions);


exports.boo=functions.firestore.document('Match/{MatchId}').onUpdate
(
async (snapshot,context)=>

{
    const  match =  snapshot.after.data();
var payload = {notification: {title: match.Topic, body: match.Location}, data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'}}

const response = await admin.messaging().sendToTopic(match.Topic , payload)
}


);

/*exports.MatchTrigger=functions.firestore.document('Match/{matchid}').onCreate
(
    
async (snapshot,context)=>
{    var tokens=[];
tokens.push(snapshot.data().token);
var payload = {notification: {title: 'New match is available!', body: 'https://kickoff3.page.link/mVYD'}, data: {click_action: 'FLUTTER_NOTIFICATION_CLICK'}}

const response = await admin.messaging().sendToDevice(tokens.payload);
}

);*/