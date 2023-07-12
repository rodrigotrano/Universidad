import numpy as np

departamentos = np.arange(1,41).reshape(10, 4)

def mostrar_menu():
    print("Bienvenido al sistema de reserva de departamentos")
    print("1. Mostrar departamentos disponibles")
    print("2. Reservar departamento")
    print("3. Anular Reserva de departamento")
    print("4. Salir")
    
def mostrar_departamentos():
    print(departamentos)

while True:
    mostrar_menu()
    opcion = input("Seleccione una opción: ")
    if opcion == "1":
        mostrar_departamentos()
    elif opcion == "2":
        pass
    elif opcion == "3":
        pass
    elif opcion == "4":
        break
    else:
        print("Opción inválida. Por favor, seleccione una opción válida.")
