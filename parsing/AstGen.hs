module Expr where

data Type1 = LParens String && f String

data Type2 x = Branch var num | Type2 (Branch var num)
    deriving Show

data Type3 = Type2 && RParens String
    deriving Show