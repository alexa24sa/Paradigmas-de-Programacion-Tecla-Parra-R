--PROGRAMA 7):
--Para el ejercicio 7 se solicitaba lo siguiente: Codifique una función recursiva que calcule la siguiente suma:
--1^2+2^2+3^2+4^2+⋯+〖(n-1)〗^2+n^2

sumaRec:: Int -> Int
sumaRec 0 = 0
sumaRec x = x*x + sumaRec(x - 1)

main :: IO()
main = do
    let x = 5
    let resultado = sumaRec x
    putStrLn $ "El valor de su suma recursiva es " ++ show resultado
