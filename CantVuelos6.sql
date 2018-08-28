#Cantidad de vuelos por pasajero (apellido, nombre, dni, cantidad)
select apellido,nombre,pasajero.dni,count(pasajero.dni) as cantidaddevuelos
from pasajero
inner join persona
on persona.dni=pasajero.dni
inner join vuelo_x_pasajero
on vuelo_x_pasajero.dniPasajero=pasajero.dni
group by pasajero.dni
