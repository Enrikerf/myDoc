# REGEX

| symbol | meaning                          |
|--------|----------------------------------|
| .      | any char                         |
| [ x ]  | contains x                       |
| [^x]   | not contains x                   |
| [x-y]  | in range ASCII between x and y   |
| \w     | letter,number,\_                 |
| \W     | everything but letter, number,\_ |
| \d     | numbers                          |
| \D     | everything's but numbers         |
| \s     | spaces                           |
| \S     | everything but spaces            |

## Repetitions

| symbol  | meaning               |
|---------|-----------------------|
| \+      | one or more           |
| \*      | zero or more          |
| ?       | optional              |
| {x}     | x times               |
| {x,y}   | between x and y times |
| {x,}    | x or more times       |

## Grouping

| symbol | meaning                                                                              |
|--------|--------------------------------------------------------------------------------------|
| (x)    | group of happens x                                                                   |
| (x)\y  | group of happens x saved in a var called x ∈ (1,∞)                                   |
| (?:)   | non capturing group                                                                  |
| &#x7c; | in group can be different expressions works at expression level not char level as [] |
| \      | scape char                                                                           |
| ^      | starts with                                                                          |
| $      | ends with                                                                            |

## lookaround

| symbol  | name            | meaning       |
|---------|-----------------|---------------|
| y(?=x)  | look ahead      | y after x     |
| y(?!x)  | not look ahead  | y not after x |
| (?<=x)y | look behind     | y after x     |
| (?<!x)y | not look behind | y not after x |


## Flags or modifiers

| symbol | name        | meaning                  |
|--------|-------------|--------------------------|
|        | none        | only first occurence     |
| g      | global      | search in whole text     |
| m      | multiline   | each line it's different |
| i      | insensitive |                          |
| y      | sticky      |                          |
| u      | unicode     |                          |
| s      | single      |                          |
| d      | indices     |                          |


## Greedy matching vs lazy matching

by default, REGEX uses greedy matching. that means that will search in the whole text. with lazy mode only search the first occurrence

* .*r everything that ends in r
* .*?r the first word that ends in r

## Common expressions

| expression                                                          | meaning                                                   |     |
|---------------------------------------------------------------------|-----------------------------------------------------------|-----|
| ^\[(\d\,)\*(\d+\]){1}$                                              | search every array of numbers in text [1,2,3] in one line |     |
| ^\d{4}\-(0[1-9]&#x7c;1[012])\-(0[1-9]&#x7c;[12][0-9]&#x7c;3[01])$   |                                                           |     |


