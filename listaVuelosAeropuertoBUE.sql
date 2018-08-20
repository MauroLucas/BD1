#Listado de vuelos realizados mostrando código, marca, modelo y matrìcula del avión,
#Código IATA del Aeropuerto origen, Código IATA del Aeropuerto destino, fecha hora partida,
#fecha hora llegada y CUIL piloto que hayan partido del aeropuerto “BUE” ordenados por
#fecha hora de partida

select vuelo.codigo as CodigoVuelo,aeropuetoOrigen,aeropuertoDestino,fechaArrivo,fechaPartida,cuilPiloto

from vuelo 

inner join avion 
on vuelo.matriculaAvion=avion.matricula 

inner join marca
on avion.codigoMarca=marca.codigo

where aeropuetoOrigen='BUE'
order by fechaPartida asc