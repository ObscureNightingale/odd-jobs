{-# LANGUAGE OverloadedStrings #-}

module Parser.IO
  ( extract,
    readInput,
    acquired,
  )
where

import Control.Concurrent (threadDelay)
import Control.Concurrent.Async (Concurrently, async, concurrently, runConcurrently, wait, waitSTM, withAsync)
import Data.Function ((&))
import Data.List
import Data.Maybe
import Data.Text (pack)
import Parser.Util (all', amountNum, filter', isNotNum, removeDup, splitConditionals)
import Rainbow
import System.IO.Strict (getContents)
import Text.Read
import Prelude

acquired :: [(String, [String])] -> [String]
acquired (("1", fs) : (_, _) : ("3", xs) : zs) =
  let cond = splitConditionals xs
   in acquired' cond fs

acquired' :: [([String], [String])] -> [String] -> [String]
acquired' [] ys = ys
acquired' xs [] = []
acquired' ((x, y) : xs) ys =
  if all' x ys
    then removeDup (filter' y ys ++ reverse (acquired' xs (y ++ ys)))
    else []

readInput :: IO [String]
readInput = do
  putStrLn "Place your input: "
  c <- System.IO.Strict.getContents
  putChunkLn $ "\n\n[ Processing ]" & fore blue
  putChunkLn $ "\n------------------\n" & bold
  extract c

extract :: String -> IO [String]
extract content = do
  let selected = lines content
  let paired = pair 1 selected
  let acv = acquired paired
  putChunkLn $ "[ Finished! ]\n\n" & fore green
  putChunkLn $ chunk (pack $ unlines acv) & bold
  return acv
  where
    pair i (s : sel) = case readMaybe s :: Maybe Int of
      Just n ->
        if amountNum (s : sel) == 0
          then [(show i, sel)]
          else (show i, take n (filter isNotNum sel)) : pair (i + 1) (take (amountNum (s : sel)) sel ++ drop n (filter isNotNum sel))