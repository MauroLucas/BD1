#Listado de vuelos realizados mostrando código, marca, modelo y matrìcula del avión,
#Código IATA del Aeropuerto origen, Código IATA del Aeropuerto destino, fecha hora partida,
#fecha hora llegada y CUIL piloto que hayan partido del aeropuerto “BUE” ordenados por
#fecha hora de partida
select vuelo.codigo,matriculaAvion,avion.modelo,marca.nombre as marca,aeropuetoOrigen,aeropuertoDestino,fechaArrivo,fechaPartida

from vuelo

inner join avion
on avion.matricula=vuelo.matriculaAvion

inner join marca
on marca.codigo=avion.codigoMarca

where vuelo.aeropuetoOrigen='BUE'