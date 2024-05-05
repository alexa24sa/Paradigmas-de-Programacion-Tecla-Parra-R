-- PROGRAMA 1)
--Codificar una función que calcule el punto ½  entre 2 puntos:
--P1 = (X1, Y1)  P2= (X2, Y2)  pto ½ = ((x1+x2)/2 ,(y1+y2)/2 ) 
punto_medio::(Fractional(a)) => (a,a) -> (a,a) -> (a, a)
punto_medio (x1,y1) (x2,y2) = ((x1+x2) / 2 , (y1+y2) / 2)


main:: IO()
main = do
    let tupla1 = (1,2)
    let tupla2 = (2,4)
    let resultado = punto_medio tupla1 tupla2
    putStrLn $ "El punto medio de " ++ show tupla1 ++ " y " ++ show tupla2 ++ " es " ++ show resultado
