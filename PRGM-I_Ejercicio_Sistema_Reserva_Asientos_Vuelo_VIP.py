import numpy as np

asientos = np.arange(1, 43).reshape(7, 6)
precio_asientos = {
                    "Normal": 78900,
                    "VIP": 240000
                }
diccionario_clientes = {}

def mostrar_asientos_disponible():
    print("#####################################")
    print("=======  PRECIOS =======")
    print("Asiento NORMAL: ",precio_asientos["Normal"])
    print("Asiento VIP: ",precio_asientos["VIP"])
    print("=======  NORMAL =======")
    print(asientos[:5, :])
    print("========= VIP =========")
    print(asientos[5:, :])

def comprar_asiento():    
    try:
        mostrar_asientos_disponible()
        rutPasajero = input("Ingrese rut Pasajero (formato: 12973416-9): ")
        nombrePasajero = input("Ingrese nombre Pasajero: ")
        telefonoPasajero = input("Ingrese telefono Pasajero: ")
        numero_asiento = int(input("Ingrese el número de asiento: "))
        
        print("#####################################")    
        fila = (numero_asiento - 1) // 6 #Función que obtiene el residuo de una división, se utiliza el numero de asiento para dar la posición en fila del numero en el arreglo
        columna = (numero_asiento - 1) % 6 #Función que obtiene el cuociente entero de una división, se utiliza el numero de asiento para dar la posición en columna del numero en el arreglo
        print("Rut: ")
        print("Nombre: ", nombrePasajero)
        print("Telefono: ", telefonoPasajero)
        print('N° Asiento: ', numero_asiento)
        print('Fila: ', fila + 1)
        print('Columa: ', columna + 1)
        if 1 <= numero_asiento <= 42:
            if asientos[fila, columna] == 0:
                print("El asiento ya esta ocupado.")
            else:
                asientos[fila, columna] = 0
                print("Asiento comprado exitosamente.")
                diccionario_clientes[rutPasajero] = {   
                                                     "nombrePasajero":nombrePasajero,
                                                     "telefonoPasajero":telefonoPasajero,
                                                     "asientoPasajero":numero_asiento
                                                        }
        else:
            print("Numero de asiento no valido (else).")         
    except IndexError:
        print("Numero de asiento no valido (Mensaje except).")
        
        
def anular_asiento(diccionario_clientes):
    try:    
        print("#####################################")
        rutPasajero = input("Ingrese rut Pasajero (formato: 12973416-9): ")
        if rutPasajero in diccionario_clientes:
            numero_asiento = diccionario_clientes[rutPasajero]["asientoPasajero"]
            fila = (numero_asiento - 1) // 6
            columna = (numero_asiento - 1) % 6
            print('N° Asiento: ', numero_asiento)
            print('Fila: ', fila + 1)
            print('Columa: ', columna + 1)
        
            if asientos[fila][columna] == 0:
                asientos[fila][columna] = numero_asiento
                del diccionario_clientes[rutPasajero]
                print("El asiento fue anulado correctamente")
            else:
                print("Asiento se encuentra disponible no se puede anular")
        else:
            print("Rut ingresado incorrectamente, Ingrese rut valido")
    except IndexError:
        print("Numero de asiento no valido (Mensaje except).")
        
        
def modificar_pasajero(diccionario_clientes, opcion):
    try:
        print("#####################################")
        rutPasajero = input("Ingrese rut Pasajero (formato: 12973416-9): ")
        if rutPasajero in diccionario_clientes:
            print("DATOS ACTUALES DEL PASAJERO")
            numero_asiento = diccionario_clientes[rutPasajero]["asientoPasajero"]              
            telefonoPasajero = diccionario_clientes[rutPasajero]["telefonoPasajero"]
            nombrePasajero = diccionario_clientes[rutPasajero]["nombrePasajero"]
            
            if opcion == "1":
                print("Nombre: ", diccionario_clientes[rutPasajero]["nombrePasajero"])
                print("DATOS NUEVOS DEL PASAJERO")
                nombrePasajero = input("Ingrese nombre Pasajero: ")    
            elif opcion == "2":
                print("Telefono: ", diccionario_clientes[rutPasajero]["telefonoPasajero"])
                print("DATOS NUEVOS DEL PASAJERO")
                telefonoPasajero = input("Ingrese telefono Pasajero: ")
            
            diccionario_clientes[rutPasajero] = {   
                                                     "nombrePasajero":nombrePasajero,
                                                     "telefonoPasajero":telefonoPasajero,
                                                     "asientoPasajero":numero_asiento
                                                        }              
            
            print("Pasajero modificado correctamente el pasajero")
                
        else:
            print("Rut ingresado incorrectamente, Ingrese rut valido (Mensaje else)")
            
    except IndexError:
        print("Rut ingresado incorrectamente, Ingrese rut valido (Mensaje except).")


def sub_menu():
    while True:
        print("\n--- Modificar datos de pasajero ---")
        print("1. Modificar Nombre")
        print("2. Modificar Telefono")
        print("3. Salir")

        opcion = input("Seleccione una opción: ")
        if opcion == "1":
            modificar_pasajero(diccionario_clientes, opcion)
        elif opcion == "2":
            modificar_pasajero(diccionario_clientes, opcion)
        elif opcion == "3":
            break
        else:
            print("Opción inválida. Por favor, seleccione una opción válida.")
        

def mostrar_menu():
    print("\n----- MENU -----")
    print("1. Ver asientos disponibles")
    print("2. Comprar asiento")
    print("3. Anular vuelo")
    print("4. Modificar datos de pasajero")
    print("5. Salir")

while True:
    mostrar_menu()
    opcion = input("Seleccione una opción: ")
    if opcion == "1":
        mostrar_asientos_disponible()
    elif opcion == "2":
        comprar_asiento() 
    elif opcion == "3":
        anular_asiento(diccionario_clientes)      
    elif opcion == "4":
        sub_menu()
    elif opcion == "5":
        break
    else:
        print("Opción inválida. Por favor, seleccione una opción válida.")


