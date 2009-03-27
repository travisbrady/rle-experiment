{-# LANGUAGE BangPatterns #-}
module Main where

import Control.Monad
import Text.Printf
import qualified Data.ByteString.Lazy.Char8 as S

data RLETriple a = RLETriple !a {-# UNPACK #-} !Int {-# UNPACK #-} !Int
    deriving Show
data T a = T !a {-# UNPACK #-} !Int {-# UNPACK #-} !Int
    deriving Show

printTrip (RLETriple v s l) = S.putStr v >> printf ",%d,%d\n" s l

-- Output is a list of triples of the form (value, startpos, run length)
-- Thank you dons: http://hpaste.org/8011#a1
encode_acc :: Eq a => [a] -> Int -> [RLETriple a] -> [RLETriple a]
encode_acc [] !i accs = accs
encode_acc (x:xs) i [] = encode_acc xs (i+1) [RLETriple x i 1]
encode_acc (x:xs) i (this@(RLETriple val sp rl):accs)
    | x == val  = encode_acc xs (i+1) (RLETriple val sp (rl+1) : accs)
    | otherwise = encode_acc xs (i+1) ((RLETriple x i 1):this:accs)

-- Take the raw input list and do the stuff and then reverse it
encode :: Eq a => [a] -> [RLETriple a]
encode [] = []
encode lst = reverse $ encode_acc lst 0 []

main = do
    contents <- S.getContents
    let encd = encode $ S.lines contents
    mapM_ printTrip encd

