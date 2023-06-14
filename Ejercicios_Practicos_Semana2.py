import numpy as np

#EJERCICIO 1:
matriz_1 = np.array([[1,2,3],
                   [4,5,6],
                   [7,8,9]
                   ])


matriz_2 = np.array([[10,11,12],
                   [13,14,15],
                   [16,17,18]
                   ])

print("Matriz 1: \n", matriz_1)
print("Matriz 2: \n", matriz_2)

var1 = matriz_1
var2 = matriz_2

print("Matriz Multiplicada: \n", var1 * var2)

#EJERCICIO 2:
matriz_3 = np.random.randint(0, 101, size=(4, 5))

print("Suma de Matriz 3: \n", np.sum(matriz_3))
print("Suma de Matriz 3 fila 1: \n", np.sum(matriz_3[0,:]))
print("Suma de Matriz 3 fila 2: \n", np.sum(matriz_3[1,:]))
print("Suma de Matriz 3 fila 3: \n", np.sum(matriz_3[2,:]))
print("Suma de Matriz 3 fila 4: \n", np.sum(matriz_3[3,:]))

print("Matriz 3: \n", matriz_3)


for i in range(4):
    #print(f'Suma Fila {i+1} {matriz_3[i,:]} es = {np.sum(matriz_3[i,:])}')
    print(f"Índice ({i+1})")
    print(f"Suma Fila: ({np.sum(matriz_3[i,:])})")

for i in range(5):
    #print(f'Suma Fila {i+1} {matriz_3[i,:]} es = {np.sum(matriz_3[i,:])}')
    print(f"Índice ({i+1})")
    print(f"Suma Columna: ({np.sum(matriz_3[:,i])})")
    
bus_asiento = np.zeros((10,4), dtype=int)
print(bus_asiento)

bus = np.arange(40).reshape(10,4)
bus + 1
print(bus)


