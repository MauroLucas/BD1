#Cantidad de vuelos por pasajero (apellido, nombre, dni, cantidad)
select apellido,nombre,dni,count(dni)
from pasajero
inner join lista_pasajeros
on lista_pasajeros.dniPasajero=pasajero.dni
group by pasajero.dni
