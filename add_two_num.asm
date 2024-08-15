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

    _greeting       db `Input two numbers`, 10, 0
    _outfmt         db `%d + %d = %d`, 10, 0

section .bss

    _buffer0         resd 1
    _buffer1         resd 1
    
section .text
    jmp main
main:
    ; Overture
    push rbp
    mov rbp, rsp
    sub rsp, 40

    sub rsp, 8
    mov rcx, _greeting
    call printf
    add rsp, 8

    lea rcx, STD_IO_INT
    mov rdx, _buffer0
    call scanf

    lea rcx, STD_IO_INT
    mov rdx, _buffer1
    call scanf

    sub rsp, 8
    mov rax, [_buffer0]
    mov [rbp - 8], rax
    sub rsp, 16
    mov rax, [_buffer1]
    mov [rbp - 16], rax
    sub rsp, 32
    mov rax, [rbp - 8]
    add rax, [rbp - 16]
    mov [rbp - 32], rax

    lea rcx, _outfmt
    mov rdx, [rbp - 8]
    mov r8, [rbp - 16]
    mov r9, [rbp - 32]
    call printf

    add rsp, 32
    add rsp, 16
    add rsp, 8

    jmp endmain
endmain:
    ; Finale
    add rsp, 40
    pop rbp
    ret
