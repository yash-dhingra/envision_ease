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

    except sr.UnknownValueError:
        print("Speech Recognition could not understand audio.")
    except sr.RequestError as e:
        print(f"Could not request results from Google Web Speech API; {e}")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    audio_file_path = "Assets/sample.mp3"  # Replace with the path to your audio file
    audio_to_text(audio_file_path)
