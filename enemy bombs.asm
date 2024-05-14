asect 0x00
push r0

main:
	pop r0
	ldi r2, 0
	ldi r0, str2
	ldi r3, res
	
	ld r0, r0
	
	ldi r1, 0
	if
		cmp r0, r1 # r2 = 0
	is eq
		ldi r1, -1
		st r3, r1
		inc r3
	else
		while
			ldi r2, 0
			cmp r0, r2
		stays hi
			shra r0		
			inc r1
		wend
		dec r1
		ldi r2, 16
		add r2, r1
		st r3, r1
		inc r3
	fi
	
	ldi r0, str3
	ld r0, r0
	
	ldi r1, 0
	if
		cmp r0, r1 # r2 = 0
	is eq
		ldi r1, -1
		st r3, r1
		inc r3
	else
		while
			ldi r2, 0
			cmp r0, r2
		stays hi
			shra r0
			inc r1
		wend
		dec r1
		ldi r2, 8
		add r2, r1
		st r3, r1
		inc r3
	fi
	
	ldi r0, str4
	ld r0, r0
	
	ldi r1, 0
	if
		cmp r0, r1 # r2 = 0
	is eq
		ldi r1, -1
		st r3, r1
	else
		while
			ldi r2, 0
			cmp r0, r2
		stays hi
			shra r0
			inc r1
		wend
		dec r1
		st r3, r1
	fi
	# random
	ldi r3, 0xF7
	ldi r0, rand
	ld r0, r0
	# r0 - rand num (in the end)
	ldi r1, -1
	
	if
		ldi r2, 0
		cmp r2, r0
	is eq
		if
			ldi r2, 3
			sub r3, r2
			ld r2, r2
			cmp r1, r2
		is ne
			ldi r3, res
			ldi r0, 3
			add r0, r3
			st r3, r2
			jsr main
		else
			inc r0
		fi
	fi
	
	if
		ldi r2, 1
		cmp r2, r0
	is eq
		if
			ldi r2, 2
			sub r3, r2
			ld r2, r2
			cmp r1, r2
		is ne
			ldi r3, res
			ldi r0, 3
			add r0, r3
			st r3, r2
			jsr main
		else
			inc r0
		fi
	fi
	if
		ldi r2, 2
		cmp r2, r0
	is eq
		if
			ldi r2, 1
			sub r3, r2
			ld r2, r2
			cmp r1, r2
		is ne
			ldi r3, res
			ldi r0, 3
			add r0, r3
			st r3, r2
			jsr main
		else
			ldi r3, res
			ld r3, r3
			ldi r2, res
			ldi r1, 3
			add r1, r2
			st r2, r3
		fi
	fi
	
	jsr main

asect 0xF0
rand: dc 1
str2: dc 0b00010000
str3: dc 0b01000000
str4: dc 0b00000000
res: ds 4
end