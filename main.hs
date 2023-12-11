module Main where

{-# LANGUAGE OverloadedStrings #-}

import Network.HTTP.Client
import Network.HTTP.Client.TLS
import Network.HTTP.Types.Status (statusCode)
import Network.HTTP.Types.Header (hAuthorization)
import qualified Data.ByteString.Char8 as B8

login :: String -> String -> String -> IO String
login url myid pwd = do
  manager <- newTlsManager
  let auth = B8.pack myid:pwd
      req = parseRequest url
      req' = req { requestHeaders = [(hAuthorization, auth)] }
  response <- httpLbs req' manager
  putStrLn $ "The status code was: " ++ show (statusCode $ responseStatus response)
  print $ responseBody response

-- qualified import Language.DSL.Shinbun as Shinbun

-- data Shinbun = 中部経済新聞 | 日本経済新聞
data hizuke  = Today | Date Int Int Int
type Shimen  = [ShimenImage]
type ShimenImage = FilePath

main :: IO ()
main = login "https://example.com/folder?date=YYYY-MM-DD" "brabrabra" "hogehogehoge"
      
-- main - downloadShimen shinbun hizuduke Shinbun.ALL 

--  where 
--    shinbun = 中部経済新聞
--    hizuke  = Today
