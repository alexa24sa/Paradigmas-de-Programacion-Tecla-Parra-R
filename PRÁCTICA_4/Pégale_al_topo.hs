import System.Random (newStdGen, randomRs)
import Control.Monad (replicateM)
import Data.List (transpose)
import Control.Monad.IO.Class (liftIO)
import System.IO (hFlush, stdout)

-- Definición de tipo para el tablero de juego.
type Board = [[Char]]

-- Función para crear un tablero de juego vacío.
createBoard :: Int -> Int -> Board
createBoard rows cols = replicate rows (replicate cols ' ')

-- Función para colocar topos de manera aleatoria en el tablero.
placeMoles :: Board -> Int -> IO Board
placeMoles board numMoles = do
    gen <- newStdGen  -- Genera una nueva semilla para números aleatorios.
    let (rows, cols) = (length board, length (head board))  -- Obtiene dimensiones del tablero.
        positions = take numMoles $ randomRs (0, rows * cols - 1) gen  -- Selecciona posiciones aleatorias.
        newBoard = foldl (\b pos -> placeMole b pos cols) board positions  -- Coloca topos en las posiciones.
    return newBoard

-- Función para colocar un topo en una posición específica del tablero.
placeMole :: Board -> Int -> Int -> Board
placeMole board pos cols =
    let (row, col) = pos `divMod` cols  -- Calcula la fila y columna a partir de la posición lineal.
    in take row board ++ [take col (board !! row) ++ ['*'] ++ drop (col + 1) (board !! row)] ++ drop (row + 1) board

-- Función para mostrar el tablero en la consola.
printBoard :: Board -> IO ()
printBoard = putStrLn . unlines . map (concatMap (\x -> if x == ' ' then "." else [x]))  -- Reemplaza espacios con puntos.

-- Bucle principal del juego para procesar entradas del usuario y actualizar el tablero.
gameLoop :: Board -> IO ()
gameLoop board = do
    putStr "\n"
    putStr "PÉGALE AL TOPO\n"  -- Título del juego en la consola.
    printBoard board
    if '*' `elem` concat board  -- Checa si aún hay topos sin descubrir en el tablero.
    then do
        putStr "NOTA: Recuerde que inicia en 0-9 (fila columna) "  -- Instrucción para el usuario.
        putStr "\nIngrese coordenadas (fila columna): "
        hFlush stdout  -- Asegura que el mensaje se imprima antes de la entrada del usuario.
        input <- getLine
        let [r, c] = map read $ words input  -- Lee las coordenadas ingresadas por el usuario.
        let updatedBoard = updateBoard board r c  -- Actualiza el tablero basado en la entrada del usuario.
        gameLoop updatedBoard
    else putStrLn "¡Felicidades! Has encontrado todos los topos."  -- Mensaje de finalización del juego.

-- Función para actualizar el tablero cuando un usuario ingresa coordenadas.
updateBoard :: Board -> Int -> Int -> Board
updateBoard board row col =
    if board !! row !! col == '*'  -- Verifica si la posición tiene un topo.
    then take row board ++ [take col (board !! row) ++ ['X'] ++ drop (col + 1) (board !! row)] ++ drop (row + 1) board  -- Marca el topo encontrado con 'X'.
    else board  -- Devuelve el tablero sin cambios si no se encontró un topo.

-- Punto de entrada principal del programa.
main :: IO ()
main = do
    let rows = 10  -- Número de filas del tablero.
    let cols = 10  -- Número de columnas del tablero.
    let numMoles = 10  -- Número de topos a colocar.
    initialBoard <- placeMoles (createBoard rows cols) numMoles  -- Crea el tablero inicial y coloca los topos.
    gameLoop initialBoard  -- Inicia el bucle del juego.
