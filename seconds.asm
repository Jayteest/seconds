
#Jacob St Lawrence
#This program prompts the user to enter a number of hours, minutes, and seconds.
#It then converts this all into a total number of seconds and displays the result.

.data	#Section to declare and initialize variables for strings to be used
	promptHours:	.asciiz 	"Enter the number of hours: "	#Create variable for prompt to input hours
	promptMinutes:	.asciiz		"Enter the number of minutes: "	#Create variable for prompt to input minutes
	promptSeconds:	.asciiz 	"Enter the number of seconds: "	#Create variable for prompt to input seconds
	resultSeconds:	.asciiz		"The total number of seconds is: "	#Create variable for results message

.text	#This tells the assembler to switch to the segment where the actual code goes

main:	#Display the prompt for user to input the number of hours
	li $v0, 4		#Command to print string
	la $a0, promptHours	#Load the string for the hours prompt into the argument for printing
	syscall			#Execute the command (print hours prompt)

	#Read user input
	li, $v0, 5		#Command to read the integer input from the user
	syscall			#Execute the command (read input)
	move $t0, $v0		#Place the input into a temporary register for later use

	#Display the prompt for user to input number of minutes
	li $v0, 4		#Command to print string
	la $a0, promptMinutes	#Load the string for the minutes prompt into the argument for printing
	syscall			#Execute the commant (print minutes prompt)

	#Read user input
	li $v0, 5		#Command to read the integer input from the user
	syscall			#Execute the command (read input)
	move $t1, $v0		#Place the input into a temporaty register for later use

	#Display the prompt for the user to input number of seconds
	li $v0, 4		#Command to print string
	la $a0, promptSeconds	#Load the string for the seconds prompt into the argument for printing
	syscall			#Execute the command (print seconds prompt)

	#Read user input
	li $v0, 5		#Command to read the integer input from the user
	syscall			#Execute the command (read input)
	move $t2, $v0		#Place the input into a temporary register for later use

	#Convert all values into seconds
	mul $t0, $t0, 3600	#Convert the number of hours into seconds by multiplying by 3600 and place result back into register
	mul $t1, $t1, 60	#Convert the number of minutes into seconds by multiplying by 60 and place result back into register

	#Sum the values
	add $t0, $t0, $t1	#Add the seconds representing the minutes to the seconds representing the hours
	add $t0, $t0, $t2	#Add the seconds to the sum from the previous line, resulting in the total being in $t0

	#Display results message
	li $v0, 4		#Command to print string
	la $a0, resultSeconds	#Load the string for the results message into the argument for printing
	syscall			#Execute command (print results message)

	#Display result
	li $v0, 1		#Command to print integer
	la $a0, ($t0)		#Load the integer representing the sum of the seconds into the argument for printing
	syscall			#Execute command (print the sum)

	#Exit program
	li $v0, 10		#Command to terminate program
	syscall			#Execute command (terminate program)
