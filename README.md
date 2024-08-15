# nasm-win64-examples
> Example NASM programs for 64 bit Windows.

# Program List
1. add two number
2. bubble sort
3. count number
4. half pyramid
5. hello world
6. pyramid

## Building Environment
| NASM | 2.16.01 |
| ---- | ---- |
| MinGW (x86_64) | 13.2.0 |

## Build
```
>> nasm -f win64 filename.asm -o filename.obj
>> gcc filename.obj -o filename.exe
>> ./filename
```
