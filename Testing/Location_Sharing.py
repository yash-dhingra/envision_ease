import tkinter as tk
import webbrowser
import pyrebase
import subprocess
import time 
import os
import sys

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

while True:
    try:
        import geocoder
        g = geocoder.ip('me')
        if g.latlng is None:
            raise Exception("Failed to get location data")
        lat, long = g.latlng

        data = {"lat": lat, "long": long}

        # Save data in Firebase
        db.child("Current_Location").set(data)

    except Exception as e:
        print(f"An error occurred: {e}")
        print("Restarting script...")
        os.execv(sys.executable, ['python'] + sys.argv)

    time.sleep(5)