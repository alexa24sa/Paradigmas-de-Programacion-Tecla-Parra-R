-- PROGRAMA 6:
--Use guardias para codificar una función que dadas las coordenadas de “m” 
--punto en el plano retome una cadena que diga en qué cuadrante esta el punto:
determinarCuadrante:: Int -> Int -> String
determinarCuadrante x y
    |x > 0 && y > 0 = "Primer cuadrante"
    |x > 0 && y > 0 = "Segundo cuadrante"
    |x < 0 && y < 0 = "Tercer Cuadrante"
    |x > 0 && y < 0 = "Cuarto Cuadrante"
    |otherwise = "No existe un caso para los valores"

main :: IO()
main = do
    let x = -1
    let y = 2
    let resultado= determinarCuadrante x y
    putStrLn $ "El cuadrante para tus coordenadas del punto (" ++ show x ++ ", " ++ show y ++ ") es: "  ++ show resultado
