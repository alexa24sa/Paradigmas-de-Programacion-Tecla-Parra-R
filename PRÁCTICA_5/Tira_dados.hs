import System.Random (randomRIO)

-- Representación de los resultados de los dados como cadenas
dadoCara :: [String]
dadoCara = [ "[ . ] UNO"
           , "[ . . ] DOS"
           , "[ . . . ] TRES"
           , "[ . . . . ] CUATRO"
           , "[ . . . . . ] CINCO"
           , "[ . . . . . . ] SEIS"
           ]

-- Función para lanzar un dado
lanzarDado :: IO Int
lanzarDado = randomRIO (0, 5)

-- Función para jugar el juego de lanzar dos dados
juegoDados :: IO ()
juegoDados = do
  dado1 <- lanzarDado  -- Lanzamiento del primer dado
  dado2 <- lanzarDado  -- Lanzamiento del segundo dado
  let sumaDados = dado1 + dado2 + 2  -- Calculamos la suma ajustando el índice base 0
  putStrLn $ "Han salido los siguientes dados: " ++ dadoCara !! dado1 ++ " y " ++ dadoCara !! dado2
  if sumaDados == 7
    then putStrLn "El usuario GANA"
    else putStrLn "El usuario PIERDE"

-- Punto de entrada principal del programa
main :: IO ()
main = juegoDados
