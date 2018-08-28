#Listado de pasajeros de la empresa (apellido, nombre, dni, domicilio) mostrando sólo a los
#que participan del programa de viajeros frecuentes, ordenados por apellido y nombre
select apellido,nombre,persona.dni, calle, numero, localidad ,provincia
from pasajero
inner join persona
on persona.dni=pasajero.dni
inner join domicilio
on persona.idDomicilio=domicilio.idDomicilio
inner join localidad
on domicilio.idLocalidad=localidad.idLocalidad
inner join provincia
on provincia.idProvincia=domicilio.idProvincia
where pasajero.viajeroFrecuente=1