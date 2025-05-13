.model small
.stack 100h
.data
    outputMsg db "Random Number between (1-5): $"
    randomNum db 0
    lastRoll db 0    
    secondLastRoll db 0
.code
main proc far
    mov ax, @data
    mov ds, ax

print_loop:
    call rng                        ; Generate random number

    mov ah, 09h                     ; Print message
    mov dx, offset outputMsg
    int 21h

    mov ah, 02h                     ; Print number
    mov dl, randomNum
    add dl, '0'
    int 21h

    mov ah, 02h                     ; Print newline
    mov dl, 0Ah
    int 21h

    mov ah, 00h                     ; DOS function to accept input
    int 16h                  
    cmp al, '0'                     ; if input == '0', end loop
    jne print_loop                  

    mov ah, 4ch                     ; Exit program
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

        cmp dl, lastRoll            ; check against the last roll
        je reroll                   ; if it's the same as last roll, try again

        cmp dl, secondLastRoll      ; check against second last roll
        je reroll                   ; if it's the same, try again
    
        mov randomNum, dl           ; stores the generated random number to randomNum
        mov dh, lastRoll            
        mov secondLastRoll, dh
        mov lastRoll, dl            ; update the last roll

        ret
rng endp

end main