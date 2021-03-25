module Parser.Util (splitConditionals, isNotNum, amountNum, splitBySub, strip', filter', removeDup, all') where

import Data.Char ( isAlpha, isDigit, isLetter )
import Data.List ( filter, map, elem, length, foldl, take, all )
import Data.Text ( Text, pack, splitOn, strip, unpack )
import Prelude

splitConditionals :: [String] -> [([String], [String])]
splitConditionals [] = []
splitConditionals (x : xs) = do
  let [ps, cs] = take 2 $ splitBySub x "->"
  (strip' $ splitBySub ps ", ", strip' $ splitBySub cs ", ") : splitConditionals xs

isNotNum :: String -> Bool
isNotNum (s : sel) = isAlpha s

amountNum :: [String] -> Int
amountNum (x : xs) = length (filter (all isDigit) xs)

splitBySub :: String -> String -> [String]
splitBySub xs sb = map unpack (splitOn (pack sb) (pack xs))

strip' :: [String] -> [String]
strip' = map (unpack . strip . pack)

all' :: [String] -> [String] -> Bool
all' (m : ms) = elem m

filter' :: [String] -> [String] -> [String]
filter' [] [] = []
filter' [] ys = ys
filter' xs [] = []
filter' (x : xs) ys
  | x `elem` ys = filter' xs ys
  | otherwise = filter' xs (x : ys)

removeDup :: [String] -> [String]
removeDup = foldl (\seen x -> if x `elem` seen then seen else x : seen) []