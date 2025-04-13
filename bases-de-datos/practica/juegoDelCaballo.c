#include <stdio.h>
#include <stdlib.h>

#define N 8

int tablero[N][N] = {0}; // 0 = vacío, otro número = paso del caballo

// Estructura del nodo para backtracking (no es necesaria estrictamente, pero ayuda si querés reconstruir caminos)
typedef struct Nodo {
    int x;
    int y;
    int movimiento[2]; // Movimiento del caballo
    struct Nodo* padre;
} Nodo;

int movimientos[8][2] = {
    {2, 1}, {1, 2}, {-1, 2}, {-2, 1},
    {-2, -1}, {-1, -2}, {1, -2}, {2, -1}
};

int movimientoIlegal(int x, int y) {
    return x < 0 || x >= N || y < 0 || y >= N;
}

int movimientoValido(int x, int y) {
    return !movimientoIlegal(x, y) && tablero[x][y] == 0;
}

int tableroCompleto() {
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            if (tablero[i][j] == 0)
                return 0;
    return 1;
}

void imprimirTablero() {
    printf("\n");
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++)
            printf("%2d ", tablero[i][j]);
        printf("\n");
    }
}

int resolver(Nodo* nodo, int paso) {
    // Si completamos el tablero, éxito
    if (tableroCompleto())
        return 1;

    for (int i = 0; i < 8; i++) {
        int nx = nodo->x + movimientos[i][0];
        int ny = nodo->y + movimientos[i][1];

        if (movimientoValido(nx, ny)) {
            tablero[nx][ny] = paso;

            Nodo siguiente;
            siguiente.x = nx;
            siguiente.y = ny;
            siguiente.movimiento[0] = movimientos[i][0];
            siguiente.movimiento[1] = movimientos[i][1];
            siguiente.padre = nodo;

            if (resolver(&siguiente, paso + 1))
                return 1;

            // Backtrack
            tablero[nx][ny] = 0;
        }
    }

    return 0;
}

int main() {
    int x, y;
    do {
        printf("Introduce la posicion del caballo (x y entre 0 y 7): ");
        scanf("%d %d", &x, &y);
        if (movimientoIlegal(x, y))
            printf("Posicion invalida. Intente de nuevo.\n");
    } while (movimientoIlegal(x, y));

    Nodo raiz;
    raiz.x = x;
    raiz.y = y;
    raiz.movimiento[0] = 0;
    raiz.movimiento[1] = 0;
    raiz.padre = NULL;

    tablero[x][y] = 1;

    if (resolver(&raiz, 2)) {
        printf("¡Se encontró una solución!\n");
        imprimirTablero();
    } else {
        printf("No se encontró una solución.\n");
    }

    return 0;
}
