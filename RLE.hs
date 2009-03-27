{-# LANGUAGE BangPatterns #-}
module Main where

--import qualified Data.ByteString.Lazy.Char8 as S
import qualified Data.ByteString.Char8 as S
import Text.Printf

-- echo an RLE triple of the form (value, start, length) to stdout
rle [] _ _ _ _ = return ()
rle (x:xs) !i !ll !thisStart !thisLen
    | i == zero = rle xs 1 x 0 1
    | x /= ll = do
        S.putStr ll
        printf ",%d,%d\n" thisStart thisLen
        rle xs (i+1) x i 1
    | otherwise = rle xs (i+1) x thisStart (thisLen+1)

zero :: Int
zero = 0

main = do
    contents <- S.getContents
    let lnz = S.lines contents
    rle lnz zero S.empty zero zero
