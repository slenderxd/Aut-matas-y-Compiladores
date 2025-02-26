#include <bits/stdc++.h> //librer�a general
using namespace std;

int main(){
    //declaraciones iniciales
    int N, S, D, q0, T, C, Q;
    int i,x,z;
    char caracter,y;
    string cadena;

    //ingreso de datos l�nea 1
    cin>>N>>S>>D>>q0>>T>>C;
    Q=q0; //estado inicial

    //estados finales
    vector<int>finales(T);

    //mapa columnas digitos, filas enteros
    unordered_map<int, unordered_map<char, int>> alfabeto;

    //llenado de mapa en nulo
    for(i=1;i<=S;i++){
        cin>>caracter;
        alfabeto[i][caracter]= -1;
    }

    //registro de estados finales
    for(i=0;i<T;i++){
        cin>>finales[i];
    }

    //llenado de mapa con transiciones
    for(i=0;i<D;i++){
        cin>>x>>y>>z;
        alfabeto[x][y]=z;
    }

    cin.ignore(); //ignora salto de l�nea residual

    for(i=0;i<C;i++){
        //leer cadena
        getline(cin,cadena);
        //reiniciar valor inicial
        Q=q0;
        //caso cadena vac�a
        if (cadena.empty()) {
            if (find(finales.begin(), finales.end(), Q) != finales.end()) {
                cout << "ACEPTADA" << '\n';
            } else {
                cout << "RECHAZADA" << '\n';
            }
        } else {
            //cadena no vac�a
            //se recorre la cadena
            for(int j=1;j<=cadena.length();j++){
                    //verificar si existe transici�n
                if (alfabeto[Q].find(cadena[j-1]) != alfabeto[Q].end() && alfabeto[Q][cadena[j]] != -1) {
                   //actualizar Q
                    Q = (alfabeto[Q][cadena[j-1]]);
                } else {
                    //termina procesamiento
                    Q=-1;
                    break;
                }
            }

            if (Q!=-1 && find(finales.begin(), finales.end(), Q) != finales.end()) {
                cout << "ACEPTADA" << '\n';
            }else{
                cout << "RECHAZADA" << '\n';
            }
        }
        }
        return 0;
    }

