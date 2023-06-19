import datetime

def registrar_internos(internos):
    try:
        print("##################################################################")
        rut = input("Ingrese el RUT del interno (formato: 13187343-9): ")
        nombres = input("Ingrese los nombres del interno: ")
        apellidos = input("Ingrese los apellidos del interno: ")
        fecha_nacimiento = input("Ingrese la fecha de nacimiento del interno (formato: aaaa-mm-dd): ")
        fecha_nacimiento = datetime.datetime.strptime(fecha_nacimiento, '%Y-%m-%d')
        edad = datetime.datetime.now().year - fecha_nacimiento.year
        delitos = input("Ingrese los delitos cometidos por el interno: ")
        anios_condena = int(input("Ingrese los años de condena del interno: "))
        unidad_penal = input("Ingrese la unidad penal de detención del interno: ")
        peso = float(input("Ingrese el peso del interno en Kg (formato: 80): "))
        altura = float(input("Ingrese la altura del interno en cm (formato: 1.80): "))

        # Validación de los aspectos requeridos
        if peso < 20 or peso > 150:
            raise ValueError("El peso debe estar entre 20 y 150 kg.")
        if anios_condena < 1 or anios_condena > 50:
            raise ValueError("Los años de condena deben estar entre 1 y 50 años.")

        internos[rut] = {
            "run":rut,            
            "nombres": nombres,
            "apellidos": apellidos,
            "fecha_nacimiento": fecha_nacimiento,
            "edad": edad,
            "delitos": delitos,
            "anios_condena": anios_condena,
            "unidad_penal": unidad_penal,
            "peso": peso,
            "altura": altura
        }

        print("Interno registrado correctamente.")
    except ValueError as e:
        print("Error:", str(e))


def buscar_internos(internos):
    print("##################################################################")
    rut = input("Ingrese el RUT del interno a buscar: ")
    if rut in internos:
        print("Información del interno:")
        print("RUN:", internos[rut]["run"])
        print("Nombres:", internos[rut]["nombres"])
        print("Apellidos:", internos[rut]["apellidos"])
        print("Fecha de nacimiento:", internos[rut]["fecha_nacimiento"])
        print("Edad:", internos[rut]["edad"])
        print("Delitos:", internos[rut]["delitos"])
        print("Años de condena:", internos[rut]["anios_condena"])
        print("Unidad penal de detención:", internos[rut]["unidad_penal"])
        print("Peso:", internos[rut]["peso"], "kg")
        print("Altura:", internos[rut]["altura"], "cm")
    else:
        print("No se encontró ningún interno con ese RUT.")


def imprimir_certificado(internos):
    print("##################################################################")
    rut = input("Ingrese el RUT del interno para imprimir el certificado: ")
    if rut in internos:
        print("##################################################################")
        print("CERTIFICADO DE INTERNOS VIGENTES")
        print("RUN: ", internos[rut]["run"])
        print("INTERNO: ", internos[rut]["nombres"], internos[rut]["apellidos"])
        print("DELITOS: ", internos[rut]["delitos"])
        print("AÑOS DE CONDENA: ", internos[rut]["anios_condena"])
        print("UNIDAD PENAL DE DETENCIÓN: ", internos[rut]["unidad_penal"])
        print("GENDARMERIA DE CHILE")
        # Aquí se podría agregar la lógica para generar el certificado a la fiscalía
    else:
        print("No se encontró ningún interno con ese RUT.")


def mostrar_menu():
    print("##################################################################")
    print("----- MENÚ -----")
    print("1. Registrar Internos")
    print("2. Buscar Internos")
    print("3. Imprimir certificados a fiscalía")
    print("4. Salir")


internos = {}

while True:
    mostrar_menu()
    opcion = input("Seleccione una opción: ")

    if opcion == "1":
        registrar_internos(internos)
    elif opcion == "2":
        buscar_internos(internos)
    elif opcion == "3":
        imprimir_certificado(internos)
    elif opcion == "4":
        break
    else:
        print("Opción inválida. Por favor, seleccione una opción válida.")
