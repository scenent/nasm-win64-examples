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
    lea rcx, STD_IO_INTSEQ
    mov rdx, [rbp - 8]
    call printf
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
