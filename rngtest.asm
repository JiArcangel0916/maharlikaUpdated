.model small
.stack 100h
.data
    outputMsg db "Random Number between (1-5): $"
    randomNum db 0
    lastRoll db 0    ; We only need to track the last roll
    counter db 5     ; Counter for number of iterations
.code
main proc far
    mov ax, @data
    mov ds, ax

    mov cl, 5                      ; Initialize counter to 5

print_loop:
    call rng                       ; Generate random number

    mov ah, 09h                    ; Print message
    mov dx, offset outputMsg
    int 21h

    mov ah, 02h                    ; Print number
    mov dl, randomNum
    add dl, '0'
    int 21h

    mov ah, 02h                    ; Print newline
    mov dl, 0Ah
    int 21h
    mov dl, 0Dh                    ; Print carriage return
    int 21h

    dec cl                         ; Decrease counter
    jnz print_loop                 ; Continue if counter is not zero

    mov ah, 4ch                    ; Exit program
    int 21h

main endp

rng proc near
    reroll:                         
        mov ah, 00h                 ; DOS function to get system time
        int 1ah

        mov ax, dx                  ; moves the current time to ax
        mov dx, 00h                 ; sets dx to 0
        mov bx, 05h                 ; sets bx to 5
        div bx                      ; divides ax (system time) to bx (5), storing the remainder to dl (0-4)
        inc dl                      ; increments dl to make the range 1-5

        cmp dl, lastRoll           ; only check against the last roll
        je reroll                  ; if it's the same as last roll, try again
    
        mov randomNum, dl          ; stores the generated random number to randomNum
        mov lastRoll, dl          ; update the last roll
        ret
rng endp

end main