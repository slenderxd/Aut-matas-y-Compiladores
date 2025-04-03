%option noyywrap 

%{
#include <stdio.h>

extern FILE *yyin;


int casas = 0, lugares = 0, personajes = 0;
int Westeros = 0;
int Invernalia = 0;
int Desembarco = 0;
int Nido = 0;
int Altojardin = 0;
int Aguasdulces = 0;
int Rocadragon = 0;
int Casterly = 0;
int Bastion = 0;
int Dorne  = 0;

int Stark = 0;
int Arryn = 0;
int Tully = 0;
int Greyjoy = 0;
int Lannister = 0;
int Tyrell = 0;
int Martell = 0;
int Baratheon = 0;  
int Targaryen = 0;

int Eddard = 0;
int Catelyn = 0;
int Arya = 0;
int Sansa = 0;
int Jon = 0;
int Robert = 0;
int Joffrey = 0;
int Stannis = 0;
int Aegon = 0;
int Daenerys = 0;
int Aerys = 0;
int Tywin = 0;
int Jaime = 0;
int Tyrion = 0;
int Cersei = 0;


%}

%%
Westeros {Westeros++; lugares++;}
Invernalia {Invernalia++; lugares++;}
Desembarco[ ]del[ ]Rey {Desembarco++; lugares++;}
Nido[ ]de[ ][ÁáAa]guilas {Nido++; lugares++;}
Altojard[íi]n  {Altojardin++; lugares++;}
Aguasdulces	{Aguasdulces++; lugares++;}
Rocadrag[óo]n {Rocadragon++; lugares++;}
Roca[ ][Cc]asterly {Casterly++; lugares++;}
Basti[óo]n[ ]de[ ][Tt]ormentas {Bastion++; lugares++;}
Dorne {Dorne++; lugares++;}

Stark {Stark++; casas++;}
Arryn {Arryn++; casas++;}
Tully {Tully++; casas++;}
Greyjoy {Greyjoy++; casas++;}
Lannister  {Lannister++; casas++;}
Tyrell  {Tyrell++; casas++;}
Martell {Martell++; casas++;}
Baratheon  {Baratheon++; casas++;}
Targaryen  {Targaryen++; casas++;}

Eddard  {Eddard++; personajes++;}
Catelyn {Catelyn++; personajes++;}
Arya {Arya++; personajes++;}
Sansa {Sansa++; personajes++;}
Robert {Robert++; personajes++;}
Joffrey {Joffrey++; personajes++;}
Stannis {Stannis++; personajes++;}
Aegon  {Aegon++; personajes++;}
Daenerys {Daenerys++; personajes++;}
Aerys {Aerys++; personajes++;}
Tywin {Tywin++; personajes++;}
Jaime {Jaime++; personajes++;}
Tyrion {Tyrion++; personajes++;}
Cersei {Cersei++; personajes++;}
Jon {Jon++; personajes++;}

.

\n


%%
float por(int ind, int full) {

    if (full == 0) return 0.0;
    
    return ((float) ind / full) * 100.0;
}

int main(int argc, char **argv){
    if(argc > 1){
        FILE *file = fopen(argv[1], "r");
        if(!file){
            perror(" No se pudo abrir el archivo ");
            return 1;
        }
        yyin = file;
    }

    yylex();

    printf("\nTotal de Lugares: %d\n", lugares);

    printf("\nWesteros: %d\t\t Porcentaje: %.2f%%", Westeros, por(Westeros, lugares));
    printf("\nInvernalia: %d\t\t Porcentaje: %.2f%%", Invernalia, por(Invernalia,lugares));
    printf("\nDesembarco del Rey: %d\t Porcentaje: %.2f%%", Desembarco, por(Desembarco, lugares));
    printf("\nNido de Aguilas: %d\t Porcentaje: %.2f%%", Nido, por(Nido, lugares));
    printf("\nAltojardin: %d\t\t Porcentaje: %.2f%%", Altojardin, por(Altojardin, lugares));
    printf("\nAguasdulces: %d\t\t Porcentaje: %.2f%%", Aguasdulces, por(Aguasdulces, lugares));
    printf("\nRocadragon: %d\t\t Porcentaje: %.2f%%", Rocadragon, por(Rocadragon, lugares));
    printf("\nRoca Casterly: %d\t Porcentaje: %.2f%%", Casterly, por(Casterly, lugares));
    printf("\nBastion de Tormentas: %d\t Porcentaje: %.2f%%", Bastion, por(Bastion, lugares));
    printf("\nDorne: %d\t\t Porcentaje: %.2f%%\n\n", Dorne, por(Dorne, lugares));
    
    printf("\nTotal de Casas: %d\n", casas); 

    printf("\nStark: %d\t Porcentaje: %.2f%%", Stark, por(Stark, casas));
    printf("\nArryn: %d\t Porcentaje: %.2f%%", Arryn, por(Arryn, casas));
    printf("\nTully: %d\t Porcentaje: %.2f%%", Tully, por(Tully, casas));
    printf("\nGreyjoy: %d\t Porcentaje: %.2f%%", Greyjoy, por(Greyjoy, casas));
    printf("\nLannister: %d\t Porcentaje: %.2f%%", Lannister, por(Lannister, casas));
    printf("\nTyrell: %d\t Porcentaje: %.2f%%", Tyrell, por(Tyrell, casas));
    printf("\nMartell: %d\t Porcentaje: %.2f%%", Martell, por(Martell, casas));
    printf("\nBaratheon: %d\t Porcentaje: %.2f%%", Baratheon, por(Baratheon, casas));
    printf("\nTargaryen: %d\t Porcentaje: %.2f%%\n", Targaryen, por(Targaryen, casas));

    
    printf("\nTotal de Personajes: %d\n", personajes); 

   printf("\nEddard: %d\t Porcentaje: %.2f%%", Eddard, por(Eddard, personajes));
    printf("\nCatelyn: %d\t Porcentaje: %.2f%%", Catelyn, por(Catelyn, personajes));
    printf("\nArya: %d\t Porcentaje: %.2f%%", Arya, por(Arya, personajes));
    printf("\nSansa: %d\t Porcentaje: %.2f%%", Sansa, por(Sansa, personajes));
    printf("\nRobert: %d\t Porcentaje: %.2f%%", Robert, por(Robert, personajes));
    printf("\nJoffrey: %d\t Porcentaje: %.2f%%", Joffrey, por(Joffrey, personajes));
    printf("\nStannis: %d\t Porcentaje: %.2f%%", Stannis, por(Stannis, personajes));
    printf("\nAegon: %d\t Porcentaje: %.2f%%", Aegon, por(Aegon, personajes));
    printf("\nDaenerys:  %d\t Porcentaje: %.2f%%", Daenerys, por(Daenerys, personajes));
    printf("\nAerys: %d\t Porcentaje: %.2f%%", Aerys, por(Aerys, personajes));
    printf("\nTywin: %d\t Porcentaje: %.2f%%", Tywin, por(Tywin, personajes));
    printf("\nJaime: %d\t Porcentaje: %.2f%%", Jaime, por(Jaime, personajes));
    printf("\nTyrion: %d\t Porcentaje: %.2f%%", Tyrion, por(Tyrion, personajes));
    printf("\nCersei: %d\t Porcentaje: %.2f%%", Cersei, por(Cersei, personajes));
    printf("\n\nJon Aegon Targarien, el Primero con el Nombre, Rey de los Andalos, los Rhoynars y Los Primeros Hombres, Protector del Reino, Senior de los 7 Reinos, Legitimo Heredero del Trono de Hierro, Hijo del Hielo y el Fuego, El Lobo Blanco, Unificador del Reino y el Pueblo Libre, El Principe que fue Prometido y Rey en el Norte: %d\t Porcentaje: %.2f%%\n", Jon, por(Jon, personajes));

    
       

    if(argc > 1){
        fclose(yyin);
    }

    return 0;
}
