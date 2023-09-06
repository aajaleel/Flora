#####################################################################
#
# FLORA: MIPS Assembly Platformer game
# Aaliyah Jaleel
#
#####################################################################

.eqv BASE_ADDRESS  0x10008000
.eqv LAST_ADDRESS  0x10009FFC

.eqv SHIFT	   256
.eqv LAST_SHIFT	   2340
.eqv LIVES	   0x100081E8
.eqv SIZE	   2047	
# colours

.eqv HEART	   0x00fb91b3
.eqv SKY 	   0x00bfeff5
.eqv MAROON        0x00990030
.eqv RED	   0x00ec1c25
.eqv ORANGE 	   0x00fe7e00
.eqv GOLD 	   0x00e3ac16
.eqv LGOLD	   0x00ffc30e
.eqv BLACK 	   0x00000000
.eqv CLOUD	   0x0099d9ea
.eqv RAIN 	   0x00037696
.eqv GREEN         0x001e571e
.eqv PURPLE        0x0064287d
.eqv LPURPLE        0x00af58cc

.text
.globl main


#t0 is flower position
#t1 is sky colouring
#t2 is grass colouring
#t7 is starting 

main:
    
    li $t1, SKY	 # here storing a colour
    li $t2, GREEN
    li $t0, BASE_ADDRESS
    addi $t7,$t0,16384
    addi $t8, $t0, 14592

    jal fill_sky
       
       
    li $s0, BASE_ADDRESS
    addi $s0, $s0, 12028
    move $a0, $s0
    jal    draw_flower

    
    
    jal draw_cloud
    jal draw_lightning
    

    
    move $s0, $a0
    jal draw_flower

    

    #jal draw_heart
    #jal game_over
    
    

    
    
    main_loop:
    	li $s2, 0xffff0000
    	lw $s6, 0($s2)
    	#bne $s6, 1, main_draw

    	jal keypress

    # ------------------------------------
    # Redraw objects in the new position on the screen.
    main_draw:
        # redraw ship: 
        move    $a0, $s0
        jal    draw_flower                    # jump to draw_ship and save position to $ra

    main_sleep:
        # Wait one second (20 milliseconds)
        # decremennt if 
        li    $v0, 32
        li    $s0, 50
        syscall

    j main_loop
   


fill_sky:
   beq $t0,$t7, grass    # branch if 
   sw $t1,0($t0)   	 # 0 represents offsetting, sw storing the word from the left one into the right one
   add $t0,$t0,4	 # lw sends the right to the left
   j fill_sky		 # j means jump
   jr $ra

grass:
   beq $t8, $t7, exit
   sw $t2,0($t8)   	 # 0 represents offsetting, sw storing the word from the left one into the right one
   add $t8,$t8,4	 # lw sends the right to the left
   j grass		 # j means jump
   jr $ra

exit:
   #li $v0, 10
   #syscall
   


   
draw_cloud:
   
   li $a0, BASE_ADDRESS
   li $s1, CLOUD
   add $a0,$a0,2688
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   li $s1, RAIN
   sw $s1, 0($a0)
   li $s1, CLOUD
   add $a0,$a0,4
   sw $s1, 0($a0)
   
   add $a0,$a0,-256
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   li $s1, RAIN
   add $a0,$a0,-4
   sw $s1, 0($a0)
   li $s1, CLOUD
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   
   li $s1, RAIN
   add $a0,$a0,-256
   sw $s1, 0($a0)
   li $s1, CLOUD
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   add $a0,$a0,4
   sw $s1, 0($a0)
   
   li $s1, RAIN
   add $a0,$a0,-256
   sw $s1, 0($a0)
   li $s1, CLOUD
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   add $a0,$a0,-4
   sw $s1, 0($a0)
   
   add $a0,$a0,-256
   sw $s1, 0($a0)
   add $a0, $a0, 4
   sw $s1, 0($a0)
    
   jr $ra
   
draw_lightning:

   li $a0, BASE_ADDRESS
   li $s2, GOLD	 # here storing a colour
   add $a0,$a0,88
   add $a0,$a0,268
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   

   add $a0,$a0,256
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
 
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)

   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
  
  
   add $a0,$a0,264
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   
   add $a0,$a0,264
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   
   
   add $a0,$a0,256
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,4
   sw $s2, 0($a0)
   
   
   add $a0,$a0,252
   sw $s2, 0($a0)
   li $s2, LGOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   li $s2, GOLD
   add $a0,$a0,-4
   sw $s2, 0($a0)
   
   add $a0,$a0,256
   sw $s2, 0($a0)
   add $a0,$a0,4
   sw $s2, 0($a0)
   
   jr $ra
   	
draw_heart:
   	add $a0,$a0,184
	li	$t9, HEART
	
	sw	$t9, 0($a0)
	sw	$t9, 4($a0)
	sw	$t9, 12($a0)
	sw	$t9, 16($a0)
	addi	$a0, $a0, SHIFT
	sw	$t9, 0($a0)
	sw	$t9, 4($a0)
	sw	$t9, 8($a0)
	sw	$t9, 12($a0)
	sw	$t9, 16($a0)
	addi	$a0, $a0, SHIFT
	sw	$t9, 4($a0)
	sw	$t9, 8($a0)
	sw	$t9, 12($a0)	
	addi	$a0, $a0, SHIFT
	sw	$t9, 8($a0)
  
game_over:

   li $s0, BASE_ADDRESS
   li $s7, PURPLE	 # here storing a colour
   add $s0,$s0,5204
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   
   sw $s7, 0($s0)
   add $s0,$s0,260
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,28
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   
   add $s0,$s0,252
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-28
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,28
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-28
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,28
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4


   add $s0,$s0,252
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0) 
   
   add $s0,$s0,260
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)	
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)

   
   add $s0,$s0,1532
   sw $s7, 0($s0)
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   
   add $s0,$s0,-8
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)

   add $s0,$s0,-276
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,-8
   sw $s7, 0($s0)
   add $s0,$s0,-256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)

   jr $ra
  

draw_flower:
   li $s7, PURPLE

   add $s0,$s0,260
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,16
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0) 
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-8
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)  
   
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,4
   sw $s7, 0($s0) 
   
   add $s0,$s0,252
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, GOLD
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)  
   
   add $s0,$s0,260
   sw $s7, 0($s0)
   li $s7, GOLD
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,4
   sw $s7, 0($s0) 
   
  add $s0,$s0,260
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, GOLD
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)  
  
   add $s0,$s0,252
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,4
   sw $s7, 0($s0) 
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-8
   sw $s7, 0($s0)
   li $s7, LPURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)
   add $s0,$s0,-4
   sw $s7, 0($s0)
   li $s7, PURPLE
   add $s0,$s0,-4
   sw $s7, 0($s0)  
   
   add $s0,$s0,256
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,16
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0)
   add $s0,$s0,4
   sw $s7, 0($s0) 

   
   jr $ra
   
  
    
    
    
    
 keypress:	
	
	lw	$t0, 4($s0)
	beq	$t0, 0x61, press_a						
	beq	$t0, 0x77, press_w						
	beq	$t0, 0x64, press_d						
	beq	$t0, 0x73, press_s						
	beq	$t0, 0x70, press_p						

	# go left
	press_a:
		div	$s1, $t1						
		mfhi	$t9							
		beq	$t9, $zero, pressed				
		addi	$s1, $s1, -8						
		b pressed

	# go up
	press_w:
		blt	$s1, $t2, pressed					
		addi	$s1, $s1, -SHIFT				
		addi	$s1, $s1, -SHIFT				
		b pressed

	# go right
	press_d:
		move $s1, $s0
		div	$s1, $t1						
		mfhi	$t9							
		addi	$t1, $t1, -48						
		beq	$t9, $t1, pressed					
		addi	$s1, $s1, 8
		move $s6, $ra
		jal draw_flower
		move $ra, $s6				
		b pressed

	# go down
	press_s:
		bgt	$s1, $t3, pressed					
		addi	$s1, $s1, SHIFT				
		addi	$s1, $s1, SHIFT				
		b pressed

	press_p:
		# restart game
		la	$ra, main
		b pressed

	pressed:
		jr	$ra							# jump to ra
# ------------------------------------
    