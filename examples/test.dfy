datatype
natr
=
Zero
|
Succ(natr)
predicate
Odd(z:
natr)
{
match
x
case
Zero
=>
false
case
Succ(Zero)
=>
true
case
Succ(z)
=>
Odd(z)
}
predicate
Even(z:
natr)
{
match
x
case
Zero
=>
true
case
Succ(Zero)
=>
false
case
Succ(z)
=>
Even(z)
}