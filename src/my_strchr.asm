BITS 64

GLOBAL my_strchr

SECTION .text

my_strchr:
    xor rax, rax
    xor rcx, rcx
    mov rax, rdi

find_char:
    cmp byte [rdi + rcx], 0
    je not_found
    cmp byte [rdi + rcx], sil
    je found
    inc rcx
    jmp find_char

found:
    add rax, rcx
    ret

not_found:
    xor rax, rax
    ret