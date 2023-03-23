use tienda;

-- 1
select nombre from producto;
-- 2
select nombre, precio from producto;
-- 3
select * from producto;
-- 4
select nombre, concat(format(precio,2), ' €'), concat(format(precio*1.06,2),' US$') from producto;
-- 5
select nombre as 'nom de producte', concat(format(precio,2), ' €') as euros, concat(format(precio*1.06,2),' US$') as dolars from producto;
-- 6
select upper(nombre), precio from producto;
-- 7
select lower(nombre), precio from producto;
-- 8
select nombre, upper(left(nombre,2)) from fabricante;
-- 9
select nombre, ROUND(precio) from producto;
-- 10
select nombre, format(precio,0) from producto;
-- 11
SELECT codigo_fabricante FROM producto;
-- 12
SELECT DISTINCT codigo_fabricante FROM producto;
-- 13
select nombre from fabricante order by nombre asc;
-- 14
select nombre from fabricante order by nombre desc;
-- 15
SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;-- preguntar no entiendo ordenar por dos lados
-- 16
select * from producto limit 5;
-- 17
select * from fabricante limit 3,2;
-- 18
select nombre, precio from producto order by precio asc limit 1;
-- 19
select nombre, precio from producto order by precio desc limit 1;
-- 20
select nombre from producto where codigo_fabricante=2;
-- 21
select producto.nombre, producto.precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo;
-- 22
select producto.nombre, producto.precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo order by fabricante.nombre;
-- 23
select producto.codigo, producto.nombre, producto.codigo_fabricante, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo;
-- 24
select producto.nombre, producto.precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo order by precio asc limit 1;
-- 25
select producto.nombre, producto.precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo order by precio desc limit 1;
-- 26
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Lenovo';
-- 27
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Crucial' and  producto.precio>200;
-- 28
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre='Asus' or fabricante.nombre='Hewlett-Packard' or fabricante.nombre='Seagate';
-- 29
select * from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre in ('Asus', 'Hewlett-Packard', 'Seagate');
-- 30
select producto.nombre, producto.precio from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like '%e';
-- 31
select producto.nombre, producto.precio from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre like '%w%';
-- 32
select producto.nombre, producto.precio, fabricante.nombre from producto join fabricante on producto.codigo_fabricante=fabricante.codigo where producto.precio>=180 order by precio desc, producto.nombre asc;
-- 33
select distinct fabricante.codigo, fabricante.nombre from fabricante join producto on producto.codigo_fabricante = fabricante.codigo;
-- 34
select fabricante.nombre, producto.nombre from fabricante left join producto on producto.codigo_fabricante =fabricante.codigo;
-- 35
select fabricante.nombre from fabricante left join producto on producto.codigo_fabricante =fabricante.codigo where producto.codigo_fabricante is null;
-- 36
select producto.nombre from producto left join fabricante on producto.codigo_fabricante =fabricante.codigo where fabricante.nombre = 'Lenovo';
-- 37
select * from producto where producto.precio =( select producto.precio from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre='Lenovo' order by producto.precio desc limit 1);
-- 38
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre='Lenovo' order by producto.precio desc limit 1;
-- 39
select producto.nombre from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre='Hewlett-Packard' order by producto.precio asc limit 1;
-- 40
select * from producto where producto.precio >=( select producto.precio from producto left join fabricante on producto.codigo_fabricante = fabricante.codigo where fabricante.nombre='Lenovo' order by producto.precio desc limit 1);
-- 41
select * from producto left join fabricante on producto.codigo_fabricante=fabricante.codigo where fabricante.nombre = 'Asus' and producto.precio > (SELECT AVG(producto.precio) FROM producto LEFT JOIN fabricante  ON producto.codigo_fabricante = fabricante.codigo WHERE fabricante.nombre = 'Asus');
