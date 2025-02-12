import tkinter as tk
import re

ccontador=0
scontador=0
lexemas=0
palabras=0
numeros=0
combinadas=0

from tkinter.filedialog import askopenfilename
def clasificar(entrada):
    global ccontador, scontador, lexemas, palabras, numeros, combinadas
    ccontador=len(entrada)
    scontador=len(entrada.replace(" ",""))  

    lexemas_regex=r'^[a-zA-Z0-9]+$'
    palabras_regex=r'^[a-zA-Z]+$'
    numeros_regex=r'^[0-9]+$'
    combinadas_regex=r'^[a-zA-Z]+[0-9]+$'

    separados= entrada.split()
    
    for x in separados:
        if re.match(lexemas_regex, x):
            lexemas += 1
        if re.match(palabras_regex, x):
            palabras += 1
        if re.match(numeros_regex, x):
            numeros += 1
        if re.match(combinadas_regex, x):
            combinadas += 1



def seleccionar_archivo():
    root = tk.Tk()
    root.withdraw()

    fn = askopenfilename(
        title="Seleccione un archivo",
        filetypes=[("Todos los archivos","*"), ("Archivos de texto","*.txt")]
    )

    if fn:
        with open(fn,"r",encoding="utf-8") as archivo:
            cadena=archivo.read()
        print("Contenido del Archivo:" , cadena)
        return cadena
    else:
        print("No se seleccióno ningún archivo.")

if __name__ == "__main__":
    entrada=seleccionar_archivo()
    clasificar(entrada)
    print("Total de caracteres (con espacios): "+str(ccontador))
    print("Total de caracteres (sin espacios): "+str(scontador))
    print("Total de lexemas: "+str(lexemas))
    print("Total de palabras: "+str(palabras))
    print("Total de numeros: "+str(numeros))
    print("Total de combinadas: "+str(combinadas))





