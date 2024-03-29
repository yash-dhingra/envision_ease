import cv2
import time
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
# storage.child("images/test.png").put("Assets/test.png")

# Upload image function without using a named function

def update_last_updated(filename):
    db = firebase.database()
    db.child("last_updated").set(filename)

def upload_image(image):
    _, img_encoded = cv2.imencode('.jpg', image)
    image_bytes = img_encoded.tobytes()
    img_name= str(time.time()) 
    storage.child("images/" + img_name+ ".jpg").put(image_bytes)
    update_last_updated(img_name)

# Main execution
cap = cv2.VideoCapture(1)

while True:
    ret, frame = cap.read()
    if not ret:
        break

    cv2.imshow('Frame', frame)

    upload_image(frame)
    time.sleep(1)

    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

cap.release()
cv2.destroyAllWindows()
