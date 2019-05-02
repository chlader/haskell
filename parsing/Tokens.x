{
module Tokens where
}

%wrapper "basic"

$alpha = [a-zA-Z]
$digit = 0-9

tokens :-

  $white+                       ;
  "--".*                        ;
  "f"                             { \s -> Tokenf f}
  "x"                             { \s -> Tokenx x}
  "("                             { \s -> TokenLParen }
  ")"                             { \s -> TokenRParen }
  $alpha+ [$alpha $digit \_ \']*  { \s -> TokenSym s }
  $digit+                         { \s -> Token Num (read s :: Integer)}

{

-- The token type:
data Token = TokenSym String
           | TokenNum Integer
           | TokenLParen
           | TokenRParen
           | Tokenf String
           | Tokenx String
           deriving (Eq,Show)

scanTokens = alexScanTokens

}
