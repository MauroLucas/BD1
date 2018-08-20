#Listado de vuelos realizados mostrando código, marca, modelo y matrìcula del avión,
#Código IATA del Aeropuerto origen, Código IATA del Aeropuerto destino, fecha hora partida,
#fecha hora llegada y CUIL piloto

select v.codigo as CodigoVuelo,modelo as ModeloAvion ,matriculaAvion,aeropuetoOrigen,aeropuertoDestino,fechaArrivo,fechaPartida,cuilPiloto

from vuelo as v

inner join avion as a
on v.matriculaAvion=a.matricula 

inner join marca
on a.codigoMarca=marca.codigo

