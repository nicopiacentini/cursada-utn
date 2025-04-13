#include<stdio.h>

int tablero[8][8] = {0}; // 0 = vacio, 1 = caballo

typedef struct Nodo {
    int x;
    int y;
    int movimiento[2]; // Movimiento del caballo
    struct Nodo* padre; // Nodo padre
    struct Nodo* hijos[8]; // Máximo 8 movimientos posibles
} Nodo;

typedef struct NodoStack{
    NodoStack * siguiente;
    Nodo* nodo;
} NodoStack;


NodoStack* pila = (NodoStack*)malloc(sizeof(NodoStack));
void apilar(NodoStack** pila, int movimiento[2]) {
    NodoStack* nuevoNodo = (NodoStack*)malloc(sizeof(NodoStack));
    nuevoNodo->movimiento[0] = movimiento[0];
    nuevoNodo->movimiento[1] = movimiento[1];
    nuevoNodo->siguiente = *pila;
    *pila = nuevoNodo;
}

int* desapilar(NodoStack** pila) {
    if (*pila == NULL) {
        return NULL; // Pila vacía
    }
    NodoStack* nodoAEliminar = *pila;
    int* movimiento = (int*)malloc(2 * sizeof(int));
    movimiento[0] = nodoAEliminar->movimiento[0];
    movimiento[1] = nodoAEliminar->movimiento[1];
    *pila = nodoAEliminar->siguiente;
    free(nodoAEliminar);
    return movimiento;
}
Nodo* raiz = (Nodo*)malloc(sizeof(Nodo));

void inicializarNodo (Nodo* nodo, int i, Nodo* padre){
    if(movimientoValido(padre->x + movimientos[i][0], padre->y + movimientos[i][1])){
        nodo = (Nodo*)malloc(sizeof(Nodo));
        nodo->x = padre->x + movimientos[i][0];
        nodo->y = padre->y + movimientos[i][1];
        nodo->movimiento[0] = movimientos[i][0];
        nodo->movimiento[1] = movimientos[i][1];
        nodo->padre = padre;
    }
    else{
        nodo = NULL; // Movimiento ilegal
    }
}

int movimientos[8][2] = {
    {2, 1}, {1, 2}, {-1, 2}, {-2, 1},
    {-2, -1}, {-1, -2}, {1, -2}, {2, -1}
}; 

int movimientoIlegal(int x, int y){
    return x < 0 || x > 7 || y < 0 || y > 7; 
}

int movimientoValido(int x, int y){
    return tablero[x][y] == 0 && !movimientoIlegal(x, y); 
}

int tableroIncompleto(){
    for(int i = 0; i < 8; i++){
        for(int j = 0; j < 8; j++){
            if(tablero[i][j] == 0)
                return 1; // Hay al menos una casilla vacía
        }
    }
    return 0; // Todas las casillas están ocupadas
}

void llenarTablero(int x, int y){

}

int verificarRama(Nodo* nodo, int movimiento) {
    if (nodo == NULL) {
        return 0; // Nodo inválido
    }

    // Marcar la posición actual como visitada con el número del movimiento
    tablero[nodo->x][nodo->y] = movimiento;

    // Si el tablero está completo, hemos encontrado una solución
    if (!tableroIncompleto()) {
        return 1;
    }

    // Intentar generar y verificar los hijos
    for (int i = 0; i < 8; i++) {
        Nodo* hijo = NULL;
        inicializarNodo(hijo, i, nodo);

        if (hijo != NULL) {
            if (verificarRama(hijo, movimiento + 1)) {
                return 1; // Si una rama lleva a una solución, retornar éxito
            }

            // Limpiar el tablero de todos los movimientos generados por el hijo
            limpiarTableroDesde(hijo);

            free(hijo); // Liberar memoria si no lleva a una solución
        }
    }

    // Desmarcar la posición actual antes de retroceder
    tablero[nodo->x][nodo->y] = 0;

    return 0; // No se encontró solución en esta rama
}

void limpiarTableroDesde(Nodo* nodo) {
    if (nodo == NULL) {
        return;
    }

    // Desmarcar la posición actual
    tablero[nodo->x][nodo->y] = 0;

    // Limpiar recursivamente los hijos
    for (int i = 0; i < 8; i++) {
        if (nodo->hijos[i] != NULL) {
            limpiarTableroDesde(nodo->hijos[i]);
        }
    }
}

int main(){
    int x, y;
    do {
        printf("Introduce la posicion del caballo (x y): ");
        scanf("%d %d", &x, &y); 

        if (movimientoIlegal(x, y))
            printf("Posicion invalida\n");
    } while (movimientoIlegal(x, y));

    if (raiz != NULL) {
        raiz->x = x;
        raiz->y = y;
        raiz->movimiento[0] = 0;
        raiz->movimiento[1] = 0;
        raiz->padre = NULL;
        for (int i = 0; i < 8; i++) {
            inicializarNodo(raiz->hijos[i], i, raiz);
        }
    }

    tablero[x][y] = 1; // Colocar el caballo en la posición inicial

    if (verificarRama(raiz)) {
        printf("Es posible completar el tablero.\n");
    } else {
        printf("No es posible completar el tablero.\n");
    }

    return 0;
}