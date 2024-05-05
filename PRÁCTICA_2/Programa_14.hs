--PROGRAMA 14:
-- La función toma una cadena y devuelve un Either String String
analizaDia :: String -> Either String String
analizaDia dia
    | dia == "lasaña" = Right "Garfield ama la lasania"
    | dia == "lunes" = Left "Garfield odia el Lunes"
    | otherwise = Left "Garfield no se inmuta"

-- Función main para probar analizaDia con diferentes cadenas.
main :: IO ()
main = do
    -- Prueba con "lasaña"
    print $ analizaDia "lasaña"
    -- Prueba con "lunes"
    print $ analizaDia "lunes"
    -- Prueba con otra cadena
    print $ analizaDia "martes"

