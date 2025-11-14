CREATE TABLE Pedidos (
    PedidoID INT,
    ClienteID INT,
    Categoria VARCHAR(50),
    Monto DECIMAL(10, 2),
    Fecha DATE,
    Pais VARCHAR(50)
);

INSERT INTO Pedidos (PedidoID, ClienteID, Categoria, Monto, Fecha, Pais) VALUES
(1, 101, 'Electrónica', 1200.50, '2023-10-15', 'España'),
(2, 205, 'Libros', 75.20, '2023-10-18', 'México'),
(3, 101, 'Hogar', 450.50, '2023-10-21', 'España'),
(4, 310, 'Electrónica', 899.99, '2023-11-01', 'Argentina'),
(5, 101, 'Electrónica', 4100.00, '2023-11-05', 'España');

/***** Ejemplo 1: Resumen General de Ventas *****/

SELECT
    COUNT(*) AS TotalDePedidos, /* ¿Cuántos pedidos se han realizado? */
    SUM(Monto) AS IngresosTotales, /* ¿Cuáles son los ingresos totales obtenidos de los artículos vendidos? */
    AVG(Monto) AS PrecioPromedio /* ¿Cuál es el precio promedio de los artículos que se vendieron hoy? */
FROM Pedidos;

/***** Ejemplo 2: Análisis de Ventas por Categoría *****/

-- Dame los ingresos obtenidos por cada categoría y muéstralos de mayor a menor.
SELECT
    Categoria,
    SUM(Monto) IngresosPorCategoria
FROM Pedidos
GROUP BY Categoria
ORDER BY IngresosPorCategoria DESC;

/***** Ejemplo 3: Identificar Clientes de Alto Valor *****/

-- Muestra a los clientes que hayan gastado más de 5,000 pesos.
SELECT
    ClienteID,
    SUM(Monto) AS GastoTotal
FROM Pedidos
GROUP BY ClienteID
HAVING GastoTotal > 5000.00;