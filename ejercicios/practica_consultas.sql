show databases;
use jardineria;
show tables;

-- 1

select ciudad, telefono
from oficina
where pais = 'EEUU';

-- 2

select puesto, nombre, apellido1, apellido2, email
from empleado
where puesto = 'director general';

-- 3

select nombre, apellido1, apellido2, puesto
from empleado
where puesto != 'representante ventas';

-- 4

select count(*)
from cliente;

-- 5

select nombre_cliente
from cliente
where pais ='españa';

-- 6

select pais, count(*)
from cliente
group by pais;

-- 7

select count(*)
from cliente
where ciudad = 'madrid';

-- 8

select codigo_empleado, count(*)
from cliente
inner join empleado
on empleado.codigo_empleado = cliente.codigo_empleado_rep_ventas
group by codigo_empleado;

-- 9

select min(fecha_pago), max(fecha_pago)
from pago
where codigo_cliente = 3;

-- 10

select codigo_cliente
from pago
where YEAR(fecha_pago) = 2008;

-- 11

select distinct estado
from pedido;

-- 12

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega > fecha_esperada;

-- 13

select codigo_pedido, count(*)
from detalle_pedido
group by codigo_pedido;

-- 14

select codigo_producto, sum(cantidad) AS total_pedido
from detalle_pedido
group by codigo_producto
order by total_pedido DESC
limit 20;

-- 15

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega
from pedido
where fecha_entrega <= adddate(fecha_esperada, interval -2 day);

-- 16

select nombre, apellido1, apellido2, puesto, codigo_oficina
from empleado
where puesto != 'representante ventas';

-- 17

SELECT codigo_empleado_rep_ventas, COUNT(codigo_cliente) AS cantidad_clientes
FROM cliente
GROUP BY codigo_empleado_rep_ventas;

-- 18

select codigo_pedido, sum(cantidad*precio_unidad) as total_pedido
from detalle_pedido
group by codigo_pedido;

-- 19

SELECT codigo_cliente, estado, COUNT(*) AS numero_pedidos
FROM pedido
GROUP BY codigo_cliente, estado;

-- 20

select codigo_oficina, ciudad, region, pais
from oficina
where pais like 'E%';

-- 21

select nombre, gama, dimensiones , cantidad_en_stock, precio_venta
from producto
order by precio_venta DESC
limit 5;

-- 22

select codigo_pedido, sum(precio_unidad* cantidad) as total_pedido
from detalle_pedido
group by codigo_pedido
having sum(precio_unidad*cantidad) > 2000;

-- 23

select nombre, cantidad_en_stock, proveedor, gama
from producto;

-- 24

select codigo_cliente,  count(*) as numero_pedidos_mismoDia
from pedido
where fecha_pedido = fecha_entrega
group by codigo_cliente;



