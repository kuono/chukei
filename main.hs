module Main where

qualified import Language.DSL.Shinbun as Shinbun

data Shinbun = 中部経済新聞 | 日本経済新聞
data hizuke  = Today | Date Int Int Int
type Shimen  = [ShimenImage]
type ShimenImage = FilePath

main :: IO ()
main - downloadShimen shinbun hizuduke Shinbun.ALL 

  where 
    shinbun = 中部経済新聞
    hizuke  = Today
