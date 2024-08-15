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

    _starStr        db `*`, 0

section .bss

section .text
    jmp main
main:
    ; Overture
    push rbp
    mov rbp, rsp
    sub rsp, 40
    jmp for0
for0:
    sub rsp, 8
    mov [rbp - 8], dword 1
    jmp forcond0
forcond0:
    mov rax, [rbp - 8]
    cmp rax, 10
    jg forend0
    jmp forsub0
forsub0:
    jmp for1
for1:
    sub rsp, 16
    mov [rbp - 16], dword 0
    jmp forcond1
forcond1:
    mov rax, [rbp - 16]
    cmp rax, [rbp - 8]
    jge forend1
    jmp forsub1
forsub1:
    lea rcx, STD_IO_STR
    mov rdx, _starStr
    call printf
    jmp forcount1
forcount1:
    inc dword [rbp - 16]
    jmp forcond1
forend1:
    lea rcx, STD_IO_STR
    mov rdx, STD_IO_SEQ
    call printf
    add rsp, 16
    jmp forcount0
forcount0:
    inc dword [rbp - 8]
    jmp forcond0
forend0:
    add rsp, 8
    jmp endmain
endmain:
    ; Finale
    add rsp, 40
    pop rbp
    ret
