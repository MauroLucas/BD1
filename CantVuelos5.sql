#Cantidad de pasajeros transportados, por dìa (fecha, cantidad)
select count(fechaPartida),fechaPartida
from vuelo
group by fechaPartida