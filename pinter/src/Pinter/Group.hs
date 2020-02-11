module Pinter.Group where

import BasicPrelude

import Data.Monoid (Product (Product, getProduct), Sum (Sum, getSum))

-- |A type with an operation (<>) which is associative, has a neutral element, and for which each
-- element has an inverse.
-- 
-- Laws:
-- * Associativity
--   * `<>` is associative
-- * Identity
--   * There is an element `e` such that `a <> e = a` and `e <> a = a` for every element `a` in `G`
-- * Inverse
--   * For every element `a` in `G`, there is and element `a^-1` such that `a <> a^-1 = e` and
--   `a <> a^-1 = e`
class (Monoid m) => Group m where
  inv :: m -> m

-- |FIXME uhhhhhh???? Is subgroup possible? Add Laws? UndecidableSuperclasses?
class Group g => Subgroup g where
  project :: (Subgroup g) => g -> g

instance Num a => Group (Sum a) where
  inv = Sum . negate . getSum

instance Num a => Group (Product a) where
  inv = Product . negate . getProduct

-- A communative group. Named after the mathematician Niels Abel, who was a pioneer in the study of
-- groups. Matrix multiplication is an example of an abelian group.
-- 
-- -- Laws:
-- * Associativity
--   * `<>` is associative
-- * Identity
--   * There is an element `e` such that `a * e = a` and `e * a = a` for every element `a` in `G`
-- * Inverse
--   * For every element `a` in `G`, there is and element `a^-1` such that `a <> a^-1 = e` and
--   `a <> a^-1 = e`
-- * Communativity
--   * `a <> b == b <> a`
class Group g => AbelianGroup g
