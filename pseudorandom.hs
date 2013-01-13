{-

A Pseudo-Random Number Generator (PRNG) based on:
http://preshing.com/20121224/how-to-generate-a-sequence-of-unique-random-integers

-}

module PRNG (prandomgen) where

import Data.Bits
import System.Random

data PRandomGen = PRandomGen {
	index :: Int,
	offset :: Int
} deriving (Show)

instance RandomGen PRandomGen where
	next (PRandomGen idx off) = (rand,gen)
		where
			rand = permuteQPR $ ((permuteQPR idx) + off) `xor` 0x5bf03635
			gen = PRandomGen (idx + 1) off
	split gen1@(PRandomGen idx off) = (gen1, gen2)
		where
			gen2 = prandomgen idx off

{-

A constructor for PRandomGen

-}
prandomgen :: Int -> Int -> PRandomGen
prandomgen base off = PRandomGen idx inter
	where
		idx = permuteQPR $ (permuteQPR base) + 0x682f0161
		inter = permuteQPR $ (permuteQPR off) + 0x46790905

permuteQPR :: Int -> Int
permuteQPR x
	| (toInteger x) >= prime = x
	| (toInteger x) <= (prime `div` 2) = fromIntegral residue
	| otherwise = fromIntegral $ prime - residue
	where
		residue = (toInteger (x * x)) `mod` prime
		prime = 4294967291 :: Integer