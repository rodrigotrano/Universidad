import datetime
personas = {}

def grabar_personas(personas):
    try:
        print("##################################################################")
        nif = input("Ingrese el NIF de la persona (formato: 03034567-XXY): ")
        nombres = input("Ingrese los nombres y apellidos de la persona: ")
        largoNombres = int(len(nombres))
        fecha_nacimiento = input("Ingrese la fecha de nacimiento de la persona (formato: aaaa-mm-dd): ")
        fechaNacimiento = datetime.datetime.strptime(fecha_nacimiento, '%Y-%m-%d')
        edad = int(datetime.datetime.now().year - fechaNacimiento.year)
        estadoConyugal = input("Ingrese el estado conyugal de la persona: ")
        print(fechaNacimiento)
        print(edad)
        if edad < 0:
            raise ValueError("La edad debe ser mayor a 0. Verifique la fecha de nacimiento")
        if largoNombres < 8:
            raise ValueError("el valor a registrar debe ser mayor a 8 caracteres.")
        personas[nif] = {
            "nif":nif,            
            "nombres": nombres,
            "fechaNacimiento": fechaNacimiento,
            "edad": edad,
            "estadoConyugal": estadoConyugal
        }
        print("Datos de la persona registrado correctamente.")
    except ValueError as e:
        print("Error:", str(e))
        
        
def buscar_personas(personas):
    try:
        print("##################################################################")
        nif = input("Ingrese el NIF de la persona a buscar: ")
        if nif in personas:
            print("Información del interno:")
            print("NIF:", personas[nif]["nif"])
            print("Nombres:", personas[nif]["nombres"])
            print("Fecha de nacimiento:", personas[nif]["fechaNacimiento"])
            print("Edad:", personas[nif]["edad"])
            print("Estado Conyugal:", personas[nif]["estadoConyugal"])
        else:
            print("No se encontró ningún interno con ese RUT.")
    except ValueError as e:
        print("Error:", str(e))


def imprimir_certificado(personas):
    try:
        print("##################################################################")
        nif = input("Ingrese el NIF de la persona a buscar: ")
        if nif in personas:
            print("##################################################################")
            print("CERTIFICADO REGISTRO CIVIL:")
            print("NIF:", personas[nif]["nif"])
            print("Nombre:", personas[nif]["nombres"])
            print("Fecha de nacimiento:", personas[nif]["fechaNacimiento"])
            print("Estado Conyugal:", personas[nif]["estadoConyugal"])
            print("##################################################################")
        else:
            print("No se encontró ningún interno con ese RUT.")
    except ValueError as e:
        print("Error:", str(e))
        

def mostrar_menu():
    print("\n----- MENU -----")
    print("1. Grabar")
    print("2. Buscar")
    print("3. Imprimir certificado")
    print("4. Salir")

while True:
    mostrar_menu()
    opcion = input("Seleccione una opción: ")
    if opcion == "1":
        grabar_personas(personas)
    elif opcion == "2":
        buscar_personas(personas)
    elif opcion == "3":
        imprimir_certificado(personas)      
    elif opcion == "4":
        break
    else:
        print("Opción inválida. Por favor, seleccione una opción válida.")


