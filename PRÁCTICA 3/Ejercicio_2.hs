--PROGRAMA 2:
--Use data y notación de registros para codificar un programa que tenga 
--funciones para: restar, dividir, multiplicar e imprimir racionales 
--y que tenga una función para comparar igualdad de racionales.

--INICIO DEL PROGRAMA:
-- Importa la función gcd para calcular el máximo común divisor, útil para simplificar fracciones.
--import Data.Ratio (gcd)

-- Define un nuevo tipo de datos llamado Racional que tiene dos campos: numerador y denominador.
data Racional = Racional {
  numerador :: Int,
  denominador :: Int
} deriving (Show) -- Deriva la clase Show para permitir la impresión de Racionales.

-- Define cómo comparar dos racionales para igualdad, asegurando que estén en su forma simplificada antes de comparar.
instance Eq Racional where
  r1 == r2 =
    let simplificado1 = simplificarRacional r1
        simplificado2 = simplificarRacional r2
    in (numerador simplificado1 == numerador simplificado2) &&
       (denominador simplificado1 == denominador simplificado2)

-- Crea un racional asegurando que el denominador no sea cero, lo cual sería inválido.
crearRacional :: Int -> Int -> Racional
crearRacional num den
  | den == 0  = error "El denominador no puede ser cero."
  | otherwise = Racional num den

-- Simplifica un racional reduciendo el numerador y el denominador por su máximo común divisor.
simplificarRacional :: Racional -> Racional
simplificarRacional r =
  let divisor = gcd (numerador r) (denominador r)
  in crearRacional (numerador r `div` divisor) (denominador r `div` divisor)

-- Suma dos racionales.
sumarRacionales :: Racional -> Racional -> Racional
sumarRacionales r1 r2 =
  crearRacional (numerador r1 * denominador r2 + numerador r2 * denominador r1)
                (denominador r1 * denominador r2)

-- Resta dos racionales.
restarRacionales :: Racional -> Racional -> Racional
restarRacionales r1 r2 =
  crearRacional (numerador r1 * denominador r2 - numerador r2 * denominador r1)
                (denominador r1 * denominador r2)

-- Multiplica dos racionales.
multiplicarRacionales :: Racional -> Racional -> Racional
multiplicarRacionales r1 r2 =
  crearRacional (numerador r1 * numerador r2)
                (denominador r1 * denominador r2)

-- Divide un racional por otro, verificando primero que el denominador no sea cero.
dividirRacionales :: Racional -> Racional -> Racional
dividirRacionales r1 r2
  | numerador r2 == 0  = error "División por cero."
  | otherwise = crearRacional (numerador r1 * denominador r2)
                              (denominador r1 * numerador r2)

-- Función principal que crea racionales y muestra el resultado de varias operaciones entre ellos.
main :: IO ()
main = do
  let r1 = crearRacional 1 2
  let r2 = crearRacional 3 4
  --putStrLn $ "La suma entre el racional " ++ show r1 ++ " y el racional " ++ show r2 ++ " es: " ++ show (sumarRacionales r1 r2) ++ "\n"
  putStrLn $ "La resta entre el racional " ++ show r1 ++ " y el racional " ++ show r2 ++ " es: " ++ show (restarRacionales r1 r2) ++ "\n"
  putStrLn $ "La multiplicación entre el racional " ++ show r1 ++ " y el racional " ++ show r2 ++ " es: " ++ show (multiplicarRacionales r1 r2) ++ "\n"
  putStrLn $ "La división entre el racional " ++ show r1 ++ " y el racional " ++ show r2 ++ " es: " ++ show (dividirRacionales r1 r2) ++ "\n"
  putStrLn $ "Comparación de igualdad entre el racional " ++ show r1 ++ " y el racional " ++ show r2 ++ " da como resultado: " ++ show (r1 == r2) ++ "\n"
