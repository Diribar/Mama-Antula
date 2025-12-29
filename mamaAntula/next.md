Tablas
- Navegacs
	OK - Elimina las navegaciones de hace más de un mes (fecha)
	OK - Elimina las navegaciones duplicadas (fecha, cliente_id, url)
	OK - Elimina las navegaciones únicas por cliente (fecha, cliente)
- Visitas
	OK - Elimina las visitas creadas el día vencido, que no tengan navegación

Indicador Clientes por día
- Cantidad de visitas que ingresaron al sitio
- Rutina diaria
	- Guarda las cantidades del día vencido
	- Si se terminó un mes,
		- Obtiene el promedio y crea un nuevo mes
		- Elimina los días del mes vencido

Indicador Navegaciones por url
- Consolida la cantidad de navegaciones que recibió cada url
- Rutina diaria
	- Elimina todos los registros de la tabla
	- Obtiene la cantidad de visitas que recibió cada url en 'navegacs'
	- Guarda un registro por cada url visitado

Indicador Navegaciones por ruta
- Consolida la cantidad de navegaciones que recibió cada ruta
- Rutina diaria
	- Elimina todos los registros de la tabla
	- Obtiene la cantidad de visitas que recibió cada ruta en 'navegacs'
	- Guarda un registro por cada ruta visitada
