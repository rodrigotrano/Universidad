import os
import speech_recognition as sr

# Ruta del archivo de audio
audio_path = "C:\\Users\\rodri\\Documents\\Universidad\\SEMESTRE_II\\DISENO_DE_PROTOTIPOS_012V\\Audios\\Audio_entrevista_1.wav"

# Inicializar el reconocedor de voz
recognizer = sr.Recognizer()

# Cargar el archivo de audio
with sr.AudioFile(audio_path) as source:
    audio = recognizer.record(source)  # Leer el archivo de audio

try:
    # Reconocer el texto a partir del audio
    text = recognizer.recognize_google(audio, language="es-ES")  # Cambia el idioma si es necesario
    print("Texto reconocido: ", text)
except sr.UnknownValueError:
    print("No se pudo reconocer el audio")
except sr.RequestError as e:
    print("Error al solicitar resultados; {0}".format(e))
