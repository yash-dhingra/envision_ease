import tkinter as tk
import webbrowser
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

def open_link():
    location = db.child("Home_Location").get().val()
    lat = location["lat"]
    lng = location["long"]
    url = "https://www.google.com/maps/place/"+str(lat)+","+str(lng) # Replace this with your desired link
    webbrowser.open_new(url)

def create_rounded_button(window, text, command):
    button = tk.Button(window, text=text, command=command, bg="black", fg="white", relief=tk.FLAT)
    button.config(width=10, height=2)
    button.place(relx=0.5, rely=0.5, anchor=tk.CENTER)

def main():
    window = tk.Tk()
    window.title("I'm Lost")

    window.configure(bg="white")
    window.geometry("300x200")

    create_rounded_button(window, "I'm lost", open_link)

    window.mainloop()

if __name__ == "__main__":
    main()
