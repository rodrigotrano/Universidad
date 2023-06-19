import numpy as np

# Crear el arreglo inicial de 10x4
asientos = np.arange(1, 41).reshape(10, 4)

def mostrar_asientos():
    print("Asientos disponibles:")
    print("Nota: el asiento con valor 0 indica que no se encuentra disponible.")
    print(asientos)

def comprar_asiento(fila, columna):
    try:
        if asientos[fila, columna] == 0:
            print("El asiento ya está ocupado.")
        else:
            asientos[fila, columna] = 0
            print("Asiento comprado exitosamente.")
    except IndexError:
        print("Asiento no válido.")

def eliminar_compra(fila, columna):
    try:
        if asientos[fila, columna] == 0:
            asientos[fila, columna] = fila * 4 + columna + 1
            print("Compra eliminada exitosamente.")
        else:
            print("El asiento no está ocupado.")
    except IndexError:
        print("Asiento no válido.")

def menu():
    while True:
        print("\n----- MENU -----")
        print("1. Mostrar asientos disponibles")
        print("2. Comprar asiento")
        print("3. Eliminar compra de asiento")
        print("4. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            mostrar_asientos()
        elif opcion == "2":
            mostrar_asientos()
            fila = int(input("Ingrese la fila del asiento: ")) - 1
            columna = int(input("Ingrese la columna del asiento: ")) - 1
            comprar_asiento(fila, columna)
        elif opcion == "3":
            fila = int(input("Ingrese la fila del asiento: ")) - 1
            columna = int(input("Ingrese la columna del asiento: ")) - 1
            eliminar_compra(fila, columna)
        elif opcion == "4":
            break
        else:
            print("Opción inválida. Intente nuevamente.")

menu()
