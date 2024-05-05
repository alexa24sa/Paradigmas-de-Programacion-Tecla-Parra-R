--PROGRAMA 12:
type Punto = (Double, Double)

-- Determina si un punto está dentro de un círculo de radio 100 centrado en el origen.
estaDentroDelCirculo :: Punto -> Bool
estaDentroDelCirculo (x, y) = x^2 + y^2 <= 100^2

-- Usa foldr para construir una lista de booleanos que indica si cada punto está dentro del círculo.
puntosDentroDelCirculo :: [Punto] -> [Bool]
puntosDentroDelCirculo puntos = foldr (\punto acumulador -> estaDentroDelCirculo punto : acumulador) [] puntos

-- Función main para probar puntosDentroDelCirculo con una lista de puntos y salida descriptiva.
main :: IO ()
main = do
    let puntos = [(20, 20), (40, 40), (60, 60), (80, 80), (100, 100), (120, 120), (140, 140), (160, 160), (180, 180), (200, 200)]
    let resultados = puntosDentroDelCirculo puntos
    putStrLn ("Para la lista anterior con los siguientes valores " ++ show puntos ++
              " se tiene que es: " ++ show resultados)
