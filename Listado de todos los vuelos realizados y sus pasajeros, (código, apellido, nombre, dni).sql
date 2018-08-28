#Listado de todos los vuelos realizados y sus pasajeros, (código, apellido, nombre, dni)
select codigoVuelo, apellido , nombre , vuelo_x_pasajero.dniPasajero
from vuelo_x_pasajero

inner join pasajero
on pasajero.dni = vuelo_x_pasajero.dniPasajero

inner join persona
on persona.dni= pasajero.dni