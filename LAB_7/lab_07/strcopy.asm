.MODEL  FLAT, C

.STACK

.CODE
strcopy PROC
	MOV EDI, [ESP + 4]
	MOV ESI, [ESP + 8]
	MOV ECX, [ESP + 12]

	CMP ESI, EDI
	JG COPY

	MOV EAX, EDI
	SUB EAX, ESI

	CMP EAX, ECX
	JGE COPY  
  
    ADD EDI, ECX
    DEC EDI
    ADD ESI, ECX
    DEC ESI
    
    STD
  
	COPY:
    	REP MOVSB
    	CLD
  
	EXIT:
	    RET
strcopy ENDP
END