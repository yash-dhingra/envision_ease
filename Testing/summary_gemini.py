import speech_recognition as sr

def audio_to_text(audio_file_path):
    recognizer = sr.Recognizer()

    try:
        with sr.AudioFile(audio_file_path) as source:
            audio = recognizer.record(source)  # Read the entire audio file

            print("Recognizing...")

            # Use Google Web Speech API for speech recognition
            text = recognizer.recognize_google(audio)

            print("Text from audio:", text)
            return text

    except sr.UnknownValueError:
        print("Speech Recognition could not understand audio.")
    except sr.RequestError as e:
        print(f"Could not request results from Google Web Speech API; {e}")
    except Exception as e:
        print(f"Error: {e}")


audio_file_path = "Assets/sample.mp3"  # Replace with the path to your audio file


import pathlib
import textwrap
import google.generativeai as genai

# Or use `os.getenv('GOOGLE_API_KEY')` to fetch an environment variable.
GOOGLE_API_KEY="AIzaSyDlzgoKzntE1Ok9GUJ-HfcTQIKzbNCa1lw"

genai.configure(api_key=GOOGLE_API_KEY)

model = genai.GenerativeModel('gemini-pro')

response = model.generate_content("This is speech to text from audio throughout the day, kindly summarize it. Just give me the bullet points and nothing else\n"+audio_to_text(audio_file_path))
print(response.text)