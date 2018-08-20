#Cantidad de vuelos realizados, por aeropuerto de origen (Código IATA, cantidad)
select count(aeropuetoOrigen),aeropuetoOrigen
from vuelo
group by aeropuetoOrigen