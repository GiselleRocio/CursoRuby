class Cliente

	attr_reader :nombre, :cuit

	def initialize(nombre, cuit)
		@nombre = nombre
		@cuit = cuit
	end
end

class Producto

	attr_reader :nombre, :precio, :descripcion

	def initialize(nombre, descripcion,  precio)
		@nombre = nombre
		@descripcion = descripcion
		@precio = precio
	end
end

class Promo

	attr_reader :nombre, :descripcion, :precio

	def initialize (nombre, descripcion, precio)
		@nombre = nombre
		@descripcion = descripcion
		@precio = precio
	end
end

class Detalle_factura 

	attr_reader :precio_linea

	def initialize (cant, producto)
		@cantidad = cant
		@producto = producto.nombre
		@descripcion = producto.descripcion
		@precio_linea = cant * producto.precio
	end
end

class Factura 

	attr_reader :subtotal, :total, :iva

	def initialize (cliente)
		@cliente = cliente
		@detalle_f = Array.new
		@subtotal = 0
		@iva = 0
		@total = 0
	end

	def agregar(detalle)
		detalle_f.push(detalle.cant, detalle.producto)
	end

	def calcular_importes()
		detallef.each do |x|
			@subtotal += x.precio_linea
		end
		@iva = subtotal * 0.21
		@total = iva + subtotal
	end

	def mostrar_detalle()
		detallef.each do |x|
			puts x.cant + " " + x.producto + " "+ x.precio
		end
	end
end

#Main

gaseosa = Producto.new("Sprite", "bebida", 50)
hamburguesa = Producto.new("Paty", "comida", 100)
promo1 = Promo.new("Promo 1", "hamb + gaseosa", 130)
detalle1 = Detalle_factura.new(4, gaseosa)
detalle2 = Detalle_factura.new (3, promo1)
detalle3 = Detalle_factura.new( 1, hamburguesa)
detalle4 = Detalle_factura.new(1, gaseosa)

cliente = Cliente.new("Giselle", 66666)

factura = Factura.new (cliente)

factura.agregar(detalle1)
factura.agregar(detalle2)
factura.agregar(detalle3)
factura.agregar(detalle4)

puts "Cliente + ": cliente.nombre
puts "Detalle: " +  factura.mostrar_detalle
puts "Subtotal: " + factura.subtotal
puts "IVA: " + factura.iva
puts "TOTAL A PAGAR: " + factura.total
