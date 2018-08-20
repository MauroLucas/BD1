#Listado de todos los vuelos realizados y sus pasajeros, (código, apellido, nombre, dni)
select vuelo.codigo,nombre,apellido,dni
from vuelo
inner join lista_pasajeros
on lista_pasajeros.codigoVuelo=vuelo.codigo
inner join pasajero
on pasajero.dni= lista_pasajeros.dniPasajero