#Listado de vuelos realizados mostrando codigo, Código IATA del Aeropuerto origen, Código
#IATA del Aeropuerto destino, fecha hora partida y fecha hora llegada que hayan partido del
#aeropuerto “BUE” y hayan arribado al aeropuerto “MDQ”

select vuelo.codigo as CodigoVuelo,aeropuetoOrigen,aeropuertoDestino,fechaArrivo,fechaPartida,cuilPiloto

from vuelo 

inner join avion 
on vuelo.matriculaAvion=avion.matricula 

inner join marca
on avion.codigoMarca=marca.codigo

where aeropuetoOrigen='BUE' and aeropuertoDestino='MDQ'
order by fechaPartida asc