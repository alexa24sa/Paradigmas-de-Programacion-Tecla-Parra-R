--PROGRAMA 5:
-- La función sustituir toma un valor antiguo, un valor nuevo y una lista.
-- Reemplaza todas las ocurrencias del valor antiguo por el nuevo en la lista dada.
-- Reemplaza todas las ocurrencias de un carácter en una cadena.
sustituirEnCadena :: Eq a => a -> a -> [a] -> [a]
sustituirEnCadena _ _ [] = []
sustituirEnCadena antiguo nuevo (x:xs)
  | x == antiguo = nuevo : sustituirEnCadena antiguo nuevo xs
  | otherwise    = x : sustituirEnCadena antiguo nuevo xs

-- Modifica la función sustituir para que funcione con listas de cadenas.
sustituir :: Eq a => a -> a -> [[a]] -> [[a]]
sustituir antiguo nuevo = map (sustituirEnCadena antiguo nuevo)

-- Función main para probar la función sustituir con una salida descriptiva.
main :: IO ()
main = do
    let listaOriginal = ["rabiosos", "osos", "polacos"]
    let valorAntiguo = 'o'  -- Cambia esto a un carácter, ya que se sustituyen caracteres.
    let valorNuevo = 'u'    -- Cambia esto a un carácter también.
    let listaModificada = sustituir valorAntiguo valorNuevo listaOriginal
    
    putStrLn $ "Tu lista " ++ show listaOriginal ++
               " ha sustituido el valor " ++ show valorAntiguo ++
               " por el valor " ++ show valorNuevo ++
               " quedando de la siguiente manera " ++ show listaModificada


