include console.inc

COMMENT *
   ���� ������ ����� � ����� ����� ��� ����
*

.data
   X   dd ?
   Sum db ?; ����� ����

MaxLongint equ 80000000h
 
.code
   mov esi,0FFFF0000h
   outnumln esi,,b
   add si,1
   outnumln esi,,b
   newline
   mov eax,0FFFF0000h
   outnumln eax,,b
   mov ax,2
   outnumln eax,,b

exit

Start:
   GotoXY 10,10
   Pause    '�����, �������...'
   ConsoleTitle "   ���� ������ �����, ����� ����� ��� ����"
Bedin:
   clrscr
   newline 2
   mov   Sum,0
   outstr '������� ����� X='
   inintln X
   jnc   @F
   outstrln '������� ������� �����!'
   jmp   Next
@@:jnz   @F
   pushfd
   outstrln '������� ����� ������ ����! ZF=1'
   popfd
@@:jns   @F
   outstrln '������ ����� ������� ������ �����!'
@@:mov   ebx,10
   mov   eax,X
L: cdq
   idiv  ebx
L1:neg   edx
   js    L1; edx:=abs(edx)
   add   Sum,dl; Sum:=Sum+�����
   cmp   eax,0
   jne   L
   outwordln Sum,,"����� ����="

Next:
   MsgBox "����� ���������","������� ��� ���?", \
          MB_YESNO+MB_ICONQUESTION
   cmp   eax,IDYES
   je    Bedin

   exit
   end Start