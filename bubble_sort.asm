default rel
bits 64

global main
extern printf, scanf

%define ARRAY_SIZE 20

section .data
    STD_IO_INT      db `%d`, 0
    STD_IO_INTSEQ   db `%d`, 10, 0
    STD_IO_FLOAT    db `%f`, 0
    STD_IO_FLOATSEQ db `%f`, 10, 0
    STD_IO_STR      db `%s`, 0
    STD_IO_STRSEQ   db `%s`, 10, 0
    STD_IO_SEQ      db  10, 0

    _beforeStr      db `Before the Bubble Sort : `, 10, 0
    _afterStr       db `After the Bubble Sort : `, 10, 0

section .bss

    _array          resd ARRAY_SIZE

section .text
    jmp main
main:
    ; Overture
    push rbp
    mov rbp, rsp
    sub rsp, 40

    lea rax, [_array]
    mov [rax + 0 * 4], dword 3
    mov [rax + 1 * 4], dword 6
    mov [rax + 2 * 4], dword 1
    mov [rax + 3 * 4], dword 4
    mov [rax + 4 * 4], dword 11
    mov [rax + 5 * 4], dword 2
    mov [rax + 6 * 4], dword 7
    mov [rax + 7 * 4], dword 8
    mov [rax + 8 * 4], dword 10
    mov [rax + 9 * 4], dword 9
    mov [rax + 10 * 4], dword 5
    mov [rax + 11 * 4], dword 20
    mov [rax + 12 * 4], dword 13
    mov [rax + 13 * 4], dword 14
    mov [rax + 14 * 4], dword 15
    mov [rax + 15 * 4], dword 17
    mov [rax + 16 * 4], dword 16
    mov [rax + 17 * 4], dword 18
    mov [rax + 18 * 4], dword 12
    mov [rax + 19 * 4], dword 19

    sub rsp, 8
    mov rcx, _beforeStr
    call printf
    add rsp, 8

    jmp for0
    for0:
        sub rsp, 8
        mov [rbp - 8], dword 0
        jmp forcond0
    forcond0:
        mov rax, [rbp - 8]
        cmp rax, ARRAY_SIZE
        jge forend0
        jmp forsub0
    forsub0:
        lea rax, [_array]
        mov rbx, [rbp - 8]
        lea rcx, STD_IO_INTSEQ
        mov rdx, [rax + rbx * 4]
        call printf
        jmp forcount0
    forcount0:
        inc dword [rbp - 8]
        jmp forcond0
    forend0:
        add rsp, 8
        jmp main0
main0:
    jmp for1
    for1:
        sub rsp, 8
        mov [rbp - 8], dword 0
        jmp forcond1
    forcond1:
        mov rax, [rbp - 8]
        mov rbx, ARRAY_SIZE
        sub rbx, 1

        cmp rax, rbx
        jge forend1
        jmp forsub1
    forsub1:
        jmp for2
        for2:
            sub rsp, 16
            mov [rbp - 16], dword 0
            jmp forcond2
        forcond2:
            mov rax, [rbp - 16]
            mov rbx, ARRAY_SIZE
            sub rbx, 1
            sub rbx, [rbp - 8]

            cmp rax, rbx
            jge forend2
            jmp forsub2
        forsub2:

            lea r8, [_array]
            mov rax, [rbp - 16]
            mov rbx, [rbp - 16]
            inc rbx

            mov ecx, [r8 + rax * 4]
            mov edx, [r8 + rbx * 4]

            cmp ecx, edx
            jle forsub2_0
            jmp if0
            if0:
                lea r8, [_array]
                mov rax, [rbp - 16]
                mov rbx, [rbp - 16]
                inc rbx

                mov ecx, [r8 + rax * 4]
                mov edx, [r8 + rbx * 4]

                mov [r8 + rax * 4], edx
                mov [r8 + rbx * 4], ecx

                jmp forsub2_0
        forsub2_0:
            jmp forcount2
        forcount2:
            inc dword [rbp - 16]
            jmp forcond2
        forend2:
            add rsp, 16
            jmp forsub1_0
    forsub1_0:
        jmp forcount1
    forcount1:
        inc dword [rbp - 8]
        jmp forcond1
    forend1:
        add rsp, 8
        jmp main1
main1:
    sub rsp, 8
    mov rcx, _afterStr
    call printf
    add rsp, 8

    jmp for3
    for3:
        sub rsp, 8
        mov [rbp - 8], dword 0
        jmp forcond3
    forcond3:
        mov rax, [rbp - 8]
        cmp rax, ARRAY_SIZE
        jge forend3
        jmp forsub3
    forsub3:
        lea rax, [_array]
        mov rbx, [rbp - 8]

        lea rcx, STD_IO_INTSEQ
        mov rdx, [rax + rbx * 4]
        call printf

        jmp forcount3
    forcount3:
        inc dword [rbp - 8]
        jmp forcond3
    forend3:
        add rsp, 8
        jmp endmain
endmain:
    ; Finale
    add rsp, 40
    pop rbp
    ret
