# Ejemplos variados para la introducción en el uso de RUBY
# Tomado de: 
#  - Agile Web Development with Rails, 3ra edición
#  - Wikipedia, http://en.wikipedia.org/wiki/Ruby_(programming_language)
# Recompilado por Rodrigo Rodriguez

################################################
################     Métodos    ################
################################################

=begin 
Este tipo de comentario solamente funciona en Ruby, en Rails no es comentario.
=end
puts "####### Métodos #######"

# Ejemplo 1: parámetro y retorno simple
def decir_buenasNoches(nombre)
  resultado = "Buenas Noches, #{nombre}"
  #otra forma de concatenar
  resultado = "Buenas Noches, " + nombre
  return resultado
end
# Llamado al método y lo muestra en la consola
puts decir_buenasNoches('compañeros')

# Ejemplo 2: parámetro y retorno simple (primera letra en mayúscula y omite el return)
def decir_buenosDias(nombre)
  #no hace falta el Return ya que Ruby retorna la última expresión realizada
  resultado = "Buenos Días, #{nombre.capitalize}"
end
# Llamado al método y lo muestra en la consola
puts decir_buenosDias('amigos')

################################################
################     Clases     ################
################################################

puts "\n####### Clases #######"
# nombre de la clase debe de empezar con mayúscula

# Ejemplo 1: Clase simple, contiene un constructor y un método decir
class Greeter
  def initialize(name)
    # Se define una variable de instancia que va a almacenar el nombre
    @name = name
  end
  def say(phrase)
    #método simple que retorna la frase solicitada y el nombre de el saludador
    puts "#{phrase}, #{@name}"
  end
  #El método equivalente al GET
  def name
    @name
  end
  #El método equivalente al SET
  def name=(new_name)
    @name = new_name
  end
end

# Test de la clase Greeter
saludador = Greeter.new("Alonso")
saludador.say("Hola MUNDO!!")
saludador.name = "Alberto"
saludador.say("Hola MUNDO!!")

# Ejemplo 2: Clase simple, contiene un constructor y métodos automáticos para get y set
class Greeter2
  def initialize(name, age, greeting)
    # Se define una variable de instancia que va a almacenar el nombre
    @name = name
    @age = age
    @greeting = greeting
  end
  
  #pueden ponerse o dejar sin paréntesis el método
  def sayFacts
    #método simple que retorna la frase solicitada y el nombre de el saludador
    puts "#{greeting}, #{@name}, I'm #{@age}"
  end
  
  attr_accessor :name     # crea métodos de escritura y de lectura
  attr_reader   :greeting # crea métodos de lectura
  attr_writer   :age      # crea métodos de escritura
end

# Test de la clase Greeter2
saludador = Greeter2.new("Juan", 23, "Hello")
saludador.sayFacts()
saludador.name = "Alberto"
puts saludador.greeting() #pueden dejarse o quitarse los parentesis y nada cambia
 
#Ejemplo 3: Clase con protección
class MyClass
  def m1      # Método público, permite que cualquiera lo utilice
  end
  
  protected
  def m2      # Método protegido, puede utilizarlo tanto la misma instancia como otras instancias de la misma clase
  end

  private
  def m3      # Método privado, puede llamarse SOLO por la misma instancia
  end
end
=begin
# Ejemplo 4: Clase con herencia
#Definición de la clase Order, es una subclase de la clase Base ActiveRecord
class Order #< ActiveRecord::Base
  has_many :line_items
  # Esto hace que el método sea un método estático (simplemente se hace Order.find_all_unpaid)
  def self.find_all_unpaid
    find(:all, 'paid = 0' )
  end
  
  def total
    sum = 0
    line_items.each {|li| sum += li.total}
  end
end
=end

################################################
################     Módulo     ################
################################################

# Módulos son encapsuladores de atributos y métodos (sin ser considerados clases) y pueden ser utilizados
# por distintas clases. Además puede ser usado como namespace (en caso de tener métodos con el mismo nombre=
 
module StoreHelper
  def capitalize_words(string)
    string.gsub(/\b\w/) { $&.upcase }
  end
end

################################################
############     Arrays - Hashs     ############
################################################

puts "\n####### Arrays - Hashes #######"

# Si se pide un índice negativo se empieza a contar desde el final
# Si se pide por ejemplo a[1,5] va a hacer un subarreglo
# Si se hace esta asignación: a[1,2] = 'algo', sustituye los lugares 1 y 2 del arreglo por una sola vez algo
# Ejemplo 1: Array Números

# Para concatenar en un arreglo se utiliza el <<
class EjArrayNumeros
  def initialize
    @a = [2,3,4,5]
  end
  def recorrer  
    ages = []
    for num in @a 
      # concatena en el arreglo vacío
      ages << num
    end
    # imprime el arreglo
    puts ages
  end
end

# crea una instancia de la clase arregloNumeros
ejArray = EjArrayNumeros.new()
ejArray.recorrer

# Ejemplo 2: Array de palabras
class EjArrayPalabras
  def initialize
    @a = [ 'ant' , 'bee' , 'cat' , 'dog' , 'elk' ]
    # Esta instrucción hace lo mismo
    @b = %w{ ant bee cat dog elk }
  end
  attr_accessor :a     # crea métodos de escritura y de lectura
  attr_accessor :b     # crea métodos de escritura y de lectura
end

ejArray = EjArrayPalabras.new()
puts ejArray.a
puts ejArray.b

# Ejemplo 3: Hash de instrumentos musicales
# Para declarar un hash es necesario declarar utilizando {} en vez de [] y usar un objeto (lo q sea) como llave
class EjHashInstrumentos
  def initialize
    #declaración del Hash de instrumentos - tipo
    @inst_section = {
      :cello => 'string' ,
      :clarinet => 'woodwind' ,
      :drum => 'percussion' ,
      :oboe => 'woodwind' ,
      :trumpet => 'brass' 
    }
  end
  attr_accessor :inst_section     # crea métodos de escritura y de lectura
end

# test de la clase EjHashInstrumentos
ejHash = EjHashInstrumentos.new
puts ejHash.inst_section[:drum]
puts ejHash.inst_section[:violin]

# Algunos métodos adicionales que se le pueden hacer a un arreglo
a = [1, 'hi', 3.14, 1, 2, [4, 5]]

puts a[2]           # Obtiene el elemento en la posición 2 del arreglo
puts a.[](2)        # Obtiene el elemento en la posición 2 del arreglo
puts a.reverse      # Invierte el Arreglo
puts a.flatten.uniq # Quita los repetidos
  
# Al utilizar la función 1..5 (incluye al 5) y al hacer 1...5 (excluye al 5)

# Esta función convierte a un arreglo el enum de números del 1 al 10 
arregloNumeros = (1..10).to_a
print arregloNumeros

################################################
#########    Estructuras de control    #########
################################################

puts "\n####### Estructuras de control #######"

count = 4
tries = 3
# uso del If
if count > 10
  puts "Try again"
elsif tries == 3
  puts "You lose"
else
  puts "Enter a number"
end

weight = 5
# Utilización del If o While de una sola línea (el while-if va luego de la expresión)
weight = weight * 1.2 while weight < 100
puts weight

# Uso del While
while weight > 100 && weight < 125 # se puede usar && ó and, || ó or 
# En Ruby no hay "variable++"
  weight += 1
end
puts weight

################################################
#########    Expresiones Regulares     #########
################################################

puts "\n####### Expresiones Regulares #######"
# Las expresiones regulares van entre /patron/ o entre %r{patron} 
patron1 = /(pa|ma)ta/
patron2 = %r{(pa|ma)ta} 
line = "mata"
# Línea que compara el texto con el patron establecido
if line =~ patron2
  puts "La expresión es correcta"
end

################################################
#########     Bloques e iteradores     #########
################################################

puts "\n####### Bloques e iteradores #######"
# Los bloques e iteradores son muy utilizados en ruby

=begin 
##### Sintaxis para la declaración de bloques
{ puts "Hello, World!" } # Notar los { }
 o
do puts "Hello, World!" end
=end

# Ejemplo 1: Utilización de un bloque 
# En una instancia de una variable, recordar un bloque.
def remember(&a_block)
  @block = a_block
end
# Invocar el método anterior, dado un determinado bloque que recibe un nombre, entre | | van los parámetros
remember {|name| puts "Hello, #{name}!"}
# Cuando se requiera llamar al bloque
@block.call("Jon")

# Ejemplo 2:  Creación de un método get y set para un valor determinado

def create_set_and_get(closure_value=0) # El valor por defecto es 0
  #retorna el código que va a contener el setter y el getter 
  return Proc.new {|x| closure_value = x}, Proc.new { closure_value }
end

setter, getter = create_set_and_get  # Retorna 2 elementos (bloques de código) 
setter.call(21)
puts getter.call
 
# Ejemplo 3: Utilización del comando yield para invocar al bloque
def use_hello
  # invoca el bloque que se le pasó
  yield "Usando el yield"
end
# Invoca el método de arriba, pasándole un bloque
use_hello {|string| puts string}

# Ejemplo 4: Utilización de each y each_index
# declara el arreglo
array = [1, 'hi', 3.14]
# utiliza el array.each para recorrer el arreglo (notese la inyección de un bloque) 
array.each {|item| puts item }
# utiliza el array.each_index para recorrer el arreglo
array.each_index {|index| puts "#{index}: #{array[index]}" }

# crea dinámicamente un arreglo desde el 3 hasta el 5
(3..5).each {|num| puts num }

# Ejemplo 5: Utilización de for
suma = 0
for i in 0...10
  suma += i
end
puts suma

# Ejemplo 6: Utilización de la función find para busquedas en arreglos
key = 'hi' 
puts array.find { |aSong| key == aSong }


################################################
#########     Manejo de Excepciones    #########
################################################

#El manejo de excepciones se hace utilizando la operación rescue

# Ejemplo 1: Estructura básica para manejo de excepciones
begin
# Código a ejecutar que podría causar la excepción
rescue Exception # Rescata de cualquier excepción
# En caso de que se de la excepcion
end

################################################
###########     NOTAS ADICIONALES    ###########
################################################

puts "\n####### Notas Adicionales #######"

# Determinar si una variable es de un determinado tipo
key = 1
if key.kind_of?(Integer) # Determina si una variable es de un tipo específico
  puts "Es un entero"  
end

# Funciones especiales de los números
3.times        { print "X " }
1.upto(5)      { |i| print i, " " }
99.downto(95)  { |i| print i, " " }
50.step(80, 5) { |i| print i, " " }

# Pasar de String a Entero
"3".to_i # convierte de string a entero

# Declarar un String en forma de documento
aString = <<END_OF_STRING
    The body of the string
    is the input lines up to
    one ending with the same
    text that followed the '<<'
END_OF_STRING

#prueba = /^[a-z0-9A-Z_ áéíóúÁÉÍÓÚñÑ,]+$/.match("Rodrigo rodrígeuz Ramírez .-! Alonso Rodríguez")
#prueba = /^([a-z0-9A-Z_ áéíóúÁÉÍÓÚñÑ]{3,}((\s)*(\,)(\s)*)?)*$/.match("Rodrigo rodrígeuz Ramírez ,Al")
prueba =  /^([a-z0-9A-Z_ áéíóúÁÉÍÓÚñÑ]{3,}(\,)?(\s)*)*$/.match("Rodrigo Rodríguez Ramírez , Al")
prueba2 = /^(([a-z0-9A-ZáéíóúÁÉÍÓÚñÑ]{3,}(\s)*)*(\,)?(\s)*)*$/.match("Rodrigo Rodríguez Ramírez , Al")
puts prueba
puts prueba2


