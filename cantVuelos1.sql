#Cantidad de vuelos realizados que hayan partido del aeropuerto “BUE” y hayan arribado al
#aeropuerto “BRC”
select count(aeropuetoOrigen),aeropuetoOrigen,aeropuertoDestino
from vuelo
where aeropuetoOrigen='BUE' and aeropuertoDestino='BRC'

