--PROGRAMA 1 :
--Use data y notación de registros para codificar un programa que tenga una lista de películas (título, director, año) que tenga funciones de orden superior para:
--Imprimir los títulos de todas las películas 
--Imprimir todos los datos de todas las películas del mismo director
--Imprimir todos los datos de todas las películas del mismo año 
--Imprimir todos los directores de todas las películas

-- COMIENZO DE CÓDIGO:
-- Definición del tipo de dato Pelicula usando notación de registro.
-- Esto permite crear un tipo estructurado con campos titulado, director y año.
data Pelicula = Pelicula {
  titulo :: String,    -- Campo para el título de la película.
  director :: String,  -- Campo para el director de la película.
  anio :: Int          -- Campo para el año de la película.
} deriving (Show)      -- Deriva Show para permitir la impresión de Pelicula.

-- Lista de películas de ejemplo.
-- Contiene varias instancias del tipo de datos Pelicula.
listaPeliculas :: [Pelicula]
listaPeliculas = [
  Pelicula " Origen " " Christopher Nolan " 2010,
  Pelicula " Interstellar " " Christopher Nolan " 2014,
  Pelicula " La La Land " " Damien Chazelle " 2016,
  Pelicula " Whiplash " " Damien Chazelle " 2014]

-- Función para imprimir los títulos de todas las películas.
-- Utiliza map para aplicar la función titulo a cada Pelicula en la lista.
imprimirTitulos :: [Pelicula] -> [String]
imprimirTitulos peliculas = map titulo peliculas

-- Función para encontrar todas las películas de un director específico y
-- imprimir sus detalles completos.
-- Filtra las películas por director y luego utiliza show para convertir cada Pelicula a String.
peliculasPorDirector :: String -> [Pelicula] -> [String]
peliculasPorDirector dir peliculas = map show $ filter (\p -> director p == dir) peliculas

-- Función para encontrar todas las películas de un año específico y
-- imprimir sus detalles completos.
-- Filtra las películas por año y luego utiliza show para convertir cada Pelicula a String.
peliculasPorAnio :: Int -> [Pelicula] -> [String]
peliculasPorAnio anioBuscado peliculas = map show $ filter (\p -> anio p == anioBuscado) peliculas

-- Función para listar los directores de todas las películas en la lista.
-- Utiliza map para extraer el campo director de cada Pelicula.
listarDirectores :: [Pelicula] -> [String]
listarDirectores peliculas = map director peliculas

-- Función principal que ejecuta el programa y muestra resultados en la consola.
main :: IO ()
main = do
  putStrLn "Títulos de las películas:"  -- Imprime un título para la sección.
  print $ imprimirTitulos listaPeliculas  -- Imprime los títulos de las películas.

  putStrLn "\nPelículas de Christopher Nolan: "  -- Imprime otro título de sección.
  print $ peliculasPorDirector " Christopher Nolan " listaPeliculas  -- Muestra películas de C. Nolan.

  putStrLn "\nPelículas del año 2014:"  -- Título de la siguiente sección.
  print $ peliculasPorAnio 2014 listaPeliculas  -- Muestra películas del año 2014.

  putStrLn "\nDirectores en la lista:"  -- Título de la última sección.
  print $ listarDirectores listaPeliculas  -- Imprime la lista de directores.
