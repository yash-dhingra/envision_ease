import pyrebase

config = {
    "apiKey": "AIzaSyCcEObnXH1ndOFwOkvsgn83aF1HMJgt2CI",
    "authDomain": "envision-482a4.firebaseapp.com",
    "projectId": "envision-482a4",
    "storageBucket": "envision-482a4.appspot.com",
    "messagingSenderId": "271380113035",
    "appId": "1:271380113035:web:35bb0870d2336f0365568e",
    "measurementId": "G-QL1C9JDE2Y",
    "serviceAccount": "Assets/ServiceAccount.json",
    "databaseURL": "https://envision-482a4-default-rtdb.firebaseio.com/"
}

firebase = pyrebase.initialize_app(config)
storage = firebase.storage()
db = firebase.database()
loc={"long":77.3649,"lat":28.5229}
db.child("Home_Location").set(loc)
# storage.child("images/test.png").put("Assets/test.png")

# Upload image function without using a named function
