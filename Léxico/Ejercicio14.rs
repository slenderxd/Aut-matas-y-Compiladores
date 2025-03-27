use std::io::{self, Write};

//estructura con lista de tokens
#[derive(Debug)]
struct Parser{
    tokens:Vec<String>, //lista
    index: usize, //apuntador int dinámico
    
    
}
//métodos del parser 
impl Parser{
    //inicializa parser con su lista e indice  
    fn new(tokens: Vec<String>)->Self{
        Parser{tokens, index:0}
    }
    
    //toma el token con el index actual
    fn token_actual(&self) -> Option<&String>{
        self.tokens.get(self.index)
    }
    
    //avanza del token actual si se cumple la condición
    fn consumir(&mut self, esperado: &str) -> Result<(), String> {
        if let Some(token) = self.token_actual(){
            if token == esperado {
                self.index += 1;
                Ok(())
            }else{
                Err(format!(
                    "Error de sintaxis: Se esperaba '{}', pero se encontró '{}'",
                    esperado, token))
            }
        }else {
        Err("Error de sintaxis: Fin inesperado de entrada.".to_string())
    }
    }
    
    //Parseo
    //Comienza analisis con e()
    fn parse(&mut self)->Result<(),String> {
        self.e()?; // Llamada a 'e'
        if self.index < self.tokens.len() {
            return Err("Error de sintaxis: Tokens extra no procesados.".to_string());
        }
        println!("Análisis sintáctico exitoso.");
        Ok(())
    }

     fn e(&mut self) -> Result<(),String> {
        self.t()?;  // Llamada a T
        self.e_()?; // Llamada a E_
        Ok(())
    }

fn e_(&mut self) -> Result<(),String> {
        if let Some(token) =self.token_actual(){
            let token_str = token.clone();
            
            if token_str == "+" ||token_str == "-"{
                self.consumir(&token_str)?; // Consumir token
                self.t()?;  // Llamada a T
                self.e_()?; // Llamada recursiva a E_
            }
        } // caso ε -  no hacemos nada
        Ok(())
    }
    fn t(&mut self) -> Result<(), String> {
        self.f()?; // Llamada a F
        self.t_()?; // Llamada a T_
        Ok(())
    }


    fn t_(&mut self) -> Result<(), String> {
        if let Some(token) = self.token_actual() {
            let token_str = token.clone();//clonar token
            if token_str == "*" || token_str == "/" {
                self.consumir(&token_str)?; // Consumiendo el token
                self.f()?;  // Llamada a F
                self.t_()?; // Llamada recursiva a T_
            }
        }
        // ε , no hacemos nada
        Ok(())
    }

    fn f(&mut self) -> Result<(), String> {
        if let Some(token) = self.token_actual() {
            let token_str = token.clone();
            if token_str == "(" {
                self.consumir(&token_str)?; // Consumiendo '('
                self.e()?;  // Llamada a 'E' para procesar dentro de paréntesis
                self.consumir(")")?;  // Consumiendo ')'
            } else if token_str.chars().all(char::is_alphanumeric) {
                self.consumir(&token_str)?;  // Consumiendo identificador o número
            } else {
                return Err(format!("Error de sintaxis: Token inesperado '{}'", token));
            }
        } else {
            return Err("Error de sintaxis: Fin inesperado de entrada.".to_string());
        }
        Ok(())
    }
}

// Tokenizar entrada 
fn tokenizar(input: &str) -> Vec<String> {
    input.split_whitespace().map(|s| s.to_string()).collect()
}

fn main() {
    // Leer la entrada del usuario
    print!("Introduce una expresión matemática: ");
    io::stdout().flush().unwrap(); // Mensaje impreso antes de la lectura

    let mut input = String::new();
    io::stdin().read_line(&mut input).expect("Error al leer la línea");
    let input = input.trim(); // Eliminar saltos de línea 

    // Tokenizar la entrada
    let tokens = tokenizar(input);

    let mut parser = Parser::new(tokens);
    if let Err(err) = parser.parse() {
        eprintln!("{}", err);
    }
}
