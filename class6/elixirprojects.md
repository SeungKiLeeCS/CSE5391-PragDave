# Elixir Projects

Set of Conventions

## Why Use Projects?

## How to Create Projects?

mix new {project name}
cd {project name}
code README.md
git init
git add .
git commit -m "{Your Comment}"
mix test
git checkout -b {feature branch}

## Using Mix Commands

mix run : it will load the program to the memory but you need to enter
iex -S mix : run the command in mix in iex console

## How elixir execute

Node : elixir VM (BEAM) -> 

## TESTS

Test is another way of thinking of your code -> 테스트는 네 API의 첫 사용자야.
버그를 찾기 위해서 테스트를 하는게 아니야. 테스트는 좋은 코드를 쓰려고 하는거지. 버그를 찾는 것은 그냥 보너스야.

/lib 과 /test 는 같은 structure여야 함. -> end in _test.exs

lib/*.ex <-> test/*_test.exs

## Working In Projects

1. Keep Modules Small and Focuses -> Have small modules (100~200 at most)
2. Refactor often 
3. Make changes in feature branch
4. Commit often
5. Write Tests as you go

