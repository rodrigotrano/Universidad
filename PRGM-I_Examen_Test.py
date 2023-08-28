import numpy as np

departamentos = np.array([
    ["1A"],
    ["1B"],
    ["1C"],
    ["1D"],
    ["2A"],
    ["2B"],
    ["2C"],
    ["2D"]
]).reshape(2, 4)

diccionario_clientes = {}

def mostrar_menu():
    print("Bienvenido al sistema de reserva de departamentos")
    print("1. Mostrar departamentos disponibles")
    print("2. Reservar departamento")
    print("3. Anular Reserva de departamento")
    print("4. Salir")
    
def mostrar_departamentos():
    print(departamentos)

def reservar_departamento():
    departamento = input("Ingrese el número del departamento que desea reservar (por ejemplo, 1A): ")
    rutSolicitante = input("Ingrese rut del solicitante (formato: 12973416-9): ")
    nombreSolicitante = input("Ingrese nombre solicitante: ")
    telefonoSolicitante = input("Ingrese telefono Pasajero: ")

    try:
        for fila in range(len(departamentos)):
            for columna in range(len(departamentos[fila])):
                if departamentos[fila, columna] == departamento:
                    departamentos[fila, columna] = "X"
                    diccionario_clientes[rutSolicitante] = {   
                                                     "nombrePasajero":nombreSolicitante,
                                                     "telefonoPasajero":telefonoSolicitante,
                                                     "departamento":departamento
                                                        }
                    print("Departamento reservado exitosamente.")
                    break
                else:
                    print("El departamento seleccionado no está disponible.")
    except:
        print("Número de departamento inválido.")
        
            
def anular_reserva_departamento():
    departamento = input("Ingrese el número del departamento cuya reserva desea anular (por ejemplo, 1A): ")
    try:
        for fila in range(len(departamentos)):
            for columna in range(len(departamentos[fila])):
                if departamentos[fila, columna] == departamento:
                    if departamentos[fila, columna] == "X":
                        departamentos[fila, columna] = "Disponible"
                        encontrado = True
                        print("Reserva de departamento anulada exitosamente.")
                    else:
                        print("El departamento seleccionado no está reservado.")
                    break
                else:
                    print("Número de departamento inválido.")
    except:
        print("Número de departamento inválido.")
        
        
        
while True:
    mostrar_menu()
    opcion = input("Seleccione una opción: ")
    if opcion == "1":
        mostrar_departamentos()
    elif opcion == "2":
        reservar_departamento()
    elif opcion == "3":
        pass
    elif opcion == "4":
        break
    else:
        print("Opción inválida. Por favor, seleccione una opción válida.")