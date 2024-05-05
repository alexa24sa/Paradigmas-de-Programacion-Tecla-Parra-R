--PROGRAMA 1: codifica una función recursiva que da una lista de triplas,
-- sume los componentes para crear una lista con dichas sumas en haskell.

-- Define el tipo para claridad, aunque no es estrictamente necesario.
type Tripla = (Int, Int, Int)

-- La función sumaTriplas toma una lista de triplas y devuelve una lista de sumas.
sumaTriplas :: [Tripla] -> [Int]
sumaTriplas [] = []  -- Caso base: si la lista está vacía, devuelve una lista vacía.
sumaTriplas ((a, b, c):xs) = (a + b + c) : sumaTriplas xs  -- Caso recursivo.

-- Función main que ejecutará el programa.
main :: IO ()
main = do
    -- Lista de triplas de ejemplo
    let triplas = [(1, 1, 1), (2, 2, 2), (3, 3, 3), (4, 4, 4), (5, 5, 5), (6, 6, 6), (7, 7, 7), (8, 8, 8), (9, 9, 9), (10, 10, 10)]
    
    -- Imprime la lista de triplas
    putStrLn "Lista de triplas:"
    print triplas
    
    -- Calcula y muestra las sumas de las triplas
    let sumas = sumaTriplas triplas
    putStrLn "Sumas de los componentes de cada tripla:"
    print sumas
