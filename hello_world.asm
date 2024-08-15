default rel
bits 64

global main
extern printf, scanf

section .data
    STD_IO_INT      db `%d`, 0
    STD_IO_INTSEQ   db `%d`, 10, 0
    STD_IO_FLOAT    db `%f`, 0
    STD_IO_FLOATSEQ db `%f`, 10, 0
    STD_IO_STR      db `%s`, 0
    STD_IO_STRSEQ   db `%s`, 10, 0
    STD_IO_SEQ      db  10, 0

    _msg            db `Hello, world!`, 10, 0

section .bss

section .text
    jmp main
main:
    ; Overture
    push rbp
    mov rbp, rsp
    sub rsp, 40

    sub rsp, 8
    mov rcx, _msg
    call printf
    add rsp, 8

    jmp endmain
endmain:
    ; Finale
    add rsp, 40
    pop rbp
    ret
