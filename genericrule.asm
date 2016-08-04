;Generic rule program;
;A program that uses rules to assist
;In daily Maintenace of  Tractor.

;macro for displaying on the screen
%macro display 2
mov eax, 4
mov ebx, 1
mov ecx, %1
mov edx, %2
int 80h

%endmacro

;Macro for reading fro the keyboard
%macro read 1
mov eax, 3
mov ebx, 2
mov ecx, %1
mov edx, 1
int 80h

%endmacro


section .data													; section data
msg1: db '>>The Engine oil Below the required level, Enter 1', 10  ;>>mesg -the conditions messages of the rule
len1: equ $-msg1

ans1: db '<<Refill with The right grade of to the required level', 10   ;<<ans-the conculsion message of the rule
anslen1: equ $-ans1

msg2: db '>>The Engine oil dirty, Enter 1', 10
len2: equ $-msg2

ans2: db '<<Empty the dirty oil and fill it will clean oil of the Right grade', 10
anslen2: equ $-ans2

msg3: db '>>Battery Electrolyte level below the plates of the battery,Enter 1', 10
len3: equ $-msg3

ans3: db '<<To up with distilled water above the battery plates', 10
anslen3: equ $-ans3

msg4: db '>>Acid on the clamps and outside of the battery, Enter 1', 10
len4: equ $-msg4

ans4: db '<<Disconnect the cables, clean the clamps with warm water, Reattach cables', 10
anslen4: equ $-ans4

msg5: db '>>The nuts and bolts in the tractor loose, Enter 1', 10
len5: equ $-msg5

ans5: db '<<Tighten the nuts and bolts using a spanner', 10
anslen5: equ $-ans5

msg6: db '>>Radiator fins have dirt, Enter 1', 10
len6: equ $-msg6

ans6: db '<<Clean the fins with high pressure hose from engine side', 10
anslen6: equ $-ans6

msg7: db '>>The Radiator water level below the fins, Enter 1', 10
len7: equ $-msg7

ans7: db '<<Top up the radiator with clean water up to 25mm from the cap.', 10
anslen7: equ $-ans7


openmsg: db 'Tractor Daily Maintenance Guidelines', 10
openlen: equ $-openmsg

nwln: db ' ', 10						; for new line
nwlnlen: equ $-nwln
;alert message
time: db 'What is The Time, Between 12.00am and 11.59pm Enter 1, Between 12.00pm and 5.59pm Enter 2,Between 6.00pm and 11.59pm Enter 3',10
timelen: equ $-time

goodmorning: db'Welcome, Good Morning', 10
morninglen: equ $-goodmorning

goodevening: db 'Welcome, Good Evening', 10
eveninglen: equ $-goodevening

goodafternoon: db'Welcome, Good Afternoon', 10
afternoonlen: equ $-goodafternoon

leavemsg: db 'Thank you, For using Our system', 10
leavelen: equ $-leavemsg


section .bss					
condition resb 1


section .text					; text section

	global main

main:
	display openmsg, openlen
	display nwln, nwlnlen
	welcome:
		display time, timelen
		call readinput
		cmp ebx, ecx
		je welcomemsg1
		mov ecx, 2
		cmp ebx, ecx
		je welcomemsg2
		mov ecx, 3
		cmp ebx, ecx
		je welcomemsg3
		jmp exit

	welcomemsg1:
		display goodmorning, morninglen
		display nwln, nwlnlen
		jmp sub

	welcomemsg2:
		display goodafternoon, afternoonlen
		display nwln, nwlnlen
		jmp sub
	welcomemsg3:
		display goodevening, eveninglen
		display nwln, nwlnlen
		jmp sub


	sub:
		display msg1, len1
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn1
		jmp sub2

		process_cdn1:
			display ans1, anslen1
			display nwln, nwlnlen
			jmp sub2

	sub2:
		display msg2, len2
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn2
		jmp sub3

		process_cdn2:
			display ans2, anslen2
			display nwln, nwlnlen
			jmp sub3
	
	sub3:
		display msg3, len3
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn3
		jmp sub4

		process_cdn3:
		display ans3, anslen3
		display nwln, nwlnlen
		jmp sub4

	sub4:
		display msg4, len4
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn4
		jmp sub5

		process_cdn4:
		display ans4, anslen4
		display nwln, nwlnlen
		jmp sub5

sub5:
		display msg5, len5
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn5
		jmp sub6

		process_cdn5:
		display ans5, anslen5
		display nwln, nwlnlen
		jmp sub6
sub6:
		display msg6, len6
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn6
		jmp sub7

		process_cdn6:
		display ans6, anslen6
		display nwln, nwlnlen
		jmp sub7
sub7:
		display msg7, len7
		call readinput
		call readinput
		cmp ebx, ecx
		je process_cdn7
		jmp leave

		process_cdn7:
		display ans7, anslen7
		display nwln, nwlnlen
		jmp leave

leave:						; display the leave message from the system;
display nwln, nwlnlen
display leavemsg, leavelen

exit:		 ;exit from the system
mov eax, 1   ;move sys_exit code to eax
int 80h      ;call the kernel


readinput:			 ;procedure readinput,reads the value from the keyboard and store the value in a register then returns. 
read condition       ;read the condition from the keyboard using macro read
mov ebx, [condition]	
sub ebx, '0'         ;change from ASCII to decimal value read
mov ecx, 1            
ret                  ;returns
























