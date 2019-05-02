{
module Grammar where
import Tokens
import Expr
}

%name MainExpr
%tokentype { Token }
%error { parseError }

%token
    'f'   { Tokenf }
    'x'   { Tokenx }
    var { TokenSym $$ }
    num { TokenNum $$ }
    '(' { TokenLParen }
    ')' { TokenRParen }

%%
Type1 :
  '(' 'f'

Type2 :
  '(' var 'x' num ')' { Type $2 $4 }

Type3 :
  Type2 ')'

{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
