class Product
   # Initializes the product Object
   def initialize(id,name, description, price)
      @id = id
      @name = name
      @description = description
      @price =price
      @quantity = 1
   end
   # Create read and write accessors
   attr_accessor :name, :description, :quantity
   
   # Create a read only accessor
   attr_reader :id
   # simulate a reader (GET)
   def price
      @price
   end
   # Simulate a writer
   def price=(another_price)
      @price = another_price
   end
   
   def subtotal
      @price * @quantity
   end
end

# User Class
class User
	def initialize(id, name)
		@id = id
		@name = name
	end

	# GET AND SETS
	attr_accessor :id, :name
end



#usuario = Usuario.new(2222222222, "Julio Verne")
#carrito = Carrito.new(usuario)
#puts usuario.cedula

#producto1 = Producto.new(1,'patineta',"Una patineta de plástico",25000)
#producto2 = Producto.new(2,'carrito',"Un carrito a control remoto", 35000)
#producto3 = Producto.new(3,'muñeca', "Una muñeca de Trapo", 7500)

carrito.agregar_producto(producto1)
carrito.agregar_producto(producto2)
carrito.agregar_producto(producto3)
carrito.agregar_producto(producto3)
puts carrito.total_compra()
carrito.mostrar_productos







