import os
import speech_recognition as sr

# Directorio donde se encuentran los archivos de audio
directorio_audio = "C:\\Users\\rodri\\Documents\\Universidad\\SEMESTRE_II\\DISENO_DE_PROTOTIPOS_012V\\Audios\\"

# Listar archivos de audio en el directorio
archivos_audio = [archivo for archivo in os.listdir(directorio_audio) if archivo.endswith(".wav")]

#print(archivos_audio)

# Crear un objeto Recognizer
recognizer = sr.Recognizer()

for archivo_audio in archivos_audio:
    # Ruta completa del archivo de audio
    ruta_audio = os.path.join(directorio_audio, archivo_audio)
    
    # Abrir el archivo de audio
    with sr.AudioFile(ruta_audio) as source:
        audio = recognizer.record(source, duration=60)  # Leer el audio
        
    try:
        # Realizar la transcripción
        texto_transcrito = recognizer.recognize_google(audio, language="es")
        print(f"Archivo {archivo_audio} - Texto transcrito: {texto_transcrito}")
        
        # Crear un archivo de texto con la transcripción en el mismo directorio
        #nombre_archivo_txt = os.path.splitext(archivo_audio)[0] + ".txt"
        #ruta_archivo_txt = os.path.join(directorio_audio, nombre_archivo_txt)
        
        #with open(ruta_archivo_txt, "w") as archivo_txt:
        #    archivo_txt.write(texto_transcrito)
        #print(f"Transcripción guardada en {nombre_archivo_txt}")
        
    except sr.UnknownValueError:
        print(f"Archivo {archivo_audio} - No se pudo transcribir el audio")
    except sr.RequestError as e:
        print(f"Archivo {archivo_audio} - Error al solicitar la transcripción; {e}")
