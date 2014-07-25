-- interaction?
import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)
    putStrLn "Cool"

main = do
    args <- getArgs
    case args of
        [input, output] -> interactWith (reverse) input output
        _ -> putStrLn "error: exactly two args needed"
