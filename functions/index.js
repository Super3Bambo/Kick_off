
const functions = require('firebase-functions');
const admin=require('firebase-admin');
admin.initializeApp(functions.config().functions);
const db = admin.firestore();
const fcm = admin.messaging();

exports.matchcomplete=functions.firestore.document('Match/{MatchId}').onUpdate
(
async (snapshot,context)=>

{
    const  match =  snapshot.after.data();
    const  matchold =  snapshot.before.data();
    if(match.Counter>matchold.Counter){

        var payload = {notification: {title: 'Match Complete!', body: 'Match now is full , Prepare Your Bag.'}, data: {value: 'usermatch' , click_action: 'FLUTTER_NOTIFICATION_CLICK',  }}

const response = await admin.messaging().sendToTopic(match.Topic,payload)
    }

}


);

exports.League=functions.firestore.document('League/{LeagueId}').onCreate
(
async (snapshot,context)=>

{
    
        var payload = {notification: {title: 'New League Added!', body: 'Harry Up To join League With Your Team'}, data: {  value: 'League' ,click_action: 'FLUTTER_NOTIFICATION_CLICK', }}

const response = await admin.messaging().sendToTopic('League',payload)


}


);


exports.Followuser=functions.firestore.document('user/{userid}').onUpdate 
(
    
async (snapshot,context)=>
{    
    const  user =  snapshot.after.data();
    const olduser=snapshot.before.data();
    const followedby= user.Followers[user.Followers.length-1].UserID;
    const querySnapshot = await db
      .collection('user').doc(followedby).get();
      const snap =querySnapshot.data();
       var name= snap.FName;
    var tokens=[];
    tokens.push(user.Token);


    if(user.Followers.length>olduser.Followers.length){
        var payload = {notification: {title: 'New Follower!', body:' You Followed by'+' '+ name}, 
        data: { value: 'followers' , click_action: 'FLUTTER_NOTIFICATION_CLICK',}}
        const response = await admin.messaging().sendToDevice(tokens, payload);
        

    }
    
}

);


exports.Invite=functions.firestore.document('Invite/{Inviteid}').onCreate 
(
    
async (snapshot,context)=>
{    
    const  invitation =  snapshot.data();
     const rec= invitation.Reciever;
    const sender=invitation.Sender;
    const type=invitation.Type;
    var types= type;


    //const followedby= user.Followers[user.Followers.length-1].UserID;
    const querySnapshotsender = await db
      .collection('user').doc(sender).get();
      const snapsender =querySnapshotsender.data();
       var name= snapsender.FName;

       const querySnapshotrec = await db
      .collection('user').doc(rec).get();
      const snaprec =querySnapshotrec.data();
       var token= snaprec.Token;
    var tokens=[];
    tokens.push(token);


        var payload = {notification: {title: 'Invitation!', body:name+' '+'Invite You to ' + types}, 
        data: { value: 'invite' , click_action: 'FLUTTER_NOTIFICATION_CLICK',}}
        const response = await admin.messaging().sendToDevice(tokens, payload);
        

    
    
}

);


exports.payment=functions.firestore.document('Payment/{Paymentid}').onCreate 
(
    
async (snapshot,context)=>
{    
    const  user =  snapshot.data().UserID;
   // const olduser=snapshot.data();
    const querySnapshot = await db
      .collection('user').doc(user).get();
      const snap =querySnapshot.data();
      var token=snap.Token;
    var tokens=[];
    tokens.push(token);

        var payload = {notification: {title: 'Match Payment', body:' You should pay before 4 hours from now!'}, 
        data: { value: 'usermatch' , click_action: 'FLUTTER_NOTIFICATION_CLICK',}}
        const response = await admin.messaging().sendToDevice(tokens, payload);
        
    
}

);
exports.paymentaccept=functions.firestore.document('Payment/{Paymentid}').onUpdate 
(
    
async (snapshot,context)=>
{    
    const pay=snapshot.after.data();
    const  user =  snapshot.after.data().UserID;
    const match = snapshot.after.data().MatchId;

    const querySnapshotmatch = await db
    .collection('Match').doc(match).get();
    const snapmatch =querySnapshotmatch.data();
    var topic=snapmatch.topic;

   // const olduser=snapshot.data();
    const querySnapshot = await db
      .collection('user').doc(user).get();
      const snap =querySnapshot.data();
      var token=snap.Token;
    var tokens=[];
    tokens.push(token);
    if(pay.Statue==true){

        var payload = {notification: {title: 'Match Payment Accept', body:' You Joined The Match!'}, 
        data: { value2: topic , value:'usermatch' , click_action: 'FLUTTER_NOTIFICATION_CLICK',}}
        const response = await admin.messaging().sendToDevice(tokens, payload);}
        
    
}

);
exports.requestacept=functions.firestore.document('Requests/{Requestsid}').onUpdate 
(
    
async (snapshot,context)=>
{    
    const request=snapshot.after.data();
    const  user =  snapshot.after.data().UserID;
    const team = snapshot.after.data().TeamID;

    const querySnapshotteam = await db
    .collection('Team').doc(team).get();
    const snapteam =querySnapshotteam.data();
    var topic=snapteam.topic;

   // const olduser=snapshot.data();
    const querySnapshot = await db
      .collection('user').doc(user).get();
      const snap =querySnapshot.data();
      var token=snap.Token;
    var tokens=[];
    tokens.push(token);
    if(request.Statue==true){

        var payload = {notification: {title: 'Request Accepted', body:' You Accepted to Join Team , tap to Recieve Notification From Team!'}, 
        data: { value2: topic , value:'team' , click_action: 'FLUTTER_NOTIFICATION_CLICK',}}
        const response = await admin.messaging().sendToDevice(tokens, payload);}
        
    
}

);