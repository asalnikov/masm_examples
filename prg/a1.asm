include console.inc

COMMENT * < ������ � ����������� >
*

.const
   c1  dd 121212
   c2  dd ?; ��� �����������

.data

    extern xa2:dword; xa1 �� a2.asm
    extern QQ@0:proc; proc=near
    extern NN:abs;    �������������� i32 !

    x    dd 0
    s    db "Hello World ����� � � ClrScr!",0
    s1   db "����� ��������� ����",0
    a    db -113
    y    db ?
         public za1
    za1  dd -400
    a1   sbyte -128
    a2   sword -1313
    a2a  word  1313,2323
    a3   sdword 0ffffffffh
    a4   dq     -123456789012345
    a5   dd 1,2
    Cap  db "���������� ��������� ��� Win32",0
    Msg  db "Assembler language for Windows ������ ������!",0

         add eax,1;   �� ���������!!

    buf  db 128 dup (?)
 
Date record day:5,month:4,year:7=4
Stud struc
;    Fio   db 20 dup ('*')
    Fio   db '********************'
          db 0
    day   db ?
    month db ?
    year  dw 1999
Stud ends

.data
MyDate Date <13,,16>
MySt1  Stud <'������ �.�.',,21,4>
MySt2  Stud <,,21,4>

.data?
    v    dd ?
    colors dw ?

.code

Proba proc  uses eax ebx, par1:dword,par2:byte
      local loc1,loc2:dword

;  ������������� ����������� �������:
;    push ebp;     55
;    mov  ebp,esp; 8B EC
;    sub  esp,8;   83 EC 08
;    push eax;     50
;    push ebx;     53

;  ��������� ������� ���������:
;loc1 equ  dword ptr [ebp-4]
;loc2 equ  dword ptr [ebp-8]
;par1 equ  dword ptr [ebp+8]
;par2 equ  dword ptr [ebp+12]

    inc eax
;    outintln [ebp-4],,'[ebp-4]= '
;    outintln loc1,,'loc1=    '
;    outintln [ebp-8],,'[ebp-8]= '
;    outintln loc2,,'loc2=    '
;    outintln [ebp+8],,'[ebp+8]= '
;    outintln par1,,'par1=    '
;    outintln [ebp+12],,'[ebp+12]='
;    outintln par2,,'par2=    '
    inc ebx

; ����� ret ������������� ����������� �������:
;   pop  ebx;     5B
;   pop  eax;     58
;   mov  esp,ebp; 8B E5  ����������� local p1,p2
;   pop  ebp;     5D
;   ret  8;       C2 00 08

     ret
Proba endp

;Proba1 PROTO :dword,:vararg; ������ ��� cdecl

P  proc stdcall
LP::sub eax,eax
   ret
 LPP proc
 LPP endp
M  dd -222
M1 equ -444
   jmp L2
P  endp

start:

;exit

;    pause "������ ����� ..."

; ��������� ���� �������
    Pause "����� ��������� ���� �������"

    ConsoleTitle "��������� ���� �������"
    outstr 'Extrn xa2 �� a2.pas='
    outintln xa2
    MsgBox offset Cap,offset Msg,MB_ABORTRETRYIGNORE or MB_ICONSTOP
    OutStr "��� (Code) ������� ������ = "
    OutWordLn eax
    MsgBox "abc",<"abc ����� ������",13,10,"1234567890">,MB_CANCELTRYCONTINUE
    outstrln "Hello world"
    call GetCommandLine; eax:=<����� ��������� ������>
    OutStr "��������� ������ ������ ��������� = "
    SetTextAttr Yellow
    OutStrLn eax
    SetTextAttr
    newline 3
    OutStrLn "Hello, World (��� ClrScr)"
    OutStrLn "����� newline 4"
    newline 4
    pause "����� ����� ������ ������� �� 80�25 ..."
    SetScreenSize 80,25; ����� ���� �������
    newline
    pause "����� ClrScr ..."
    ClrScr
; � ������� ������
    gotoXY 20,3
    OutStrLn "Position (20,5): ������, ���!"
; ���������� ������
    OutStr "����� ����� �� X = "
    Invoke GetSystemMetrics,0; X
    outwordln eax
    OutStr "����� ����� �� Y = "
    invoke GetSystemMetrics,1; Y
    outword eax
    newline 2
; ��������� ����� - ���� ����� �� ����� ������ (��� �� ;)
    pause "����� ��������� ����� ..."
    OutStrLn "��������� �����, ������ CR,LF",13,10,\
              "����� ������=",62," !<",13,10,"!!",13,10; �����������
; ����� ������
    Pause "����� ����� �����"
    OutStrLn "����� ����� �� 16*Blue+Yellow"
    SetTextAttr 16*Blue+Yellow
    SetTextAttr Bright
    newline
; ����� ��������� ����� �� outint
    OutStrLn "����� ��������� ����� �� outint"
    mov bl,-13
    outintln bl
    mov bx,-1313
    outintln bx
    outint -1313131313
    newline 2
; ����� ������������ ����� �� outword:8
    OutStrLn "����� ������������ ����� �� outword:8"
    mov bl,-13
    outwordln bl,8
    outword 1313131313,8
    newline 2
    OutStrLn "����� ����� �� LightMagenta"
    SetTextAttr LightMagenta
    OutStrLn "����� ����� �� �����������=LightGray"
    SetTextAttr
 ; ���� ����� �� inint x=m8,m16,m32,r8,r16,r32
    OutStrLn "���� ����� �� inint �� ����"
    SetTextAttr
Li: OutStr "������� ����� ����� = "
    inint x
    OutStr "������� ����� = "
    outintln x,8
    cmp x,0
    jne Li
    newline 2
; ����� ������� �� outchar x=m8,r8,i8
    Pause "����� ������� �� outchar x=m8,r8,i8"
    newline
    mov y,'+'
    outchar y
    mov bl,'&'
    outchar bl
    newline 2
; ���� ������� �� inchar x=m8,r8
    Pause "���� �������� �� inchar x=m8,r8,i8"
    OutStrLn "���� �������� �� inchar �� ����� (* - c���� ������ flush):"
;    flush
L:  inchar al
    outchar al
    newline
    cmp al,'*'; ���� �������� �� '*',����� flush
    jne L2
    flush 
Next_Statement_Name:
L2: cmp al,'.'
    jne L
; ���� � ����� ����� InputStr buf,len �� ������, ������������ ������ 
    pause "���� � ����� ����� InputStr offset buf,len �� ������, ������������ ������"
    newline 2
    flush
L3: mov al,">"
    OutChar al
    InputStr offset buf,128
    OutStr "�������:"
    OutStrLn offset buf
    cmp buf,'.'
    jne L3

    exit
    mov ebx,0
    mov ebx,1 shl 16
    mov bx,0
    mov edi,0
    mov di,0

    mov ax,a2a[bx+di]; ax:=<(a2a+ebx!+edi!) mod 2**32 (�� 2**16!)> 
    outintln ax
    mov ax,a2a[ebx+2*edi]
    outintln ax
newline
    mov ax,a2a[bx]; ax:=<(a2a+ebx!) mod 2**32 (�� 2**16!)> 
    outintln ax
    mov ax,a2a[ebx]
    outintln ax
    mov eax,dword ptr a2a[bx]
    outintln eax
    mov eax,dword ptr a2a[ebx]
    outintln eax

end start
