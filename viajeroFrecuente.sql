#Listado de pasajeros de la empresa (apellido, nombre, dni, domicilio) mostrando sólo a los
#que participan del programa de viajeros frecuentes, ordenados por apellido y nombre
select nombre,apellido,dni,calle,numero,localidad from pasajero
where viajeroFrecuente=1
order by apellido, nombre asc  