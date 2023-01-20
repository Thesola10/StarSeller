# vim: ft=gas
# as --64 -o star_seller.o star_seller.S && ld star_seller.o

# The Star Seller exercise in algorithmics,
# written in x86_64 Linux GNU Assembly.     [120 lines of code]

# Assembly language is literally a batch of CPU instructions. It is the purest
# form of programming, one could argue. However, it comes with a drawback:
# There is no standard environment. At some point, you're going to need to
# implement a lot of things from scratch.
#
# This program is entirely standalone and uses Linux x86_64 system calls.
# However, it is not relocatable.

.global     _start

            # System call definitions
SYS_EXIT    = 60
SYS_READ    = 0
SYS_WRITE   = 1
SYS_CLOSE   = 3

            # Code
            .text

# int _start(void)
# The program's entry point
_start:     movq    $name,      tgt
            movq    $qname,     msg
            movq    $qnamel,    msgl
            movq    $nvalid,    %rbx
            call    prompt              # Ask for user name

            movq    $SYS_WRITE, %rax
            movq    $hello1,    %rsi
            movq    $hello1l,   %rdx
            syscall
            movq    $name,      %rsi
            movq    $200,       %rdx
            movq    $SYS_WRITE, %rax
            syscall
            movq    $hello2,    %rsi
            movq    $hello2l,   %rdx
            movq    $SYS_WRITE, %rax
            syscall

            movq    $sstars,    tgt
            movq    $qstars,    msg
            movq    $qstarsl,   msgl
            movq    $svalid,    %rbx
            call    prompt              # Ask for number of stars

            call    ptstar              # Print number of stars

            movq    $gbye,      %rsi
            movq    $gbyel,     %rdx
            movq    $SYS_WRITE, %rax
            syscall
            movq    $name,      %rsi
            movq    $200,       %rdx
            movq    $SYS_WRITE, %rax
            syscall
            movq    $newl,      %rsi
            movq    $1,         %rdx
            movq    $SYS_WRITE, %rax
            syscall

            movq    $SYS_EXIT,  %rax
            movq    $0,         %rdx
            syscall                     # Exit program cleanly


# void prompt((*void)() valid %rbx)
# Prompt the user for data, and check for validity.
prompt:     movq    msg,        %rsi
            movq    msgl,       %rdx
            movq    $SYS_WRITE, %rax
            syscall

            movq    tgt,        %rsi
            movq    $SYS_READ,  %rax
            movq    $200,       %rdx
            movq    $0,         %rdi
            syscall

            decq                %rax    # Knock out trailing newline
            movb    $0,         (%rsi,%rax,1)
            call    *%rbx
            orq     %rax,       %rax
            jnz     prompt
            ret


# int %rax nvalid(void)
# Check if the user name is valid. (first chars aren't null)
nvalid:     movq    name,       %rcx
            jrcxz   0f
            movq    $0,         %rax
            ret

        0:  movq    $1,         %rax
            ret


# int %rax svalid(void)
# Check if the number of stars is valid. (0 <= n <= 200)
svalid:     movq    %rax,       %rcx
            call     atoi
            movq    %rax,       %rcx
            jecxz   0f
            subq    $201,       %rcx
            jecxz   0f
            movq    $0,         %rax
            ret

        0:  movq    $1,         %rax
            ret


# int %rax atoi(int readlen %rcx)
# Parse decimal integer out of string.
atoi:       xorq    %rdx,       %rdx
            movq    $sstars,    %rsi

        0:  movb    (%rsi),     %al
            incq    %rsi                # Load next digit

            subb    $'0',       %al
            imulq   $10,        %rdx
            addq    %rax,       %rdx    # Add mod 10 and mul 10 to buffer

            decq    %rcx
            jecxz   1f                  # Loop
            jmp     0b

        1:  movq    %rdx,       %rax
            movw    %ax,        stars
            ret


# void ptstar(void)
# Print the required number of stars
ptstar:     xorq    %rbx,       %rbx
            movw    stars,      %bx     # Load number of stars

            movq    $1,         %rdx
            movq    $star,      %rsi
            movq    $SYS_WRITE, %rax    # Load write params

        0:  syscall                     # Print one star

            decw    %bx
            jz      1f                  # Loop
            jmp     0b

        1:  movq    $newl,      %rsi
            syscall                     # Print line break and return
            ret


            # Read-only data (constants)
            .data

qname:      .ascii  "What is your name? "
qnamel =    . - qname

hello1:     .ascii  "Hello, "
hello1l =   . - hello1

hello2:     .ascii  "!\n"
hello2l =   . - hello2

qstars:     .ascii  "How many stars do you want? "
qstarsl =   . - qstars

gbye:       .ascii  "Goodbye, "
gbyel =     . - gbye

star:       .ascii  "*"

newl:       .ascii "\n"


            # Reserved memory (variables)
            .bss

.lcomm name,    200     # User name input
.lcomm sstars,  10      # Number of stars input
.lcomm stars,   2       # Parsed number of stars
.lcomm tgt,     8       # Pointer to target buffer
.lcomm msg,     8       # Pointer to message prompt
.lcomm msgl,    8       # Size of message prompt

# This language is case-insensitive.