#Listado de los aviones de la compañía, (marca, modelo, matrícula, fecha de entrada en
#servicio, país de origen)
select nombre as marca,modelo,matricula,fechaEntradaServicio 
from avion as a
inner join marca as m
on a.codigoMarca=m.codigo