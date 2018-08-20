#Cantidad de pasajeros transportados, por localidad del pasajero (localidad, cantidad)
select count(distinct dni), localidad
from pasajero
inner join lista_pasajeros
on lista_pasajeros.dniPasajero=pasajero.dni
group by localidad