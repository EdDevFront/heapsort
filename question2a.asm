.globl swap, getLeftChildIndex, getRightChildIndex

main:
  lui $s0, 0x1004        # $s0 = 0x10040000
  li $t0, 2              # $t0 = 2
  sw $t0, ($s0)          # array[0] = $t0
  li $t0, 5              # $t0 = 5
  sw $t0, 4($s0)         # array[1] = $t0

  li $a0, 0              # i = 0
  li $a1, 1              # j = 1
  jal swap               # swap(i, j)

  li $a0, 2              # index = 2
  jal getLeftChildIndex  # getLeftChildIndex(index)
  jal getRightChildIndex # getRightChildIndex(index)

  li $v0, 10             # $v0 = 10
  syscall                # halt

swap:
  sll $t0, $a0, 2        # $t0 = i * 4
  add $t0, $t0, $s0      # $t0 = &array[i]
  sll $t1, $a1, 2        # $t1 = j * 4
  add $t1, $t1, $s0      # $t1 = &array[j]
  lw $t2, ($t0)          # $t2 = array[i]
  lw $t3, ($t1)          # $t3 = array[j]
  sw $t3, ($t0)          # array[i] = $t3
  sw $t2, ($t1)          # array[j] = $t2
  jr $ra

getLeftChildIndex:
  sll $t0, $a0, 2        # $t0 = index * 2
  addi $v0, $t0, 1       # $v0 = $t0 + 1
  jr $ra                 # return $v0

getRightChildIndex:
  sll $t0, $a0, 2        # $t0 = index * 2
  addi $v0, $t0, 2       # $v0 = $t0 + 2
  jr $ra                 # return $v0
