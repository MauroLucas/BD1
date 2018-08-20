#Cantidad de vuelos realizados que hayan partido del aeropuerto “MDQ”
select count(aeropuetoOrigen),aeropuetoOrigen
from vuelo
where aeropuetoOrigen='MDQ'