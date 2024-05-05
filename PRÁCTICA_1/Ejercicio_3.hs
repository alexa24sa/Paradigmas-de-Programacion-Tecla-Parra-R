-- PROGRAMA 2)
--Para el ejercicio 2 se solicitaba lo siguiente: codificar una función que si se le da un # del 1 al 7 regrese una cadena con el día de la semana en inglés:
--1.	Monday
--2.	Tuesday
--3.	Wednesday
--4.	Thursday
--5.	Friday 
--6.	Saturday
--7.	Sunday
dias_semana:: Int -> String
dias_semana x
    |x == 1 = "Monday"
    |x == 2 = "Tuesday"
    |x == 3 = "Wednesday"
    |x == 4 = "Thursday"
    |x == 5 = "Friday"
    |x == 6 = "Saturday"
    |x == 7 = "Sunday"
    |otherwise = "There's no day assigned for your number."
    
main :: IO()
main = do
    let x = 2
    let resultado = dias_semana x
    putStrLn $ "El día de la semana para el número " ++ show x ++ " es " ++ show resultado
