BITS 64

GLOBAL my_strlen

SECTION .text

my_strlen:
    xor rax, rax

next_char:
    cmp byte [rdi + rax], 0
    je end
    inc rax
    jmp next_char

end:
    ret