#Listado de pasajeros de la empresa (apellido, nombre, dni)
select apellido,nombre,persona.dni
from pasajero
inner join persona
on persona.dni=pasajero.dni
