section .data
    prompt_name db "Enter your name: ", 0
    prompt_age  db "Enter your age: ", 0
    confirm_msg db "Confirm? (y/n): ", 0
    yes_msg     db "Confirmed!", 10, 0
    no_msg      db "Not confirmed!", 10, 0

    name_buf    times 50 db 0
    age_buf     times 10 db 0
    confirm_buf times 2 db 0

section .text
    global _start

_start:
    ; --- Print "Enter your name: " ---
    mov rax, 1                  ; sys_write
    mov rdi, 1                  ; stdout
    mov rsi, prompt_name
    mov rdx, 17
    syscall

    ; --- Read name ---
    mov rax, 0                  ; sys_read
    mov rdi, 0                  ; stdin
    mov rsi, name_buf
    mov rdx, 50
    syscall

    ; --- Print "Enter your age: " ---
    mov rax, 1
    mov rdi, 1
    mov rsi, prompt_age
    mov rdx, 15
    syscall

    ; --- Read age ---
    mov rax, 0
    mov rdi, 0
    mov rsi, age_buf
    mov rdx, 10
    syscall

    ; --- Print "Confirm? (y/n): " ---
    mov rax, 1
    mov rdi, 1
    mov rsi, confirm_msg
    mov rdx, 16
    syscall

    ; --- Read confirmation ---
    mov rax, 0
    mov rdi, 0
    mov rsi, confirm_buf
    mov rdx, 2
    syscall

    ; --- Check if 'y' ---
    mov al, [confirm_buf]
    cmp al, 'y'
    je print_yes

print_no:
    mov rax, 1
    mov rdi, 1
    mov rsi, no_msg
    mov rdx, 15
    syscall
    jmp exit

print_yes:
    mov rax, 1
    mov rdi, 1
    mov rsi, yes_msg
    mov rdx, 11
    syscall

exit:
    mov rax, 60                 ; sys_exit
    xor rdi, rdi
    syscall
