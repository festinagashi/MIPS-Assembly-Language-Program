.text
.globl main
  main:

li $v0, 4                 
la $a0, teksti           
syscall                   
li $v0, 5                 #num
syscall                   
move $t0, $v0             

li $t3, 0  #flag

blt $t0, 1, isNotPrime
beq $t0, 1, isNotPrime

prime:
li $t1, 2  #i
loopInPrime:
  div $t0, $t1
  mfhi $t2 
  beqz $t2, r1
  li $t3, 0
    j elsee
  addi $t1, $t1, 1
  b loopInPrime

r1:
    li $t3, 1
    j if    

if: 
    beq $t3, 1, isNotPrime

 elsee:
    beq $t3, 0 isPrime    

isPrime:
li $v0, 1
move $a0, $t0
syscall
li $v0, 4
la $a0, XisPrime
syscall
b exit

isNotPrime:
li $v0, 1
move $a0, $t0
syscall

li $v0, 4
la $a0, XisNotPrime
syscall
b exit


exit:
li $v0, 10
syscall

.data
 teksti: .asciiz "Enter positive integer to check: "
  XisPrime:  .asciiz " is  a prime number. "
 XisNotPrime: .asciiz " is not a prime number. "
