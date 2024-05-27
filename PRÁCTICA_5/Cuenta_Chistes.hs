import System.Random (randomRIO)

-- Lista de chistes disponibles
chistes :: [String]
chistes = [ "Había un perro de goma que cuando se rascaba se borraba."
          , "¿Qué le dice un gusano a otro? Me voy a dar la vuelta a la manzana."
          , "¿Cuál es el último animal que subió al arca de Noé? El del-fin."
          , "¿Qué hace una abeja en el gimnasio? Zum-ba."
          , "¿Por qué los pájaros no usan Facebook? Porque ya tienen Twitter."
          , "¿Qué le dice una iguana a su hermana gemela? Igual-ana."
          , "¿Qué cuenta el río cuando está feliz? Corrientes de chistes."
          , "¿Cómo se dice pañuelo en japonés? Saka-moko."
          , "¿Cuál es el pez más divertido? El pez-payaso."
          , "¿Qué le dice una pared a otra pared? Nos vemos en la esquina."
          , "¿Cómo se despide un químico? Ácido un placer."
          , "¿Qué hace una caja en un gimnasio? Pesa."
          , "¿Cuál es el colmo de Aladino? Tener mal genio."
          , "¿Qué le dice un jaguar a otro jaguar? Jaguar-you."
          , "¿Cómo organizan los gatos su fiesta? Hacen miau-sica."
          , "¿Cuál es el café más peligroso del mundo? El ex-preso."
          , "¿Qué hace un oso polar en una tormenta de nieve? Se congela."
          , "¿Por qué los dinosaurios no pueden aplaudir? Porque están extintos."
          , "¿Qué dice un plátano suicida? ¡Banana split!"
          , "¿Cuál es el animal más antiguo? La cebra, porque está en blanco y negro."
          ]

-- Función para elegir un chiste al azar y mostrarlo
cuentaChistes :: IO ()
cuentaChistes = do
  index <- randomRIO (0, length chistes - 1)  -- Genera un índice aleatorio
  putStrLn $ chistes !! index  -- Muestra el chiste seleccionado

-- Punto de entrada principal del programa
main :: IO ()
main = cuentaChistes
