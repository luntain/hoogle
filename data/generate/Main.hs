
module Main(main) where

import Download
import Haddock
import Hoogle
import Util


defaults = ["keyword","base","array","Cabal","HUnit","QuickCheck","bytestring"
           ,"containers","directory","filepath","haskell-src","mtl"
           ,"network","parallel","parsec","pretty","process","random","stm"
           ,"template-haskell","time","xhtml"]
           \\
           ["network"]



main :: IO ()
main = do
    createDirectoryIfMissing True "temp"
    createDirectoryIfMissing True "result"
    xs <- getArgs
    mapM_ process $ if null xs then defaults else xs


process :: String -> IO ()
process x = do
    putStrLn $ "Processing " ++ x
    download x
    haddock x
    hoogle x
