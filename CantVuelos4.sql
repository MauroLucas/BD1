#Cantidad de pasajeros transportados, por localidad del pasajero (localidad, cantidad)
select count(distinct dniPasajero), localidad
from vuelo_x_pasajero
inner join pasajero
on pasajero.dni=vuelo_x_pasajero.dniPasajero

inner join persona
on persona.dni=pasajero.dni

inner join domicilio
on persona.idDomicilio=domicilio.idDomicilio

inner join localidad
on localidad.idLocalidad= domicilio.idLocalidad

group by localidad.localidad