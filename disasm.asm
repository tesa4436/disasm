.model small
       ASSUME CS:kodas, DS:duomenys, SS:stekas
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
stekas segment word stack 'STACK'
       dw 400h dup (00)               ; stekas -> 2 Kb
stekas ends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
duomenys segment para public 'DATA'
    komEilIlgis:
       db 00
    komEilutesArgumentas:
       db 100h dup (00)
    skaitomasFailas:
       dw 0FFFh 

    strCMC:
	db 'CMC $'  
    strSTC:
	db 'STC $'  
    strCLC:
	db 'CLC $'  
    strRET:
	db 'RET $'  
    strRETF:
	db 'RETF $' 
	

    comma db ', $'
    
    jmp_table 	db 00	;	0
    		db 04d	;	1
    		db 09d	;	2
    		db 013d	;	3
    		db 018d	;	4
    		db 022d	;	5
    		db 027d	;	6
    		db 032d	;	7
    		db 036d	;	8
    		db 040d	;	9
    		db 045d	;	10
    		db 049d	;	11
    		db 054d	;	12
    		db 058d	;	13
    		db 063d	;	14
    		db 068d	;	15

    		db 073d	;	
    		db 081d	;	
    		db 088d	;	
    		db 094d	;	
        
strconjmp db 'JO $JNO $JB $JAE $JE $JNE $JBE $JA $JS $JNS $JP $JNP $JL $JNL $JLE $JG  $LOOPNE $LOOPE $LOOP $JCXZ $'
    
reg_table db 00 ,03h ,06h ,09h ,0Ch ,0Fh ,012h ,015h ,018h ,01Bh ,01Eh ,021h ,024h ,027h ,02Ah ,02Dh
	      
    seg_reg_table db 030h
    		  db 033h
    		  db 036h
    		  db 039h


    mod00_rm_table  db 00
		    db 013h
		    db 026h
		    db 039h
		    db 04Ch
		    db 05Ah
		    db 068h
		    db 078h
		    ;-----WORD--------
		    db 086h
		    db 099h
		    db 0ACh
		    db 0BFh
		    db 0D2h
		    db 0E0h
		    db 0EEh
		    db 0FEh
		    
	rm_table  db 00, 00
		  db 01Ah, 00
		  db 034h, 00
		  db 04Eh, 00
		  db 068h, 00
		  db 07Dh, 00
		  db 092h, 00
		  db 0A7h, 00
		  ;------WORD--------
		  db 0BCh, 00
		  db 0D6h, 00
		  db 0F0h, 00
		  db 0Ah,  01h
		  db 024h, 01h
		  db 039h, 01h
		  db 04Eh, 01h
		  db 063h, 01h
    
    

    reg000b db 'AL$'  ; + 24, if w = 1
    reg001b db 'CL$'  ; etc
    reg010b db 'DL$'
    reg011b db 'BL$'
    reg100b db 'AH$'
    reg101b db 'CH$'
    reg110b db 'DH$'
    reg111b db 'BH$'
    
    reg000w db 'AX$'
    reg001w db 'CX$'
    reg010w db 'DX$'
    reg011w db 'BX$'
    reg100w db 'SP$'
    reg101w db 'BP$'
    reg110w db 'SI$'
    reg111w db 'DI$'
    
    segment00 db 'ES$'
    segment01 db 'CS$'
    segment10 db 'SS$'
    segment11 db 'DS$'
    
    rm000b db 'BYTE PTR [0000 + BX + SI]$' ; 13 + 0           
    rm001b db 'BYTE PTR [0000 + BX + DI]$' ; 13 + 26  1Ah
    rm010b db 'BYTE PTR [0000 + BP + SI]$' ; 13 + 52  34h
    rm011b db 'BYTE PTR [0000 + BP + DI]$' ; 13 + 78  4Eh
    rm100b db 'BYTE PTR [0000 + SI]$' ;      13 + 104 68h
    rm101b db 'BYTE PTR [0000 + DI]$' ;      13 + 125 7Dh
    rm110b db 'BYTE PTR [0000 + BP]$' ;      13 + 146 92h
    rm111b db 'BYTE PTR [0000 + BX]$' ;      13 + 167 A7h
    
    rm000w db 'WORD PTR [0000 + BX + SI]$' ; 13 + 188 0BCh	+ ()  	26*4 + 21*4			0BCh
    rm001w db 'WORD PTR [0000 + BX + DI]$';  13 + 214 0D6h	+ ()  	26*4 + 21*4 + 26		0D6h
    rm010w db 'WORD PTR [0000 + BP + SI]$';  13 + 240 0F0h	+ ()	26*4 + 21*4 + 26*2		0F0h
    rm011w db 'WORD PTR [0000 + BP + DI]$';  13 + 266 10Ah	+ ()	26*4 + 21*4 + 26*3		10Ah
    rm100w db 'WORD PTR [0000 + SI]$';       13 + 292 124h	+ ()	26*4 + 21*4 + 26*4		124h
    rm101w db 'WORD PTR [0000 + DI]$';       13 + 313 139h	+ ()	26*4 + 21*4 + 26*4 + 21		139h
    rm110w db 'WORD PTR [0000 + BP]$';	     13 + 334 14Eh	+ ()	26*4 + 21*4 + 26*4 + 21*2	14Eh
    rm111w db 'WORD PTR [0000 + BX]$';       13 + 355 163h	+ ()	26*4 + 21*4 + 26*4 + 21*3	163h
    
    mod00_rm000b db 'BYTE PTR [BX + SI]$' ; 19  ; 0
    mod00_rm001b db 'BYTE PTR [BX + DI]$' ;       19  013h
    mod00_rm010b db 'BYTE PTR [BP + SI]$' ;       38  026h
    mod00_rm011b db 'BYTE PTR [BP + DI]$' ;       57  039h
    mod00_rm100b db 'BYTE PTR [SI]$'     ;  14    76  04Ch
    mod00_rm101b db 'BYTE PTR [DI]$'     ;        90  05Ah
    mod00_rm110b db 'BYTE PTR [0000]$' ;16        104 068h
    mod00_rm111b db 'BYTE PTR [BX]$'    ;         120 078h
    
    mod00_rm000w db 'WORD PTR [BX + SI]$'	; 134 086h
    mod00_rm001w db 'WORD PTR [BX + DI]$'	; 153 099h
    mod00_rm010w db 'WORD PTR [BP + SI]$'	; 172 0ACh
    mod00_rm011w db 'WORD PTR [BP + DI]$'	; 191 0BFh
    mod00_rm100w db 'WORD PTR [SI]$'		; 210 0D2h
    mod00_rm101w db 'WORD PTR [DI]$'		; 224 0E0h
    mod00_rm110w db 'WORD PTR [0000]$'		; 238 0EEh
    mod00_rm111w db 'WORD PTR [BX]$'		; 254 0FEh

    prog_ip db 0ffh, 00
    prog_ip_printable db 00, 00, 00, 00, ':    $'
    
    strsalc db 'SALC $'
    move db 'MOV $'
    strpush db 'PUSH $'
    strpop db 'POP $'
    strxchg db 'XCHG $'
    strnop db 'NOP $'
    strin db 'IN $'
    strout db 'OUT $'
    strxlat db 'XLAT $'
    strlea db 'LEA $'
    strles db 'LES $'
    strlds db 'LDS $'
    strlahf db 'LAHF $'
    strsahf db 'SAHF $'
    strpushf db 'PUSHF $'
    strpopf db 'POPF $'
    stradd db 'ADD $'
    stradc db 'ADC $'
    strinc db 'INC $'
    strsub db 'SUB $'
    strsbb db 'SBB $'
    strdec db 'DEC $'
    strneg db 'NEG $'
    strcmp db 'CMP $'
    straaa db 'AAA $'
    strbaa db 'DAA $'
    straas db 'AAS $'
    strdas db 'DAS $'
    strmul db 'MUL $'
    strimul db 'IMUL $'
    straam db 'AAM $'
    strdiv db 'DIV $'
    stridiv db 'IDIV $'
    straad db 'AAD $'
    strcbw db 'CBW $'
    strcwd db 'CWD $'
    strnot db 'NOT $' 
    strshl db 'SHL $'
    strshr db 'SHR $'
    strsar db 'SAR $'
    strrol db 'ROL $'
    strror db 'ROR $'
    strrcl db 'RCL $'
    strrcr db 'RCR $'
    strand db 'AND $'
    strtest db 'TEST $'
    stror db 'OR $'
    strxor db 'XOR $'
    strrepe db 'REPE $'
    strrepne db 'REPNE $'
    strmovsb db 'MOVSB $'
    strmovsw db 'MOVSW $'
    strcmpsb db 'CMPSB $'
    strcmpsw db 'CMPSW $'
    strscasb db 'SCASB $'
    strscasw db 'SCASW $'
    strlodsb db 'LODSB $'
    strlodsw db 'LODSW $'
    strstosb db 'STOSB $'
    strstosw db 'STOSW $'
    strcall db 'CALL $'
    strcallfar db 'CALL FAR $'
    strjmp db 'JMP $'
    strfarjmp db 'JMP FAR $'
    strint db 'INT $'
    strinto db 'INTO $'
    striret db 'IRET $'
    strcld db 'CLD $'
    strstd db 'STD $'
    strcli db 'CLI $'
    strsti db 'STI $'
    strhlt db 'HLT $'
    strwait db 'WAIT $'
    stresc db 'ESC $'
    strlock db 'LOCK $'
    
    dir_word db 00, 00
    adr_mod  db 00
    adr_reg  db 00
    adr_rm   db 00
    in_opcode_info db 00, 00
    segg			db 00, 00
    ofset 			db 00, 00
    displacement 		db 00, 00
    displacement_printable 	db 00, 00, 00, 00, '$'
				db 00, 00, '$'
    rm_print_disp 		db 00, 00
    full_opcode 		db 00, 00
    ext_opcode_flag 		db 00
    file_pointer 		db 00, 00
    skip_immediate 		db 00
    signed 			db 00
    no_newline 			db 00
    string_op 			db 00
    dont_care 			db 00

    
    strDB:
       db 'DB ' 
    nuskaitytas:
       db 00, 00, 'h$' 
   
    klaidosPranesimas:
       db 'Klaida skaitant argumenta $'

    klaidosApieFailoAtidarymaPranesimas:
       db 'Klaida atidarant faila $'

    klaidosApieFailoSkaitymaPranesimas:
       db 'Klaida skaitant faila $'


    naujaEilute:   
       db 0Dh, 0Ah, '$'  ; tekstas ant ekrano
 
duomenys ends
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LOCALS @@

writeln   macro eilute
          push ax
          push dx
      
          mov ah, 09
          mov dx, offset eilute
          int 21h
          
          mov ah, 09
          mov dx, offset naujaEilute
          int 21h
          
          pop dx
          pop ax          

          endm

writeln_non   macro eilute
          push ax
          push dx

          mov ah, 09
          mov dx, offset eilute
          int 21h
                    
          pop dx
          pop ax          

          endm
          
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
readln    macro eilute
          mov ah, 0Ah
          mov dx, offset eilute
          int 21h
          
          mov ah, 09
          mov dx, offset naujaEilute
          int 21h
         
          endm

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


kodas segment para public 'CODE'

write_direction_and_word_bits proc near
  
  push ax
  push cx
  
    xor ah, ah
    mov cx, 0002h
    div cl
    mov byte ptr[dir_word + 1], ah
    xor ah, ah
    
    div cl
    mov byte ptr[dir_word], ah
  
  pop cx
  pop ax

ret
write_direction_and_word_bits endp

write_disp_mod00 proc near

	      push ax
	      push cx
	      push dx
	      push di
	      push si
	      xor di, di
	      cmp byte ptr[dir_word + 1], 1
	      je @@mov_di
	      cmp byte ptr[ext_opcode_flag], 1
	      je @@mov_di
	      jne @@continue
	      
		@@mov_di:
		  mov di, 134d
		@@continue:
		
		xor dx, dx
		mov ax, word ptr[displacement]
		mov cx, 0010h
		div cx
		mov byte ptr[mod00_rm110b + 13 + di], dl
		cmp dl, 0Ah
		jb @@below
		add byte ptr[mod00_rm110b + 13 + di], 037h
		
		jmp @@skip21
		@@below:
		add byte ptr[mod00_rm110b + 13 + di], 030h
		@@skip21:
		
		xor dx, dx
		div cx
		
		mov byte ptr[mod00_rm110b + 12 + di], dl
		cmp dl, 0Ah
		jb @@below_1
		add byte ptr[mod00_rm110b + 12 + di], 037h
		
		jmp @@skip22
		@@below_1:
		add byte ptr[mod00_rm110b + 12 + di], 030h
		@@skip22:

		xor dx, dx
		div cx
		
		mov byte ptr[mod00_rm110b + 11 + di], dl
		cmp dl, 0Ah
		jb @@below_2
		add byte ptr[mod00_rm110b + 11 + di], 037h
		
		jmp @@skip24
		@@below_2:
		add byte ptr[mod00_rm110b + 11 + di], 030h
		@@skip24:

		xor dx, dx
		div cx
		
		mov byte ptr[mod00_rm110b + 10 + di], dl
		cmp dl, 0Ah
		jb @@below_3
		add byte ptr[mod00_rm110b + 10 + di], 037h
		
		jmp @@skip23
		@@below_3:
		add byte ptr[mod00_rm110b + 10 + di], 030h
		@@skip23:
		

	      lea si, [mod00_rm110b + di]
	      writeln_non si
	      pop si
	      pop di
	      pop dx
	      pop cx
	      pop ax


ret
write_disp_mod00 endp
;=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--=-=-=-=-=-=-=-

analysis_mod11_new proc near
;writeln_non strtest
;writeln_non comma
push si
push di
push cx

	    xor si, si
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di
	    jne @@cont
	    
	    @@word_di:
	    	mov di, 8
	    @@cont:

	    cmp byte ptr[dir_word + 0], 0 ; if direction 0
	    je @@mov_si
	    
	    jmp @@skip
	    @@mov_si:
	    mov si, 1
	    @@skip:
	    
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@si_one
	    jmp @@cont10
	    
	    @@si_one:
	      mov si, 1
	    @@cont10:
	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG ;
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg
	    jmp @@cont8
	    
	    @@seg:
	    cmp byte ptr[dir_word], 0
	    je @@cont5
	    mov di, 016d
	    jmp @@cont8
	    @@cont5:
	      mov di, 8
	    @@cont8:
	    
	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG </seg>  </seg> </seg> 
	    mov al, byte ptr[adr_reg + si]
	    xor cx, cx
    
    	    jmp @@loop
	    @@return:
	    ; SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG 
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@cx_four
	    jmp @@cont6
	    @@cx_four:
	      ;cmp byte ptr[dir_word], 0
	      ;je @@cont6
	      mov cx, 4
	      jmp @@loop
	    @@cont6:
	    ; SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG </seg> </seg> </seg> 
	    mov cx, 0008h
	    
	    @@loop:
	      cmp al, cl
	      je @@if_eq
	      jmp @@end
	      @@if_eq:
		push bx
		    add di, cx
		    mov bl, byte ptr [reg_table + di]
		    lea di, [reg000b + bx]
		    writeln_non di
		    ;writeln_non comma
		pop bx
		cmp byte ptr[skip_immediate], 0FFh
		je @@end
		writeln_non comma
	      @@end:
	    jcxz @@return
	    loop @@loop
	    
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di1
	    jne @@cont1
	    
	    @@word_di1:
	    	mov di, 8
	    @@cont1:
	    
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@write_data
;;;;;;;;;;;;;;;;;;;;;;;;;;
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg1
	    jmp @@cont15
	    
	    @@seg1:
	    cmp byte ptr[dir_word], 0
	    jne @@cont13
	    mov di, 016d
	    jmp @@cont15
	    @@cont13:
	    mov di, 8
;	    cmp byte ptr[ext_opcode_flag], 1
;	    je @@non_seg_di1:
;	    jmp @@cont10
;	    
;	    @@non_seg_di1:
;	      mov di, 8
	    @@cont15:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	    neg si
	    xor cx, cx
	    mov al, byte ptr[adr_rm + si]
	    jmp @@loop1
	    @@return1:
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@cx_four1
	    jmp @@cont11
	    
	    @@cx_four1:
	    cmp byte ptr[dir_word], 0
	    jne @@cont11
	    mov cx, 4
	    jmp @@loop1
	    @@cont11:
	    mov cx, 0008h
	    
	    @@loop1:
	    cmp al, cl
	    je @@if_eq1
	    jmp @@end1
	    @@if_eq1:
	      push bx
	      
	      add di, cx
	      mov bl, byte ptr[reg_table + di]
	      lea di, [reg000b + bx]
	      writeln di
	      
	      pop bx
    
	    @@end1:
	    jcxz @@return1
	    loop @@loop1
jmp @@cont9
@@write_data:
cmp byte ptr[skip_immediate], 0FFh
je @@cont12
call immediate_or_other
@@cont12:
cmp byte ptr[no_newline], 0FFh
je @@cont9
writeln_non naujaEilute
@@cont9:

pop cx
pop di
pop si
ret
analysis_mod11_new endp

out_of_range_func3 proc near

		cmp si, 0
		je @@is_reg
		
		push bx
		    add di, cx
		    mov bl, byte ptr [mod00_rm_table + di]
		    
		    cmp al, 6
		    je @@is_six
		    jmp @@skip2
		    @@is_six:
			call read_disp_2b
			call write_disp_mod00
			;writeln_non comma
		    pop bx
		    jmp @@end
		    @@skip2:
			
		    lea di, [mod00_rm000b + bx]
		    writeln_non di
		    ;writeln_non comma
		pop bx
		    jmp @@end
		    
		    @@is_reg:
		    
		push bx
		    add di, cx
		    mov bl, byte ptr [reg_table + di]
		    lea di, [reg000b + bx]
		    writeln_non di
		    ;writeln_non comma
		pop bx


@@end:
cmp byte ptr[skip_immediate], 0FFh
je @@end1
writeln_non comma

@@end1:
ret
out_of_range_func3 endp

analysis_mod00 proc near
;writeln_non strtest
;writeln_non comma
push si
push di
push cx

	    xor si, si
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di
	    jne @@cont
	    
	    @@word_di:
	    	mov di, 8
	    @@cont:
	    
	    
	    cmp byte ptr[dir_word + 0], 0 ; if direction 0
	    je @@mov_si
	    
	    jmp @@skip
	    @@mov_si:
	    mov si, 1
	    @@skip:
	    
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@si_one
	    jmp @@cont10
	    
	    @@si_one:
	      mov si, 1
	    @@cont10:
	    
	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG ;
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg
	    jmp @@cont8
	    
	    @@seg:
	    cmp byte ptr[dir_word], 0
	    je @@cont5
	    mov di, 016d
	    jmp @@cont8
	    @@cont5:
	      mov di, 8
	    @@cont8:
    
	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG </seg>  </seg> </seg> 

	    mov al, byte ptr[adr_reg + si]
	    xor cx, cx
    
    	    jmp @@loop
	    @@return:
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@cx_four
	    jmp @@cont6
	    @@cx_four:
	      cmp byte ptr[dir_word], 0
	      je @@cont6
	      mov cx, 4
	      jmp @@loop
	    @@cont6:
	    mov cx, 0008h
	    
	    @@loop:
	      cmp al, cl
	      je @@if_eq
	      jmp @@end
	      @@if_eq:
		  call out_of_range_func3
	      @@end:
	    jcxz @@long_return
	    jmp @@cont2
	    @@long_return:
	    jmp @@return
	    @@cont2:
	    
	    loop @@loop
	    
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di1
	    jne @@cont1
	    
	    @@word_di1:
	    	mov di, 8
	    @@cont1:
	    
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@long_write_data
	    jmp @@cont3
	    @@long_write_data:
	      jmp @@write_data
	    @@cont3:
	    
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg1
	    jmp @@cont15
	    
	    @@seg1:
	    cmp byte ptr[dir_word], 0
	    jne @@cont13
	    mov di, 016d
	    jmp @@cont15
	    @@cont13:
	    mov di, 8
	    @@cont15:

	    
	    neg si
	    xor cx, cx
	    mov al, byte ptr[adr_rm + si]
	    jmp @@loop1
	    @@return1:
	    mov cx, 0008h
	    
	    @@loop1:
	    cmp al, cl
	    je @@if_eq1
	    jmp @@end1
	    @@if_eq1:
	      cmp si, 0
	      je @@is_rm
	      
	      push bx
	      
	      add di, cx
	      mov bl, byte ptr[reg_table + di]
	      lea di, [reg000b + bx]
	      writeln di
	      
	      pop bx
	    jmp @@end1
	    
	    @@is_rm:
	    
	      push bx
		  
		  add di, cx
		  mov bl, byte ptr[mod00_rm_table + di]
		  
		    cmp al, 6
		    je @@is_six1
		    jmp @@skip3
		    @@is_six1:
			call read_disp_2b
			call write_disp_mod00
			writeln_non naujaEilute
		    
		    pop bx
		    jmp @@end1
		    @@skip3:

		  
		  lea di, [mod00_rm000b + bx]
		  writeln di
		  
	      pop bx

	    
	    @@end1:
	    jcxz @@return1
	    loop @@loop1

jmp @@cont9
@@write_data:
cmp byte ptr[skip_immediate], 0FFh
je @@cont09
call immediate_or_other
@@cont09:
cmp byte ptr[no_newline], 0FFh
je @@cont9
writeln_non naujaEilute
@@cont9:

pop cx
pop di
pop si
ret
analysis_mod00 endp

immediate_or_other proc near

    cmp byte ptr[dir_word + 1], 1
    je @@call_2b
    @@signed:
    call read_disp_1b
    call print_data
    jmp @@cont

    @@call_2b:
    cmp byte ptr[signed], 0FFh
    je @@signed
    call read_disp_2b
    call print_data
    
    @@cont:

ret
immediate_or_other endp


restore_cx proc near
	push ax
	push dx
	
	mov ax, cx
	mov dx, 2
	mul dl
	mov cx, ax
	
	pop dx
	pop ax
ret
restore_cx endp

out_of_range_func proc near ; funkcija, padaryta del to, kad netelpa cikle ( >127 baitai )
		cmp si, 0
		je @@is_reg
		call restore_cx
		push bx
		    cmp byte ptr[dir_word + 1], 1
		    je @@add_di
		    jmp @@cont2
		    
		    @@add_di:
		    	add di, 8
		    @@cont2:
		    
		    cmp byte ptr[ext_opcode_flag], 1
		    jne @@cont3
		    mov di, 0010h

		    @@cont3:
		    
		    add di, cx
		    mov bx, word ptr [rm_table + di]
		    call write_disp_mod01_new ;<><><><><><><><><><><><><>><><>
		    lea di, [rm000b + bx]
		    writeln_non di
		    ;writeln_non comma
		pop bx
		    jmp @@end
		    
		    @@is_reg:
;		cmp byte ptr[ext_opcode_flag], 1
;		jne @@succ
;		writeln_non strtest
;		@@succ:
    
		push bx
		xor bx, bx
		    add di, cx
		    mov bl, byte ptr [reg_table + di]
		    lea di, [reg000b + bx]
		    writeln_non di
		    ;writeln_non comma
		pop bx
		call restore_cx

@@end:
cmp byte ptr[skip_immediate], 0FFh
je @@end1
writeln_non comma

@@end1:

ret
out_of_range_func endp

out_of_range_func1 proc near
	      cmp si, 0
	      je @@is_rm
	      
	      cmp byte ptr[ext_opcode_flag], 1
	      jne @@cont
	      mov di, 0010h
	      @@cont:
	      
	      push bx
	      add di, cx
	      mov bl, byte ptr[reg_table + di]
	      lea di, [reg000b + bx]
	      writeln di
	      
	      pop bx
	      call restore_cx
	    jmp @@end1
	    
	    @@is_rm:
	    call restore_cx
	      push bx
		  
		    cmp byte ptr[dir_word + 1], 1
		    je @@add_di1
		    jmp @@cont5
		    
		    @@add_di1:
		    	add di, 8
		    @@cont5:
		    
		    cmp byte ptr[ext_opcode_flag], 1
		    jne @@cont04
		    mov di, 016d
		    @@cont04:
		  
		  add di, cx
		  mov bx, word ptr[rm_table + di]
		  call write_disp_mod01_new  ; ><><><><>><><><><><><><><><><><><><><
		  lea di, [rm000b + bx]
		  writeln di
		  
	      pop bx
@@end1:
ret
out_of_range_func1 endp


analysis_mod01_new proc near   ;  kai mod = 10 arba mod = 01
;writeln_non strtest
;writeln_non comma
push si
push di
push cx

	    xor si, si
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di
	    jne @@cont
	    
	    @@word_di:
	    	mov di, 8
	    @@cont:

	    cmp byte ptr[dir_word + 0], 0 ; if direction 0
	    je @@mov_si
	    
	    jmp @@skip
	    @@mov_si:
	    mov si, 1
	    @@skip:
	   
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@si_one
	    jmp @@cont10
	    
	    @@si_one:
	      mov si, 1
	    @@cont10:

	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG ;
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg
	    jmp @@cont8
	    
	    @@seg:
	    
	    cmp byte ptr[dir_word], 0; JUST JUST JUST JUST
	    je @@cont09
	    mov di, 0010h
	    jmp @@cont8
	    @@cont09:
	    
	      mov di, 8
	    @@cont8:
    
	    ;SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG SEG </seg>  </seg> </seg> 
	    
	    mov al, byte ptr[adr_reg + si]
	    xor cx, cx
    
    	    jmp @@loop
	    @@return:
	    
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@cx_four
	    jmp @@cont06
	    @@cx_four:
	      cmp byte ptr[dir_word], 0
	      je @@cont06
	      mov cx, 8   ; nes po to:  left shift cx 1, ir dec cx
	      jmp @@loop
	    @@cont06:

	    
	    mov cx, 000Eh
	    
	    @@loop:
	    	shr cx, 1
	      cmp al, cl
	      je @@if_eq
	      call restore_cx
	      jmp @@end
	      @@if_eq:
		call out_of_range_func
	      @@end:
	    jcxz @@return

	    dec cx
	    loop @@loop
	    
	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di1
	    jne @@cont1
	    
	    @@word_di1:
	    	mov di, 8
	    @@cont1:
	    
	    cmp byte ptr[ext_opcode_flag], 0FFh
	    je @@write_data_jmp
	    jmp @@cont3
	    
	    @@write_data_jmp:
		jmp @@write_data
	    @@cont3:
	    cmp byte ptr[ext_opcode_flag], 1
	    je @@seg1
	    jmp @@cont15
	    
	    @@seg1:
	    cmp byte ptr[dir_word], 0
	    jne @@cont13
	    mov di, 016d
	    jmp @@cont15
	    @@cont13:
	    mov di, 8
	    @@cont15:
	    
	    neg si
	    xor cx, cx
	    mov al, byte ptr[adr_rm + si]
	    jmp @@loop1
	    @@return1:
	    mov cx, 000Eh
	    
	    @@loop1:
	    shr cx, 1
	    cmp al, cl
	    je @@if_eq1
	    call restore_cx
	    jmp @@end1
	    @@if_eq1:
	    
	    call out_of_range_func1
	    
	    @@end1:
	      cmp di, 0010h
	      je @@sub_di1
	      jmp @@cont6
	      
	      @@sub_di1: ;++++++++++++++++++++++++++++++
	      	sub di, 8
	      @@cont6:

	    jcxz @@return1
	    dec cx
	    loop @@loop1
jmp @@cont9
@@write_data:
cmp byte ptr[skip_immediate], 0FFh
je @@cont11
call immediate_or_other
@@cont11:
cmp byte ptr[no_newline], 0FFh
je @@cont9
writeln_non naujaEilute
@@cont9:


pop cx
pop di
pop si
ret
analysis_mod01_new endp

write_disp_mod01_new proc near
	cmp byte ptr[adr_mod], 2
	je @@other_call
	jmp @@cont
		@@other_call:
			call write_disp_mod10_new
			ret
		@@cont:
	call read_disp_1b

	  push ax
	  push cx
	  push dx
	  push di
	  push si

	    mov di, bx
	    xor dx, dx
	    mov al, byte ptr[displacement]
	    mov cx, 0010h
	    
	    shr al, 7
	    cmp al, 1
	    je @@write_ff
	    
	    mov al, byte ptr[displacement]
	    xor ah, ah
	    jmp @@skip30
	    @@write_ff:
	    mov al, byte ptr[displacement]
	    mov ah, 0FFh
	  @@skip30:

	  div cx
	  cmp dl, 0Ah
	  jae @@abcdef_1
	  add dl, 030h
	  mov byte ptr[rm000b + 13 + di], dl
	  xor dx, dx
	  
	  jmp @@skip100
	  @@abcdef_1:
	  add dl, 037h
	  mov byte ptr[rm000b + 13 + di], dl
	  xor dx, dx
	  @@skip100:
	  
	  div cx
	  cmp dl, 0Ah
	  jae @@abcdef_2
	  add dl, 030h
	  mov byte ptr[rm000b + 12 + di], dl
	  xor dx, dx
	  
	  jmp @@skip101
	  @@abcdef_2:
	  add dl, 037h
	  mov byte ptr[rm000b + 12 + di], dl
	  xor dx, dx
	  @@skip101:

	  div cx
	  cmp dl, 0Ah
	  jae @@abcdef_3
	  add dl, 030h
	  mov byte ptr[rm000b + 11 + di], dl
	  xor dx, dx
	  
	  jmp @@skip102
	  @@abcdef_3:
	  add dl, 037h
	  mov byte ptr[rm000b + 11 + di], dl
	  xor dx, dx
	  @@skip102:

	  div cx
	  cmp dl, 0Ah
	  jae @@abcdef_4
	  add dl, 030h
	  mov byte ptr[rm000b + 10 + di], dl
	  xor dx, dx
	  
	  jmp @@skip103
	  @@abcdef_4:
	  add dl, 037h
	  mov byte ptr[rm000b + 10 + di], dl
	  xor dx, dx
	  @@skip103:

	  pop si
	  pop di
	  pop dx
	  pop cx
	  pop ax
ret

write_disp_mod01_new endp


write_disp_mod10_new proc near
call read_disp_2b
	      push ax
	      push cx
	      push dx
	      push di
		
		mov di, bx
		xor dx, dx
		mov ax, word ptr[displacement]
		mov cx, 0010h
		div cx
		mov byte ptr[rm000b + 13 + di], dl
		cmp dl, 0Ah
		jb @@below
		add byte ptr[rm000b + 13 + di], 037h
		
		jmp @@skip21
		@@below:
		add byte ptr[rm000b + 13 + di], 030h
		@@skip21:
		
		xor dx, dx
		div cx
		
		mov byte ptr[rm000b + 12 + di], dl
		cmp dl, 0Ah
		jb @@below_1
		add byte ptr[rm000b + 12 + di], 037h
		
		jmp @@skip22
		@@below_1:
		add byte ptr[rm000b + 12 + di], 030h
		@@skip22:

		xor dx, dx
		div cx
		
		mov byte ptr[rm000b + 11 + di], dl
		cmp dl, 0Ah
		jb @@below_2
		add byte ptr[rm000b + 11 + di], 037h
		
		jmp @@skip24
		@@below_2:
		add byte ptr[rm000b + 11 + di], 030h
		@@skip24:

		xor dx, dx
		div cx
		
		mov byte ptr[rm000b + 10 + di], dl
		cmp dl, 0Ah
		jb @@below_3
		add byte ptr[rm000b + 10 + di], 037h
		
		jmp @@skip23
		@@below_3:
		add byte ptr[rm000b + 10 + di], 030h
		@@skip23:
	      pop di
	      pop dx
	      pop cx
	      pop ax


ret
write_disp_mod10_new endp

print_data proc near

	  push ax
	  push dx
	  push cx
	  push dx
	  push si
	  xor si, si
	  xor dx, dx
	  
	  mov cx, 0010h
	  mov ax, word ptr[displacement]
	  
	  cmp byte ptr[dir_word + 1], 0
	  je @@one_byte
	  jmp @@cont
	  
	  @@one_byte:
	    mov si, 5
	    jmp @@one_byte_skip
	  @@cont:
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a
	  mov byte ptr[displacement_printable + 3], dl
	  add byte ptr[displacement_printable + 3], 037h
	  xor dx, dx
	  
	  
	  jmp @@skip9
	  @@if_below_a:
	  mov byte ptr[displacement_printable + 3], dl
	  add byte ptr[displacement_printable + 3], 030h
	  xor dx, dx
	  @@skip9:
	  
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a1
	  mov byte ptr[displacement_printable + 2], dl
	  add byte ptr[displacement_printable + 2], 037h
	  xor dx, dx

	  jmp @@skip10
	  @@if_below_a1:
	  mov byte ptr[displacement_printable + 2], dl
	  add byte ptr[displacement_printable + 2], 030h
	  xor dx, dx
	  @@skip10:
	  ;--------------------------------aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa

	  
	  cmp byte ptr[signed], 0FFh
	  je @@signed
	  
	  jmp @@cont2
	  @@signed:
	  
	  mov al, byte ptr[displacement]
	  shr al, 4
	  cmp al, 8
	  jb @@no_sign
	  mov byte ptr[displacement_printable + 1], 'F'
	  mov byte ptr[displacement_printable], 'F'

	  jmp @@cont1
	  @@no_sign:
	  mov byte ptr[displacement_printable + 1], '0'
	  mov byte ptr[displacement_printable], '0'
	  
	  jmp @@cont1
	  
	  @@cont2:
	  
	  @@one_byte_skip:
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a2
	  mov byte ptr[displacement_printable + 1 + si], dl
	  add byte ptr[displacement_printable + 1 + si], 037h
	  xor dx, dx

	  jmp @@skip11
	  @@if_below_a2:
	  mov byte ptr[displacement_printable + 1 + si], dl
	  add byte ptr[displacement_printable + 1 + si], 030h
	  xor dx, dx
	  @@skip11:
	  
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a3
	  mov byte ptr[displacement_printable + 0 + si], dl
	  add byte ptr[displacement_printable + 0 + si], 037h
	  xor dx, dx

	  jmp @@skip12
	  @@if_below_a3:
	  mov byte ptr[displacement_printable + 0 + si], dl
	  add byte ptr[displacement_printable + 0 + si], 030h
	  xor dx, dx
	  @@skip12:

	  @@cont1:
	  
	  xor ax, ax
	  mov ah, 09
	  lea dx, [displacement_printable + si]
	  int 21h
	  
	  pop si
	  pop dx
	  pop cx
	  pop dx
	  pop ax
ret
    
    print_data endp



    print_prog_ip proc near
    cmp byte ptr[string_op], 0FFh
    jne @@not_ret
    xor byte ptr[string_op], 0FFh
    ret
    @@not_ret:
	  push ax
	  push dx
	  push cx
	  push dx
	  xor dx, dx
	  
	  mov cx, 0010h
	  mov ax, word ptr[prog_ip]
	  div cx
	  
	  cmp dl, 0Ah
	  jb @@if_below_a
	  mov byte ptr[prog_ip_printable + 3], dl
	  add byte ptr[prog_ip_printable + 3], 037h
	  xor dx, dx
	  
	  
	  jmp @@skip9
	  @@if_below_a:
	  mov byte ptr[prog_ip_printable + 3], dl
	  add byte ptr[prog_ip_printable + 3], 030h
	  xor dx, dx
	  @@skip9:
	  
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a1
	  mov byte ptr[prog_ip_printable + 2], dl
	  add byte ptr[prog_ip_printable + 2], 037h
	  xor dx, dx

	  jmp @@skip10
	  @@if_below_a1:
	  mov byte ptr[prog_ip_printable + 2], dl
	  add byte ptr[prog_ip_printable + 2], 030h
	  xor dx, dx
	  @@skip10:
	  
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a2
	  mov byte ptr[prog_ip_printable + 1], dl
	  add byte ptr[prog_ip_printable + 1], 037h
	  xor dx, dx

	  jmp @@skip11
	  @@if_below_a2:
	  mov byte ptr[prog_ip_printable + 1], dl
	  add byte ptr[prog_ip_printable + 1], 030h
	  xor dx, dx
	  @@skip11:
	  
	  div cx
	  cmp dl, 0Ah
	  jb @@if_below_a3
	  mov byte ptr[prog_ip_printable + 0], dl
	  add byte ptr[prog_ip_printable + 0], 037h
	  xor dx, dx

	  jmp @@skip12
	  @@if_below_a3:
	  mov byte ptr[prog_ip_printable + 0], dl
	  add byte ptr[prog_ip_printable + 0], 030h
	  xor dx, dx
	  @@skip12:

  
	  
	  xor ax, ax
	  mov ah, 09
	  mov dx, offset prog_ip_printable
	  int 21h
	  
	  pop dx
	  pop cx
	  pop dx
	  pop ax

ret
    
    print_prog_ip endp

    atverkFaila proc near
        ; dx - failo vardo adresas
        ; CF yra 1 jeigu klaida 
        push ax
        push dx

        mov ah, 3Dh
        mov al, 00h       ; skaitymui
        int 21h

        jc @@pab
        mov word ptr skaitomasFailas, ax

        @@pab:  
        pop dx
        pop ax
        ret   
  
    atverkFaila endp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    uzdarykFaila proc near
        ; dx - failo vardo adresas
        ; CF yra 1 jeigu klaida 
        push ax
        push bx

        mov ah, 3Eh
        int 21h

        @@pab:  
        pop dx
        pop ax
        ret     
    uzdarykFaila endp

   konvertuokI16taine proc near
        ; al - baitas
        ; ax - rezultatas
        mov ah, al
        and ah, 0F0h
        shr ah, 1
        shr ah, 1
        shr ah, 1
        shr ah, 1
        and al, 0Fh

        cmp al, 09
        jle @@plius0
        sub al, 10
        add al, 'A'
        jmp @@AH
        @@plius0:
        add al, '0'
        @@AH:
             
        cmp ah, 09
        jle @@darplius0
        sub ah, 10
        add ah, 'A'
        jmp @@pab
        @@darplius0:
        add ah, '0'
        @@pab:
        xchg ah, al 
        ret     
    konvertuokI16taine endp
    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3d 00 111 101
read_disp_2b proc near

    push ax
    push cx
    push dx
    push si
    push bx
    mov bx, word ptr[file_pointer]
	xor si, si
	xor ax, ax
	
	mov si, dx
	mov ah, 3Fh
	      mov cx, 2
	      mov si, dx
	      xor ax, ax
	      mov ah, 3Fh
	      int 21h
	      add word ptr[prog_ip], 2
	      mov ax, word ptr[si]
	      mov word ptr[displacement], ax
	
    pop bx
    pop si
    pop dx
    pop cx
    pop ax
    ret
read_disp_2b endp

read_disp_1b proc near

    push ax
    push cx
    push dx
    push si
    push bx
    mov bx, word ptr[file_pointer]

	xor ax, ax
	mov si, dx
	mov ah, 3Fh
	      mov cx, 1
	      mov si, dx
	      xor ax, ax
	      mov ah, 3Fh
	      int 21h
	      inc word ptr[prog_ip]
	      mov al, byte ptr[si]
	      mov byte ptr[displacement], al
	
    pop bx
    pop si
    pop dx
    pop cx
    pop ax
    ret
read_disp_1b endp


address_byte_analysis proc near  ; 00 010 010

         mov ah, 3Fh
         int 21h
         inc word ptr[prog_ip]
         push ax
         push cx
	    mov al, byte ptr[si]
	    mov cl, 8
	    div cl
	    mov byte ptr[adr_rm], ah
	    xor ah, ah
	    div cl
	    mov byte ptr[adr_reg], ah
	    xor ah, ah
	    mov byte ptr[adr_mod], al
         pop cx
         pop ax
         cmp byte ptr[dont_care], 0FFh
         jne @@care
         jmp @@cont
         
         @@care:
         cmp byte ptr[ext_opcode_flag], 0FFh
         je @@complete_write
         jmp @@cont
         
         @@complete_write:
         push ax
	      mov al, byte ptr[adr_reg]
	      mov byte ptr[full_opcode], al
	      cmp word ptr[full_opcode], 0C700h
	      je @@mov
	      jmp @@cont1
	      
	      @@mov:
		writeln_non move
		jmp @@end
	      @@cont1:
	      
	      cmp word ptr[full_opcode], 0C600h
	      je @@mov
	      @@cont2:
	      
	      cmp word ptr[full_opcode], 0FF06h
	      jne @@cont3
	      writeln_non strpush
	      jmp @@end
	      
	      @@cont3:
	      cmp word ptr[full_opcode], 08F00h
	      jne @@cont4
	      writeln_non strpop
	      jmp @@end
	      
	      @@cont4:
	      cmp word ptr[full_opcode], 08000h
	      je @@cont8
	      cmp word ptr[full_opcode], 08100h
	      je @@cont8
	      cmp word ptr[full_opcode], 08200h
	      je @@cont8
	      cmp word ptr[full_opcode], 08300h
	      je @@cont8

	      jmp @@cont5
	      @@cont8:
	      writeln_non stradd
	      jmp @@end
	      
	      @@cont5: 
	      cmp word ptr[full_opcode], 08002h
	      je @@cont7
	      cmp word ptr[full_opcode], 08102h
	      je @@cont7
	      cmp word ptr[full_opcode], 08202h
	      je @@cont7
	      cmp word ptr[full_opcode], 08302h
	      je @@cont7
	      jmp @@cont6
	      
	      @@cont7:
	      writeln_non stradc
	      jmp @@end
	      
	      @@cont6:
	      
	      cmp word ptr[full_opcode], 0FE00h
	      je @@cont9
	      cmp word ptr[full_opcode], 0FF00h
	      je @@cont9
	      jmp @@cont10
	      
	      @@cont9:
	      writeln_non strinc
	      jmp @@end
	      
	      @@cont10:
	      
	      cmp word ptr[full_opcode], 08005h
	      je @@cont11
	      cmp word ptr[full_opcode], 08105h
	      je @@cont11
	      cmp word ptr[full_opcode], 08205h
	      je @@cont11
	      cmp word ptr[full_opcode], 08305h
	      je @@cont11
	      jmp @@cont12
	      
	      @@cont11:
	      writeln_non strsub
	      jmp @@end
	      
	      @@cont12:

	      cmp word ptr[full_opcode], 08003h
	      je @@cont13
	      cmp word ptr[full_opcode], 08103h
	      je @@cont13
	      cmp word ptr[full_opcode], 08203h
	      je @@cont13
	      cmp word ptr[full_opcode], 08303h
	      je @@cont13
	      jmp @@cont14

	      @@cont13:
	      writeln_non strsbb
	      jmp @@end
	      
	      @@cont14:
	      
	      cmp word ptr[full_opcode], 0FE01h
	      je @@cont15
	      cmp word ptr[full_opcode], 0FF01h
	      je @@cont15
	      jmp @@cont16
	      
	      @@cont15:
	      writeln_non strdec
	      jmp @@end
	      
	      @@cont16:
	      cmp word ptr[full_opcode], 0F603h
	      je @@cont17
	      cmp word ptr[full_opcode], 0F703h
	      je @@cont17
	      jmp @@cont18
	      
	      @@cont17:
	      writeln_non strneg
	      jmp @@end

	      @@cont18:
	      
	      cmp word ptr[full_opcode], 08007h
	      je @@cont19
	      cmp word ptr[full_opcode], 08107h
	      je @@cont19
	      cmp word ptr[full_opcode], 08207h
	      je @@cont19
	      cmp word ptr[full_opcode], 08307h
	      je @@cont19
	      jmp @@cont20
	      
	      @@cont19:
	      writeln_non strcmp
	      jmp @@end
	      @@cont20:
	      
	      cmp word ptr[full_opcode], 0F604h
	      je @@cont21
	      cmp word ptr[full_opcode], 0F704h
	      je @@cont21
	      jmp @@cont22

	      @@cont21:
	      writeln_non strmul
	      jmp @@end
	      @@cont22:
	      
	      cmp word ptr[full_opcode], 0F605h
	      je @@cont23
	      cmp word ptr[full_opcode], 0F705h
	      je @@cont23
	      jmp @@cont24

	      @@cont23:
	      writeln_non strimul
	      jmp @@end
	      @@cont24:
	      
	      cmp word ptr[full_opcode], 0F606h
	      je @@cont25
	      cmp word ptr[full_opcode], 0F706h
	      je @@cont25
	      jmp @@cont26

	      @@cont25:
	      writeln_non strdiv
	      jmp @@end
	      @@cont26:
	      
	      cmp word ptr[full_opcode], 0F607h
	      je @@cont27
	      cmp word ptr[full_opcode], 0F707h
	      je @@cont27
	      jmp @@cont28

	      @@cont27:
	      writeln_non stridiv
	      jmp @@end
	      @@cont28:

	      cmp word ptr[full_opcode], 0F602h
	      je @@cont29
	      cmp word ptr[full_opcode], 0F702h
	      je @@cont29
	      jmp @@cont30

	      @@cont29:
	      writeln_non strnot
	      jmp @@end
	      @@cont30:

	      cmp word ptr[full_opcode], 0D004h
	      je @@shl
	      cmp word ptr[full_opcode], 0D104h
	      je @@shl
	      cmp word ptr[full_opcode], 0D204h
	      je @@shl
	      cmp word ptr[full_opcode], 0D304h
	      je @@shl

	      jmp @@not_shl

	      @@shl:
	      writeln_non strshl	      
	      jmp @@end
	      @@not_shl:

	      cmp word ptr[full_opcode], 0D005h
	      je @@shr
	      cmp word ptr[full_opcode], 0D105h
	      je @@shr
	      cmp word ptr[full_opcode], 0D205h
	      je @@shr
	      cmp word ptr[full_opcode], 0D305h
	      je @@shr

	      jmp @@not_shr

	      @@shr:
	      writeln_non strshr	      
	      jmp @@end
	      @@not_shr:

	      cmp word ptr[full_opcode], 0D007h
	      je @@sar
	      cmp word ptr[full_opcode], 0D107h
	      je @@sar
	      cmp word ptr[full_opcode], 0D207h
	      je @@sar
	      cmp word ptr[full_opcode], 0D307h
	      je @@sar

	      jmp @@not_sar

	      @@sar:
	      writeln_non strsar	      
	      jmp @@end
	      @@not_sar:

	      cmp word ptr[full_opcode], 0D000h
	      je @@rol
	      cmp word ptr[full_opcode], 0D100h
	      je @@rol
	      cmp word ptr[full_opcode], 0D200h
	      je @@rol
	      cmp word ptr[full_opcode], 0D300h
	      je @@rol

	      jmp @@not_rol

	      @@rol:
	      writeln_non strrol	      
	      jmp @@end
	      @@not_rol:

	      cmp word ptr[full_opcode], 0D001h
	      je @@ror
	      cmp word ptr[full_opcode], 0D101h
	      je @@ror
	      cmp word ptr[full_opcode], 0D201h
	      je @@ror
	      cmp word ptr[full_opcode], 0D301h
	      je @@ror

	      jmp @@not_ror

	      @@ror:
	      writeln_non strror	      
	      jmp @@end
	      @@not_ror:

	      cmp word ptr[full_opcode], 0D002h
	      je @@rcl
	      cmp word ptr[full_opcode], 0D102h
	      je @@rcl
	      cmp word ptr[full_opcode], 0D202h
	      je @@rcl
	      cmp word ptr[full_opcode], 0D302h
	      je @@rcl

	      jmp @@not_rcl

	      @@rcl:
	      writeln_non strrcl	      
	      jmp @@end
	      @@not_rcl:

	      cmp word ptr[full_opcode], 0D003h
	      je @@rcr
	      cmp word ptr[full_opcode], 0D103h
	      je @@rcr
	      cmp word ptr[full_opcode], 0D203h
	      je @@rcr
	      cmp word ptr[full_opcode], 0D303h
	      je @@rcr

	      jmp @@not_rcr

	      @@rcr:
	      writeln_non strrcr	      
	      jmp @@end
	      @@not_rcr:

	      cmp word ptr[full_opcode], 08004h
	      je @@and
	      cmp word ptr[full_opcode], 08104h
	      je @@and

	      jmp @@not_and

	      @@and:
	      writeln_non strand	      
	      jmp @@end
	      @@not_and:
	      
	      cmp word ptr[full_opcode], 0F600h
	      je @@test
	      cmp word ptr[full_opcode], 0F700h
	      je @@test

	      jmp @@not_test

	      @@test:
	      writeln_non strtest
	      mov byte ptr[skip_immediate], 0      
	      jmp @@end
	      @@not_test:

	      cmp word ptr[full_opcode], 08001h
	      je @@or
	      cmp word ptr[full_opcode], 08101h
	      je @@or
	      cmp word ptr[full_opcode], 08201h
	      je @@or
	      cmp word ptr[full_opcode], 08301h
	      je @@or

	      jmp @@not_or

	      @@or:
	      writeln_non stror	    
	      mov byte ptr[skip_immediate], 0        
	      jmp @@end
	      @@not_or:

	      cmp word ptr[full_opcode], 08006h
	      je @@xor
	      cmp word ptr[full_opcode], 08106h
	      je @@xor
	      cmp word ptr[full_opcode], 08206h
	      je @@xor
	      cmp word ptr[full_opcode], 08306h
	      je @@xor

	      jmp @@not_xor

	      @@xor:
	      writeln_non strxor	
	      mov byte ptr[skip_immediate], 0            
	      jmp @@end
	      @@not_xor:

	      cmp word ptr[full_opcode], 0FF02h
	      je @@call

	      jmp @@not_call

	      @@call:
	      writeln_non strcall	
	      ;mov byte ptr[skip_immediate], 0            
	      jmp @@end
	      @@not_call:

	      cmp word ptr[full_opcode], 0FF03h
	      je @@callfar

	      jmp @@not_callfar

	      @@callfar:
	      writeln_non strcallfar	
	      ;mov byte ptr[skip_immediate], 0            
	      jmp @@end
	      @@not_callfar:

	      cmp word ptr[full_opcode], 0FF04h
	      je @@jmp

	      jmp @@not_jmp

	      @@jmp:
	      writeln_non strjmp	
	      ;mov byte ptr[skip_immediate], 0            
	      jmp @@end
	      @@not_jmp:

	      cmp word ptr[full_opcode], 0FF05h
	      je @@farjmp

	      jmp @@not_farjmp

	      @@farjmp:
	      writeln_non strfarjmp	
	      ;mov byte ptr[skip_immediate], 0            
	      jmp @@end
	      @@not_farjmp:


	      
	      @@end:
	      mov word ptr[full_opcode], 0
	 pop ax
         @@cont:
         
         mov al, byte ptr [adr_mod]
         xor ah, ah
         
         cmp al, 0
         je mod_eq_0
         jmp skip1
         
         mod_eq_0:
	 
	 call analysis_mod00
	 jmp skip4
	    skip1:
	    
	    mov al, byte ptr [adr_mod]
	    cmp al, 1
	    je mod_eq_1
	    jmp skip2
	    
		mod_eq_1:
		
		call analysis_mod01_new
		jmp skip4
		skip2:
    
		mov al, byte ptr [adr_mod]
		cmp al, 2
		je mod_eq_2
		jmp skip3
		
		    mod_eq_2:

		    call analysis_mod01_new ; ta pati procedura mod10 ir mod01
		    jmp skip4
		    skip3:

		      mov al, byte ptr [adr_mod]
		      cmp al, 3
		      je mod_eq_3
		      jmp skip4
		      
		      mod_eq_3:
		      call analysis_mod11_new
		      skip4:

	    
	    
  ret
address_byte_analysis endp

which_reg proc near
push ax
push dx
push bx
push cx
push di
  xor di, di
  xor bx, bx
      shl al, 4
      shl al, 1
      mov byte ptr[dir_word + 1], 0
      adc byte ptr[dir_word + 1], 0
      shr al, 5

	    xor di, di
	    cmp byte ptr[dir_word + 1], 1
	    je @@word_di
	    jne @@cont
	    
	    @@word_di:
	    	mov di, 8
	    @@cont:
	    
	    xor cx, cx
    
    	    jmp @@loop
	    @@return:
	    mov cx, 0008h
	    
	    @@loop:
	      cmp al, cl
	      je @@if_eq
	      jmp @@end
	      @@if_eq:
		push bx
		    add di, cx
		    mov bl, byte ptr [reg_table + di]
		    lea di, [reg000b + bx]
		    writeln_non di
		    writeln_non comma
		pop bx
	      @@end:
	    jcxz @@return
	    loop @@loop
      
call immediate_or_other
writeln_non naujaEilute
pop di
pop cx
pop bx  
pop dx
pop ax
ret
which_reg endp

print_char proc near
push ax
push dx
    xor ax, ax
    mov ah, 02h
    int 21h
pop dx
pop ax
ret
print_char endp

;;;;;;;;;;;;;;;;;;;;;;;;;;11 111 010;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    analizuokKoda proc near
         
         push bx
         push ax
         push si
         push cx
         push di
	 push dx
         mov word ptr[file_pointer], bx

	  cmp al, 088h
	  jb @@mov_var2
	  cmp al, 08Bh
	  ja @@mov_var2
         
         writeln_non move
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         ;--------------------------
	
         
         @@mov_var2:
         cmp al, 0C7h
         jne @@mov_var2_2
         @@aux6:
         mov byte ptr[ext_opcode_flag], 0FFh
         call write_direction_and_word_bits
         mov byte ptr[full_opcode + 1], al
         call address_byte_analysis
         
         xor byte ptr[ext_opcode_flag], 0FFh
         jmp @@pab
         
         
         @@mov_var2_2:
         cmp al, 0C6h
         jne @@mov_var3
         mov byte ptr[ext_opcode_flag], 0FFh
         call write_direction_and_word_bits
         mov byte ptr[full_opcode + 1], al
         call address_byte_analysis
         
         xor byte ptr[ext_opcode_flag], 0FFh
         
         jmp @@pab
         
         
         @@mov_var3:

   cmp al, 0B0h
   jb @@mov_var4
   cmp al, 0BFh
   ja @@mov_var4
         
         @@cont5:
         writeln_non move
         call which_reg
         jmp @@pab
         
         @@mov_var4:
         cmp al, 0A1h
         jne @@mov_var5
         jmp @@cont
         @@mov_var5:
	    cmp al, 0A0h
	    je @@cont
	    jmp @@mov_var6
         @@cont:
         writeln_non move
         call write_direction_and_word_bits
         cmp byte ptr[dir_word + 1], 1
         je @@is_word
         jmp @@is_byte
         
         @@is_word:
	    writeln_non reg000w
	    jmp @@not_byte
         @@is_byte:
	    writeln_non reg000b
	 @@not_byte:
	    writeln_non comma
	    mov byte ptr[dir_word + 1], 1
	    mov dl, '['
	    call print_char
	    call immediate_or_other
	    mov dl, ']'
	    call print_char
	    writeln_non naujaEilute
         jmp @@pab
         
         @@mov_var6:
         cmp al, 0A2h
         jne @@mov_var7
         jmp @@cont1
         @@mov_var7:
	    cmp al, 0A3h
	    je @@cont1
	    jmp @@mov_var8
         @@cont1:
         writeln_non move
         call write_direction_and_word_bits
         cmp byte ptr[dir_word + 1], 1
         je @@is_word1
         jmp @@is_byte1
         
         @@is_word1:
	    mov byte ptr[dir_word + 1], 1
	    mov dl, '['
	    call print_char
	    call immediate_or_other
	    mov dl, ']'
	    call print_char
	    writeln_non comma
	    writeln reg000w

         jmp @@pab

         
         @@is_byte1:
	    mov byte ptr[dir_word + 1], 1
	    mov dl, '['
	    call print_char
	    call immediate_or_other
	    mov dl, ']'
	    call print_char
	    writeln_non comma
	    writeln reg000b
	 jmp @@pab
	 
	 @@mov_var8:
	 cmp al, 08Ch
	 jne @@mov_var9
	 jmp @@cont2
	 @@mov_var9:
	 cmp al, 08Eh
	 jne @@push
	 
	 ; segment SEGMENT segment SEGMENT segment SEGMENT segment SEGMENT segment SEGMENT 
	 @@cont2:
	 mov byte ptr[ext_opcode_flag], 1
	 writeln_non move
	 call write_direction_and_word_bits
	 call address_byte_analysis
	 
	 xor byte ptr[ext_opcode_flag], 1
	 jmp @@pab
	 
	 
	 @@push:
         cmp al, 0FFh
         jne @@push1
         mov byte ptr[skip_immediate], 0FFh
         mov byte ptr[ext_opcode_flag], 0FFh
         call write_direction_and_word_bits
         mov byte ptr[dir_word], 0
         mov byte ptr[full_opcode + 1], al
         call address_byte_analysis
         xor byte ptr[ext_opcode_flag], 0FFh
         xor byte ptr[skip_immediate], 0FFh
         jmp @@pab
         
         @@push1:
         
         cmp al, 050h
         jb @@push2
         cmp al, 057h
         ja @@push2
         
	 
         @@cont6:
         writeln_non strpush
         push cx
         push ax
         push si
         push di
         push bx
	    shl al, 5
	    shr al, 5
	   xor cx, cx
	   xor bx, bx
	   jmp @@loop
         @@return:
         mov cx, 7
         @@loop:
	    cmp al, cl
	    je @@if_eq
	    jmp @@end
	    @@if_eq:
	    mov di, cx
	    mov bl, byte ptr[reg_table + di]
	    lea si, [reg000w + bx]
	    writeln si
         @@end:
         jcxz @@return
         loop @@loop
         
         pop bx
         pop di
         pop si
         pop ax
         pop cx
         jmp @@pab
         
         @@push2:
         cmp al, 06h
	 je @@cont7
	 cmp al, 01Eh
	 je @@cont7
	 cmp al, 0Eh
	 je @@cont7
	 cmp al, 016h
         je @@cont7
         jmp @@pop
         
         @@cont7:
         cmp byte ptr[full_opcode], 0
         jne @@pop
         writeln_non strpush;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         push cx
         push ax
         push si
         push di
         push bx
	    shr al, 3
	   xor cx, cx
	   xor bx, bx
	   jmp @@loop1
         @@return1:
         mov cx, 4
         @@loop1:
	    cmp al, cl
	    je @@if_eq1
	    jmp @@end1
	    @@if_eq1:
	    mov di, cx
	    mov bl, byte ptr[reg_table + 16 + di]
	    lea si, [reg000b + bx]
	    writeln si
         @@end1:
         jcxz @@return1
         
         loop @@loop1
         
         pop bx
         pop di
         pop si
         pop ax
         pop cx
	 jmp @@pab
         
         
         @@pop:
         cmp al, 08Fh
         je @@is_pop
         jmp @@pop1
         
         @@is_pop:
         mov byte ptr[skip_immediate], 0FFh
         mov byte ptr[ext_opcode_flag], 0FFh
         call write_direction_and_word_bits
         mov byte ptr[full_opcode + 1], al
         call address_byte_analysis
         
         
         xor byte ptr[ext_opcode_flag], 0FFh
         xor byte ptr[skip_immediate], 0FFh

	 jmp @@pab
	  
         @@pop1:
         cmp al, 058h
         jb @@pop3
         cmp al, 05Fh
         ja @@pop3
         
         writeln_non strpop
         
         @@aux:
         push cx
         push di
         push si
         push di
         push bx
         xor bx, bx
         xor si, si
         shl al, 5
         shr al, 5
         xor cx, cx
         jmp @@loop2
         
         @@return2:
         
         mov cx, 7
         
         @@loop2:
         cmp al, cl
         je @@if_eq2
         jmp @@end_loop
         
         @@if_eq2:
	    mov si, cx
	    mov bl, [reg_table + 8 + si]
	    lea di, [reg000b + bx]
	    writeln di
         
         @@end_loop:
	  jcxz @@return2
         
         loop @@loop2
         
         pop bx
         pop di
         pop si
         pop di
         pop cx
         jmp @@pab
         
         @@pop3:
         cmp al, 07h
         je @@cont4
         cmp al, 017h
         je @@cont4
         cmp al, 01Fh
         je @@cont4
	 jmp @@xchg1
	 
         @@cont4:
         writeln_non strpop
         push cx
         push di
         push si
         push di
         push bx
         xor bx, bx
         xor si, si
         shr al, 3
         xor cx, cx
         jmp @@loop3
         
         @@return3:
         
         mov cx, 4
         
         @@loop3:
         cmp al, cl
         je @@if_eq3
         jmp @@end_loop3
         
         @@if_eq3:
	    mov si, cx
	    mov bl, [reg_table + 16 + si]
	    lea di, [reg000b + bx]
	    writeln di
         
         @@end_loop3:
	  jcxz @@return3
         
         loop @@loop3
         
         pop bx
         pop di
         pop si
         pop di
         pop cx
         jmp @@pab
         
         @@xchg1:
         cmp al, 086h
         je @@cont07
         cmp al, 087h
         je @@cont07
         jmp @@xchg2
         
         @@cont07:
         
         writeln_non strxchg
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab

         
         @@xchg2:
         cmp al, 090h
         jne @@skip
         writeln strnop
         jmp @@pab
         
         @@skip:
         
         cmp al, 091h
         jb @@in1
         cmp al, 097h
         ja @@in1
         writeln_non strxchg
         writeln_non reg000w
         writeln_non comma
         jmp @@aux
         
         @@in1:
         cmp al, 0E4h
         je @@kont
         cmp al, 0E5h
         je @@kont
         jmp @@in2
         
         @@kont:
         writeln_non strin
         call write_direction_and_word_bits
         cmp byte ptr[dir_word + 1], 1
         jne @@byte
         writeln_non reg000w
         writeln_non comma
         jmp @@kont1
         @@byte:
         writeln_non reg000b
         writeln_non comma
	 @@kont1:
	 mov byte ptr[dir_word + 1], 0
	 call immediate_or_other
	 writeln_non naujaEilute
	 jmp @@pab
         
         @@in2:
         cmp al, 0ECh
         je @@kont2
         cmp al, 0EDh
         je @@kont2
         jmp @@out1
         
         @@kont2:
         writeln_non strin
         call write_direction_and_word_bits
         
         cmp byte ptr[dir_word + 1], 1
         jne @@byte1
         writeln_non reg000w
         writeln_non comma
         writeln reg010w
         jmp @@pab
         @@byte1:
         writeln_non reg000b
         writeln_non comma
         writeln reg010w
	 jmp @@pab
         
         @@out1:
         cmp al, 0E6h
         je @@kont3
         cmp al, 0E7h
         je @@kont3
         jmp @@out2
         
         @@kont3:
         writeln_non strout
	 mov byte ptr[dir_word + 1], 0
         call immediate_or_other
         writeln_non comma
         call write_direction_and_word_bits
         cmp byte ptr[dir_word + 1], 1
         jne @@byte4
         writeln reg000w
         jmp @@kont4
         @@byte4:
         writeln reg000b
	 @@kont4:
	 jmp @@pab

         
         @@out2:
         cmp al, 0EEh
         jne @@CF?
         jmp @@kont5
         
         @@CF?:
         cmp al, 0EFh
         je @@kont5
         jmp @@xlat
         
         @@kont5:
         writeln_non strout
         writeln_non reg010w
         writeln_non comma
         call write_direction_and_word_bits
         cmp byte ptr[dir_word + 1], 1
         jne @@is_al
         writeln reg000w
         jmp @@pab
         
         @@is_al:
         writeln reg000b
         jmp @@pab
         
         @@xlat:
         cmp al, 0D7h
         jne @@lea
         writeln strxlat
         jmp @@pab
         
         @@lea:
         cmp al, 08Dh
         jne @@lds
         writeln_non strlea
         mov byte ptr[dir_word], 1
         mov byte ptr[dir_word + 1], 1
         call address_byte_analysis
         jmp @@pab
         
         @@lds:
         cmp al, 0C5h
         jne @@les
         writeln_non strlds
         mov byte ptr[dir_word], 1
         mov byte ptr[dir_word + 1], 1
         call address_byte_analysis
         jmp @@pab
	
	 @@les:
         cmp al, 0C4h
         jne @@lahf
         writeln_non strles
         
         
         mov byte ptr[dir_word], 1
         mov byte ptr[dir_word + 1], 1
         call address_byte_analysis
         jmp @@pab

         @@lahf:
         cmp al, 09Fh
         jne @@sahf
         writeln strlahf
         jmp @@pab
         
         @@sahf:
         cmp al, 09Eh
         jne @@pushf
         writeln strsahf
         jmp @@pab
 
         @@pushf:
         cmp al, 09Ch
         jne @@popf
         writeln strpushf
         jmp @@pab
 
         @@popf:
         cmp al, 09Dh
         jne @@add
         writeln strpopf
         jmp @@pab
 
	 @@add:
	 cmp al, 3
	 ja @@add2
	 writeln_non stradd
	 call write_direction_and_word_bits
	 call address_byte_analysis
	 jmp @@pab
	 
	 @@add2:
	 cmp al, 080h
	 jb @@add3
	 cmp al, 083h
	 ja @@add3
	 @@aux2:
	 mov byte ptr[ext_opcode_flag], 0FFh
	 mov byte ptr[full_opcode + 1], al
	 call write_direction_and_word_bits
	 mov byte ptr[dir_word], 0
	 shr al, 1
	 shr al, 1
	 jc @@signed
	 jnc @@not_signed
	 
	 @@signed:
	 mov byte ptr[signed], 0FFh
	 @@not_signed:

	 call address_byte_analysis

	 mov byte ptr[signed], 0
	 xor byte ptr[ext_opcode_flag], 0FFh
	 jmp @@pab
	 
	 @@add3:
	 cmp al, 04h
	 je @@kont8
	 cmp al, 05h
	 je @@kont8
	 jmp @@adc
	 
	 @@kont8:
	 writeln_non stradd
	 @@aux3:
	 call write_direction_and_word_bits
	 cmp byte ptr[dir_word + 1], 1
	 je @@word
	 jne @@not_word
	 
	 @@word:
	 writeln_non reg000w
	 writeln_non comma
	 jmp @@kont9
	 @@not_word:
	 writeln_non reg000b
	 writeln_non comma
         
         @@kont9:
         call immediate_or_other
         writeln_non naujaEilute
         jmp @@pab
         
         @@adc:
         cmp al, 010h
         jb @@adc1
         cmp al, 013h
         ja @@adc1
        
	 writeln_non stradc
	 call write_direction_and_word_bits
	 call address_byte_analysis
	 jmp @@pab
	 
	 @@adc1:
	 
	 cmp al, 080h
	 jb @@adc2
	 cmp al, 083h
	 ja @@adc2
	 jmp @@aux2
         
         @@adc2:
	 cmp al, 014h
	 je @@kont11
	 cmp al, 015h
	 je @@kont11
	 jmp @@inc
	 
	 @@kont11:
	 writeln_non stradc
	 jmp @@aux3
	 
         @@inc:
         
         cmp al, 0FEh
         je @@kont12
         cmp al, 0FFh
         je @@kont12
         jmp @@inc2
         
         @@kont12:
         call write_direction_and_word_bits
         mov byte ptr[ext_opcode_flag], 0FFh
         mov byte ptr[full_opcode + 1], al
         mov byte ptr[skip_immediate], 0FFh
         call address_byte_analysis
         xor byte ptr[ext_opcode_flag], 0FFh
         xor byte ptr[skip_immediate], 0FFh
	 jmp @@pab
         
         @@inc2:
         cmp al, 040h
         jb @@sub
         cmp al, 047h
         ja @@sub
         
         writeln_non strinc
         
         @@aux5:
         
         push ax
         push cx
         push bx
         push di
         push si
         shl al, 5
         shr al, 5
	 xor cx, cx

         jmp @@inc_loop
         
         @@inc_return:
         mov cx, 7
         
         @@inc_loop:
         xor bx, bx
         cmp al, cl
         je @@inc_eq
         jmp @@inc_end
         
         @@inc_eq:
         mov di, cx
         mov bl, [reg_table + 8 +  di]
         lea di, [reg000b + bx]
         writeln di
         
         @@inc_end:
         jcxz @@inc_return
         
         loop @@inc_loop
         pop si
         pop di
         pop bx
         pop cx
         pop ax
         jmp @@pab
         
         
         @@sub:
         cmp al, 028h
         jb @@sub2
         cmp al, 02Bh
         ja @@sub2
         
         writeln_non strsub
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@sub2:
         cmp al, 080h
         jb @@sub3
         cmp al, 083h
         ja @@sub3
         
         jmp @@aux2
         
         @@sub3:
         
         cmp al, 02Ch
         je @@kont13
         cmp al, 02Dh
         je @@kont13
         jmp @@sbb
         
         @@kont13:
         
         jmp @@aux3
         
         @@sbb:
         
         cmp al, 018h
         jb @@sbb2
         cmp al, 01Bh
         ja @@sbb2
         
         writeln_non strsbb
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@sbb2:
         
         cmp al, 080h
         jb @@sbb3
         cmp al, 083h
         ja @@sbb3
         
         jmp @@aux2
         
         @@sbb3:
         
         cmp al, 01Ch
         je @@kont14
         cmp al, 01Dh
         je @@kont14
         jmp @@dec
         
         @@kont14:
         
         writeln_non strsbb
         
         jmp @@aux3
         
         @@dec:
         
         cmp al, 0FFh
         je @@kont15
         cmp al, 0FEh
         je @@kont15
         jmp @@dec2
         @@kont15:
         
         jmp @@kont12
         
         
         @@dec2:
         cmp al, 048h
         jb @@neg
         cmp al, 04Fh
         ja @@neg
         
         writeln_non strdec
         
         jmp @@aux5
         
         @@neg:
         
         cmp al, 0F6h
         je @@is_neg
         cmp al, 0F7h
         je @@is_neg
         jmp @@cmp
         
         @@is_neg:

         jmp @@kont12
         
         @@cmp:
         
         cmp al, 038h
         jb @@cmp2
         cmp al, 03Bh
         ja @@cmp2
         
         writeln_non strcmp
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@cmp2:
         
         cmp al, 080h
         jb @@cmp3
         cmp al, 083h
         ja @@cmp3
         
         jmp @@aux2
         
         @@cmp3:
         
         cmp al, 03Ch
         je @@is_cmp
         cmp al, 03Dh
         je @@is_cmp
         jmp @@aaa
         @@is_cmp:
         
         writeln_non strcmp
         jmp @@aux3
         
         @@aaa:
         cmp al, 037h
         jne @@baa
         writeln straaa
         jmp @@pab
         
         @@baa:
         cmp al, 027h
         jne @@aas
         writeln strbaa
         jmp @@pab
         
         @@aas:
         cmp al, 03Fh
         jne @@das
         writeln straas
         jmp @@pab
         
         @@das:
         cmp al, 02Fh
         jne @@aam
         writeln strdas
         jmp @@pab
         
         @@aam:
         cmp al, 0D5h
         je @@is_aad
         cmp al, 0D4h
         je @@is_aam
         jmp @@cbw
     
         @@is_aam:
         writeln_non straam
         mov dl, ' '
         call print_char
         mov byte ptr[dir_word + 1], 0
         call immediate_or_other
         writeln_non naujaEilute
         jmp @@pab
         
         @@is_aad:
         writeln_non straad
         mov dl, ' '
         call print_char
         mov byte ptr[dir_word + 1], 0
         call immediate_or_other
         writeln_non naujaEilute

         jmp @@pab
                 
         @@cbw:
         cmp al, 098h
         jne @@cwd
         writeln strcbw
         jmp @@pab
         
         @@cwd:
         cmp al, 099h
         jne @@salc
         writeln strcwd
         jmp @@pab
         
         @@salc:
         cmp al, 0D6h
         jne @@shifts
         writeln strsalc
         jmp @@pab
         
         @@shifts:
         cmp al, 0D0h
         jb @@and
         cmp al, 0D3h
         ja @@and
         
	 mov byte ptr[ext_opcode_flag], 0FFh
	 mov byte ptr[full_opcode + 1], al
	 mov byte ptr[skip_immediate], 0FFh
	 mov byte ptr[no_newline], 0FFh
	 call write_direction_and_word_bits

	 call address_byte_analysis
	 mov al, byte ptr[full_opcode + 1]
	 shr al, 1
	 shr al, 1
	 jc @@count_cl
	 jnc @@count_one
	 
	 @@count_one:
	 writeln_non comma
	 mov dl, '1'
	 call print_char
	 jmp @@end_shift
	 
	 @@count_cl:
	 writeln_non comma
	 writeln_non reg001b
	 
	 @@end_shift:
	 writeln_non naujaEilute

	 xor byte ptr[no_newline], 0FFh
	 xor byte ptr[ext_opcode_flag], 0FFh
	 xor byte ptr[skip_immediate], 0FFh
	 jmp @@pab

         @@and:
         cmp al, 020h
         jb @@and2
         cmp al, 023h
         ja @@and2
         writeln_non strand
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@and2:
         cmp al, 080h
         je @@is_and
         cmp al, 081h
         je @@is_and
         jmp @@and3
         
         @@is_and:
         jmp @@aux6
         
         @@and3:
         cmp al, 024h
         je @@is_and3
         cmp al, 025h
         je @@is_and3
         jmp @@test
         @@is_and3:
         writeln_non strand
         jmp @@aux3
         
         @@test:
         cmp al, 084h
         je @@is_test
         cmp al, 085h
         je @@is_test
         jmp @@test2
         @@is_test:
         writeln_non strtest
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@test2:
         cmp al, 0F6h
         je @@is_test2
         cmp al, 0F7h
         je @@is_test2
         jmp @@test3
         @@is_test2:

         jmp @@aux2
         
         
         @@test3:
         cmp al, 0A8h
         je @@is_test3
         cmp al, 0A9h
         je @@is_test3
         jmp @@or
         @@is_test3:
         writeln_non strtest
         jmp @@aux3
         
         @@or:
         cmp al, 008h
         jb @@or3
         cmp al, 00Bh
         ja @@or3
         writeln_non stror
         mov byte ptr[skip_immediate], 0
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab
         
         @@or3:
         
         cmp al, 0Ch
         je @@is_or3
         cmp al, 0Dh
         je @@is_or3
         jmp @@xor
         @@is_or3:
         writeln_non stror
         jmp @@aux3
         
         @@xor:
         cmp al, 030h
         jb @@xor3
         cmp al, 033h
         ja @@xor3
         writeln_non strxor
         call write_direction_and_word_bits
         call address_byte_analysis
         jmp @@pab

	 @@xor3:
         cmp al, 034h
         je @@is_xor3
         cmp al, 035h
         je @@is_xor3
         jmp @@rep
         @@is_xor3:
         writeln_non strxor
         jmp @@aux3

	 @@rep:
	 cmp al, 0F2h
	 je @@is_rep
	 cmp al, 0F3h
	 je @@is_rep
	 jmp @@movs
	 @@is_rep:
	 mov byte ptr[string_op], 0FFh
	 shr al, 1
	 jc @@repe
	 jnc @@repne
	 
	 @@repe:
	 writeln_non strrepe
	 jmp @@pab
	 
	 @@repne:
	 writeln_non strrepne
	 jmp @@pab
	 
	 @@movs:
         cmp al, 0A4h
         je @@is_movs
         cmp al, 0A5h
         je @@is_movs
         jmp @@cmps
         @@is_movs:
         shr al, 1
         jc @@movsw
         jnc @@movsb
         @@movsw:
         writeln strmovsw
         jmp @@pab
         @@movsb:
         writeln strmovsb
         jmp @@pab
         
         @@cmps:
         cmp al, 0A6h
         je @@is_cmps
         cmp al, 0A7h
         je @@is_cmps
         jmp @@scas
         @@is_cmps:
         shr al, 1
         jc @@cmpsw
         jnc @@cmpsb
         @@cmpsw:
         writeln strcmpsw
         jmp @@pab
         @@cmpsb:
         writeln strcmpsb
         jmp @@pab
         
         @@scas:
         cmp al, 0AEh
         je @@is_scas
         cmp al, 0AFh
         je @@is_scas
         jmp @@lods
         @@is_scas:
         shr al, 1
         jc @@scasw
         jnc @@scasb
         @@scasw:
         writeln strscasw
         jmp @@pab
         @@scasb:
         writeln strscasb
         jmp @@pab
         
         @@lods:
         cmp al, 0ACh
         je @@is_lods
         cmp al, 0ADh
         je @@is_lods
         jmp @@stos
         @@is_lods:
         shr al, 1
         jc @@lodsw
         jnc @@lodsb
         @@lodsw:
         writeln strlodsw
         jmp @@pab
         @@lodsb:
         writeln strlodsb
         jmp @@pab

         @@stos:
         cmp al, 0AAh
         je @@is_stos
         cmp al, 0ABh
         je @@is_stos
         jmp @@call
         @@is_stos:
         shr al, 1
         jc @@stosw
         jnc @@stosb
         @@stosw:
         writeln strstosw
         jmp @@pab
         @@stosb:
         writeln strstosb
         jmp @@pab

	 @@call:
	 cmp al, 0E8h
	 jne @@call2
	 writeln_non strcall
	 @@aux_jmp:
	 call read_disp_2b
	 mov byte ptr[dir_word + 1], 1
	 mov ax, word ptr[prog_ip]
	 inc ax
	 add word ptr[displacement], ax 
	 call print_data
	 writeln_non naujaEilute
	 jmp @@pab
	 
	 @@call2:
	 cmp al, 09Ah
	 jne @@jmp
	 writeln_non strcall
	 @@aux_dirseg:
	 mov byte ptr[dir_word + 1], 1
	 call read_disp_2b
	 mov ax, word ptr[displacement]
	 mov word ptr[ofset], ax
	 call read_disp_2b
	 mov ax, word ptr[displacement]
	 mov word ptr[segg], ax
	 call print_data
	 mov dl, ':'
	 call print_char
	 mov ax, word ptr[ofset]
	 mov word ptr[displacement], ax
	 call print_data
	 writeln_non naujaEilute
	 jmp @@pab
	 
	 @@jmp:
	 cmp al, 0E9h
	 jne @@short_jmp
	 writeln_non strjmp
	 jmp @@aux_jmp
	 
	 @@short_jmp:
	 cmp al, 0EBh
	 jne @@jmp_indirseg
	 writeln_non strjmp
	 @@aux_short_jmp:
	 push ax
	 push dx
	 call read_disp_1b
	 mov byte ptr[displacement + 1], 0
	 mov dx, word ptr[prog_ip]
	 inc dx
	 mov ax, word ptr[displacement]
	 cbw
	 add dx, ax
         mov word ptr[displacement], dx
	 mov byte ptr[dir_word + 1], 1
	 call print_data
	 writeln_non naujaEilute
	 pop dx
	 pop ax
	 jmp @@pab
	 
	 
	 @@jmp_indirseg:
	 cmp al, 0EAh
	 jne @@conjumps
	 writeln_non strjmp
	 jmp @@aux_dirseg
         
         @@conjumps:
         cmp al, 070h
         jb @@loops
         cmp al, 07Fh
         ja @@loops
         
         push ax
         push cx
         push bx
         push di
         push dx
         xor cx, cx
         xor bx, bx
         xor dx, dx
	 mov dl, 070h
         jmp @@jumps_loop
         
         @@jmp_return:
         mov cx, 000Fh
         mov dl, 07Fh
         
         @@jumps_loop:
         cmp al, dl
         je @@eq_jump
         jmp @@loop_end
         
         @@eq_jump:
         mov di, cx
         mov bl, [jmp_table + di]
         lea di, [strconjmp + bx]
         writeln_non di
         @@loop_end:
         dec dl
         jcxz @@jmp_return
         
         loop @@jumps_loop
         
         pop dx
         pop di
         pop bx
         pop cx
         pop ax
         jmp @@aux_short_jmp
         
         @@loops:
         cmp al, 0E0h
         jb @@int
         cmp al, 0E3h
         ja @@int
         
         push ax
         push cx
         push bx
         push di
         push dx
         xor cx, cx
         xor bx, bx
         xor dx, dx
	 mov dl, 0E0h
         jmp @@jumps_loop1
         
         @@jmp_return1:
         mov cx, 0004h
         mov dl, 0E4h
         
         @@jumps_loop1:
         cmp al, dl
         je @@eq_jump1
         jmp @@loop_end1
         
         @@eq_jump1:
         mov di, cx
         mov bl, [jmp_table + 16 + di]
         lea di, [strconjmp + bx]
         writeln_non di
         @@loop_end1:
         dec dl
         jcxz @@jmp_return1
         
         loop @@jumps_loop1
         
         pop dx
         pop di
         pop bx
         pop cx
         pop ax
         jmp @@aux_short_jmp
         
         @@int:
         cmp al, 0CDh
         jne @@int3
         writeln_non strint
         call read_disp_1b
         mov byte ptr[dir_word + 1], 0
         call print_data
         writeln_non naujaEilute
         jmp @@pab
         
         @@int3:
         cmp al, 0CCh
         jne @@into
         writeln_non strint
         mov dl, '3'
         call print_char
         writeln_non naujaEilute
         jmp @@pab
         
         @@into:
         cmp al, 0CEh
         jne @@iret
         writeln strinto
         jmp @@pab
         
         @@iret:
         cmp al, 0CFh
         jne @@cld
         writeln striret
         jmp @@pab
         
         @@cld:
         cmp al, 0FCh
         jne @@std
         writeln strcld
         jmp @@pab
         
         @@std:
         cmp al, 0FDh
         jne @@cli
         writeln strstd
         jmp @@pab
         
         @@cli:
         cmp al, 0FAh
         jne @@sti
         writeln strcli
         jmp @@pab
         
         @@sti:
         cmp al, 0FBh
         jne @@hlt
         writeln strsti
         jmp @@pab
         
         @@hlt:
         cmp al, 0F4h
         jne @@wait
         writeln strhlt
         jmp @@pab
         
         @@wait:
         cmp al, 09Bh
         jne @@esc
         writeln strwait
         jmp @@pab
         
         @@esc:
         push ax
         shr al, 3
         shl al, 3
         cmp al, 0D8h
         jne @@lock
         writeln_non stresc
         mov byte ptr[dont_care], 0FFh
         mov byte ptr[ext_opcode_flag], 0FFh
         mov byte ptr[skip_immediate], 0FFh
	 call address_byte_analysis         
         xor byte ptr[skip_immediate], 0FFh
         xor byte ptr[ext_opcode_flag], 0FFh
         xor byte ptr[dont_care], 0FFh
         pop ax
         jmp @@pab
         
         @@lock:
         pop ax
         cmp al, 0F0h
         jne @@clc
         writeln strlock
         jmp @@pab
         
         @@clc:
         cmp al, 0F8h                            ; CLC
         jne @@galCMC
         writeln strCLC
         jmp @@pab
                 
         @@galCMC:
         cmp al, 0F5h                            ; CMC
         jne @@galSTC
         writeln strCMC
         jmp @@pab

         @@galSTC:
         cmp al, 0F9h                            ; STC
         jne @@galRET
         writeln strSTC
         jmp @@pab
         
         @@galRET:
         cmp al, 0C3h                            ; RET
         jne @@retimm
         writeln strRET
         jmp @@pab
         
         @@retimm:
         cmp al, 0C2h
         je @@which_ret
         cmp al, 0CAh
         je @@which_ret
         jmp @@galRETF

	 @@which_ret:
         cmp al, 0CAh
         je @@far
         writeln_non strret
         jmp @@not_far
         @@far:
         writeln_non strRETF
         @@not_far:
         call read_disp_2b
         mov byte ptr[dir_word], 1
         call print_data
         writeln_non naujaEilute
         jmp @@pab
                  
         @@galRETF:
         cmp al, 0CBh                            ; RETF
         jne @@jz_32
         writeln strRETF
         jmp @@pab

	 @@jz_32:
	 cmp al, 0Fh
	 jne @@tiesiogDB

	 push di
	 push ax
	 push dx
	 call read_disp_1b
	 mov ah, byte ptr[displacement]
	 xchg ah, al
	 cmp ax, 0F84h
	 jne @@not_jz_32
	 lea di, [strconjmp + 18]
	 writeln_non di
	 call read_disp_2b
	 mov dx, word ptr[prog_ip]
	 inc dx
	 add word ptr[displacement], dx
	 mov byte ptr[dir_word + 1], 1
	 call print_data
	 writeln_non naujaEilute
	 
	 pop dx
	 pop ax
	 pop di
	 jmp @@pab

	 @@not_jz_32:
	 pop dx
	 pop ax
	 pop di


         @@tiesiogDB:
	 writeln_non reg000b
         call konvertuokI16taine                 ; DB
         mov word ptr[nuskaitytas],  ax
         writeln strDB
         
         @@pab:
         pop dx
         pop di
         pop cx
         pop si
         pop ax
         pop bx
         ret 
    analizuokKoda endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    skaitykArgumenta proc near
         ; nuskaito ir paruosia argumenta
         ; jeigu jo nerasta, tai CF <- 1, prisingu atveju - 0

         push bx
         push di
         push si 
         push ax

         xor bx, bx
         xor si, si
         xor di, di

         mov bl, es:byte ptr[80h]         
         mov byte ptr komEilIlgis, bl
         mov si, 0081h  
         mov di, offset komEilutesArgumentas
         push cx
         mov cx, bx
         mov ah,00
         cmp cx, 0000
         jne @@pagalVisus
         stc 
         jmp @@pab
   
         @@pagalVisus:
         mov al, byte ptr es:[si]
         cmp al, ' '
         je @@toliau
         cmp al, 0Dh
         je @@toliau
         cmp al, 0Ah
         je @@toliau
         mov byte ptr [di],al
         mov ah, 01                  ; ah - pozymis, kad buvo bent vienas "netarpas"
         inc di     
         jmp @@kitasZingsnis
         @@toliau:
         cmp ah, 01                  ; gal jau buvo "netarpu"?  
         je @@isejimas 
         @@kitasZingsnis:
         inc si
     
         loop @@pagalVisus
         @@isejimas: 
         cmp ah, 01                  ; ar buvo "netarpu"?  
         je @@pridetCOM
         stc                         ; klaida!   
         jmp @@pab 
         @@pridetCOM:
         mov byte ptr [di],'.'
         mov byte ptr [di+1], 'C'
         mov byte ptr [di+2], 'O'
         mov byte ptr [di+3], 'M'
         clc                         ; klaidos nerasta
         @@pab:
         pop cx
         pop ax
         pop si
         pop di 
         pop dx
         ret
    skaitykArgumenta endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    skaitomeFaila proc near
        ; skaitome faila po viena baita 
        ; bx - failo deskriptorius
        ; dx - buferis 
        push ax
        push dx
        push bx
        push cx
        push si
        
        mov si, dx 
        @@kartok:
        mov cx, 01
        mov ah, 3Fh 
        int 21h
        jc @@isejimas           ; skaitymo klaida
        inc word ptr[prog_ip]
        cmp ax, 00
        je @@isejimas           ; skaitymo pabaiga
        call print_prog_ip

        mov al, byte ptr [si]   ; is buferio
        
        call analizuokKoda      ; bandome dekoduoti

        jmp @@kartok
        
        @@isejimas:
        pop si
        pop cx
        pop bx
        pop dx
        pop ax
        ret   
    skaitomeFaila endp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    writeASCIIZ proc near
         ; spausdina eilute su nuline pabaiga, dx - jos adresas
         ; 

         push si
         push ax
         push dx
 
         mov  si, dx
 
         @@pagalVisus:
         mov dl, byte ptr [si]  ; krauname simboli
         cmp dl, 00             ; gal jau eilutes pabaiga?
         je @@pab

         mov ah, 02
         int 21h
         inc si
         jmp @@pagalVisus
         @@pab:
         
         writeln naujaEilute
  
         pop dx
         pop ax
         pop si
         ret
    writeASCIIZ endp 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    pradzia:
       ; pradzioje ds ir es rodo i PSP;
       ; PSP+80h -> kiek baitu uzima komandine eilute (be programos pavadinimo)
       ; 
       mov ax,     seg duomenys                   ; "krauname" duomenu segmenta
       mov ds,     ax
       
       call skaitykArgumenta
       jnc @@rasykArgumenta
       writeln klaidosPranesimas
       jmp kl

       @@rasykArgumenta: 
       mov dx, offset  komEilutesArgumentas      
       call writeASCIIZ 
       
       ;Atidarome faila
       mov dx, offset  komEilutesArgumentas      
       call atverkFaila
       jnc @@skaitomeFaila
       writeln klaidosApieFailoAtidarymaPranesimas
       jmp kl

       @@skaitomeFaila:
       mov bx, word ptr skaitomasFailas          
       mov dx, offset nuskaitytas          
       call skaitomeFaila
       jnc @@failoUzdarymas
       writeln klaidosApieFailoSkaitymaPranesimas
       jmp kl

       @@failoUzdarymas:
       mov bx, word ptr skaitomasFailas          
       call uzdarykFaila
       
       
       kl:
       mov ah,     4ch                            ; baigimo funkcijos numeris
       int 21h
kodas  ends
    end pradzia 

