DECLARE SUB pointerdump (ptbegn!, ptend!, txtbegn!)
DECLARE SUB insert (begn, ennd, begn2)
DECLARE SUB finddd (fin$)
DECLARE SUB edit (begn, ennd)
DECLARE SUB addhex (curr)
DECLARE SUB suggest (letter$, curr, thekey$, lenletter%)
DECLARE SUB hexequiv (thekey$, curr)
DECLARE FUNCTION hexx (text$)
DECLARE SUB td (begn, ennd)
DECLARE SUB Table ()
DECLARE FUNCTION lightbar (xmax)

DIM SHARED linkamt(1 TO 20) AS INTEGER
DIM SHARED link(1 TO 20) AS INTEGER
DIM SHARED bit16 AS INTEGER

DIM SHARED header AS LONG

DIM SHARED menucol(1 TO 10) AS INTEGER
DIM SHARED menuline(1 TO 10) AS INTEGER
DIM SHARED menutext(1 TO 10) AS STRING


DIM SHARED tbl AS STRING

DIM SHARED pointbegin AS LONG
DIM SHARED skipnon AS INTEGER
DIM SHARED linkmax AS INTEGER
DIM SHARED dakfront AS INTEGER
DIM SHARED dodaku AS INTEGER
DIM SHARED dak AS INTEGER
DIM SHARED hand AS INTEGER
DIM b AS LONG
DIM bb AS LONG
DIM SHARED tt(1 TO 100) AS INTEGER
DIM SHARED hexie(1 TO 15) AS STRING
DIM SHARED ts AS STRING
DIM SHARED ts2 AS STRING
DIM SHARED newhex AS STRING
DIM SHARED gotit AS INTEGER
DIM SHARED no AS INTEGER
DIM SHARED yg AS INTEGER
DIM SHARED x2 AS INTEGER
DIM SHARED y2 AS INTEGER
DIM SHARED max AS INTEGER
DIM SHARED lmax AS INTEGER
DIM SHARED tmax AS INTEGER
DIM SHARED imax AS INTEGER
DIM SHARED max2 AS INTEGER

DIM SHARED final AS LONG
DIM SHARED dblmax AS INTEGER
DIM SHARED dbl(1 TO 3000) AS STRING
DIM SHARED dblhex(1 TO 3000) AS STRING
DIM SHARED combo(1 TO 300) AS STRING

DIM SHARED comhex(1 TO 300) AS STRING
DIM SHARED jap(1 TO 300) AS STRING
DIM SHARED japhex(1 TO 300) AS STRING

DIM SHARED text(1 TO 500) AS STRING
DIM SHARED hex(1 TO 500) AS STRING


DIM SHARED bktext(1 TO 30) AS STRING
DIM SHARED bkmark(1 TO 30) AS LONG

DIM SHARED instext(1 TO 30) AS STRING
DIM SHARED insmark(1 TO 30) AS LONG
DIM SHARED insname(1 TO 30) AS STRING

DIM SHARED dmarkst(1 TO 30) AS LONG
DIM SHARED dmarkend(1 TO 30) AS LONG
DIM SHARED dtext(1 TO 30) AS STRING

DIM SHARED newlhex AS STRING
DIM SHARED endhex AS STRING
DIM SHARED jnewlhex AS STRING
DIM SHARED jendhex AS STRING

DIM SHARED newlhex2 AS STRING
DIM SHARED endhex2 AS STRING
DIM SHARED jnewlhex2 AS STRING
DIM SHARED jendhex2 AS STRING


DIM SHARED comend AS INTEGER
DIM SHARED comend2 AS INTEGER
DIM SHARED comnewl AS INTEGER
DIM SHARED comnewl2 AS INTEGER
DIM SHARED japend AS INTEGER
DIM SHARED japnewl AS INTEGER
DIM SHARED japend2 AS INTEGER
DIM SHARED japnewl2 AS INTEGER

DIM SHARED commax AS INTEGER
DIM SHARED maxmix AS INTEGER
DIM SHARED chr AS INTEGER

DIM SHARED fillnamm AS STRING

bit16 = 0
x = 8
y = 10
tabl = 1
tabl2 = 2

CLS

CALL Table

CLOSE #1
OPEN fillnamm FOR INPUT AS #1
CLOSE #1
OPEN fillnamm FOR BINARY AS #1

CLS
LOCATE 24, 1: COLOR 14: PRINT "Welcome to Thingy.                                         ";
lof1 = LOF(1)
was = 1
655
has = was
GOSUB 33: GOTO loop1


33
tempa$ = INKEY$
LOCATE 1, 1
IF was < 1 THEN was = 1
IF has < 1 THEN has = 1
IF has > lof1 THEN has = lof1
IF was > lof1 THEN was = lof1
tex$ = STRING$(16 * 20 + 1, " ")
GET #1, has, tex$

FOR h% = 1 TO 20
  COLOR 4, 0: PRINT "["; : COLOR 7, 0:
  FOR I% = 1 TO 16
    inhex$ = MID$(tex$, I% + 16 * (h% - 1), 1)
    char$ = HEX$(ASC(inhex$))
    IF LEN(char$) = 1 THEN char$ = "0" + char$
    IF x = I% AND y = h% THEN COLOR 15, 7
    PRINT char$; : COLOR 7, 0
  NEXT I%
  COLOR 4, 0
  PRINT "] ";
  COLOR 7, 0
       
  FOR I% = 1 TO 16
       
    inhex$ = MID$(tex$, I% + 16 * (h% - 1), 1)
    inhex2$ = MID$(tex$, I% + 16 * (h% - 1) + 1, 1)
    char$ = HEX$(ASC(inhex$))
    char2$ = HEX$(ASC(inhex2$))
    IF LEN(char$) = 1 THEN char$ = "0" + char$
    IF LEN(char2$) = 1 THEN char2$ = "0" + char2$
    DO
      th = ASC(inhex$) + 1
      do2 = 0
      FOR r% = 1 TO dblmax
        IF dblhex(r%) = char$ + char2$ THEN do2 = 1: EXIT FOR
      NEXT r%

    IF do2 = 1 THEN
      I% = I% + 1
      IF x = I% OR x = I% - 1 THEN
        IF y = h% THEN COLOR 15, 7
      END IF
      COLOR 15: PRINT dbl(r%); : COLOR 7, 0: EXIT DO
    END IF
    IF th = comnewl OR th = comnewl2 THEN
      COLOR 14, 0
      IF x = I% AND y = h% THEN COLOR 15, 7
      PRINT combo(th); : COLOR 7, 0: EXIT DO
    ELSEIF th = comend OR th = comend2 THEN
      COLOR 15, 0
      IF x = I% AND y = h% THEN COLOR 15, 7
      PRINT combo(th); : COLOR 7, 0: EXIT DO
    ELSEIF comhex(th) <> "" THEN
      IF LEN(combo(th)) = 1 THEN COLOR 8 * LEN(combo(th)) - 4, 0
      IF LEN(combo(th)) = 2 THEN COLOR 8 * LEN(combo(th)) - 4, 0
      IF LEN(combo(th)) = 3 THEN COLOR 5
      IF LEN(combo(th)) > 3 THEN COLOR 13
      IF x = I% AND y = h% THEN COLOR 15, 7
      PRINT combo(th); : COLOR 7, 0: EXIT DO
    END IF
         
          COLOR , 0
          IF x = I% AND y = h% THEN COLOR 15, 7
         
          PRINT "#"; : COLOR 7, 0: EXIT DO
     LOOP

NEXT I%
PRINT STRING$(80 - POS(0), " ")
has = has + 16

NEXT h%

ror = CSRLIN
lin = POS(0)
LOCATE 21, 1: COLOR 15: PRINT "S-search R-resume SPACE-edit I-insert Q-quit"
LOCATE 22, 1: COLOR 15: PRINT "D-dump P-pointer-based dump J-Jump"
LOCATE 23, 1: COLOR 15: PRINT HEX$(was + (16 * (y - 1)) + (x - 1) - 1) + " (" + STR$(was + (16 * (y - 1)) + (x - 1) - 1) + " )      "
'LOCATE 24, 1: COLOR 15: PRINT "Welcome to Thingy.";
LOCATE ror, lin

RETURN

loop1: DO

ink$ = INKEY$

IF ink$ = CHR$(9) THEN            'Tab
 FOR I% = 1 TO 300
  SWAP combo(I%), jap(I%)
  SWAP comhex(I%), japhex(I%)
 NEXT I%
 SWAP comnewl, japnewl
 SWAP comend, japend
 SWAP jnewlhex, newlhex
 SWAP endhex, jendhex
 SWAP tabl, tabl2
 has = was
 GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Switched to Table #"; tabl; "                    "
END IF

IF ink$ = CHR$(32) THEN
  IF select1 = 1 THEN
    ennd = was + (16 * (y - 1)) + (x - 1)
    select1 = 0
    CLS
    CALL edit(begn, ennd)
    has = was
    GOSUB 33
  ELSE
    begn = was + (16 * (y - 1)) + (x - 1)
LOCATE 24, 1: COLOR 14: PRINT "Selecting text to edit (Z to cancel)...                ";
  select1 = 1
  END IF
END IF

IF UCASE$(ink$) = "D" THEN
  GOSUB 6542
END IF

IF UCASE$(ink$) = "I" THEN
  GOSUB 6543

END IF



IF MID$(ink$, 2, 1) = "I" THEN
  has = was
  has = has - (16 * 20)
  was = has
  GOSUB 33
END IF

IF MID$(ink$, 2, 1) = "Q" THEN
  has = was
  has = has + (16 * 20)
  was = has
  GOSUB 33
END IF

IF MID$(ink$, 2, 1) = "M" THEN
  GOSUB right
END IF
IF MID$(ink$, 2, 1) = "H" THEN
  GOSUB up
END IF
IF MID$(ink$, 2, 1) = "K" THEN
  GOSUB left
END IF
IF MID$(ink$, 2, 1) = "P" THEN
  GOSUB down
END IF

IF UCASE$(ink$) = "S" THEN
  GOSUB search
END IF

IF UCASE$(ink$) = "P" THEN
  GOSUB goptdump
END IF

IF UCASE$(ink$) = "J" THEN
  GOSUB 654
  has = was
  GOSUB 33
END IF

IF UCASE$(ink$) = "R" THEN
  b = was + 1
  GOSUB search2
END IF

IF UCASE$(ink$) = "Z" THEN
selectpointer = 0
selectpointer2 = 0
select21 = 0
select3 = 0
select1 = 0
LOCATE 24, 1: COLOR 14: PRINT "Selection Canceled.                                   ";
END IF

LOOP WHILE UCASE$(ink$) <> "Q"
LOCATE 24, 1: COLOR 14: PRINT "Goodbye.                                        "
3 CLOSE #1
END

up:
IF y > 1 THEN
  y = y - 1
  has = was + (16 * (y - 1))
  LOCATE y, 1
  high = 1: GOSUB draw1: high = 0
  high = -1
  GOSUB draw1
  high = 0
ELSE
  was = was - 16
  has = was
  GOSUB 33
END IF
RETURN

down:
IF y < 20 THEN
  y = y + 1
  has = was + (16 * (y - 1))
  LOCATE y, 1
  high = 1: GOSUB draw1: high = 0
  has = has - 32
  LOCATE y - 1, 1
  high = 2
  GOSUB draw1
  high = 0
ELSE
  was = was + 16
  has = was
  GOSUB 33
END IF
RETURN

left:
IF x > 1 THEN
  x = x - 1
  has = was + (16 * (y - 1))
  LOCATE y, 1
  high = 1: GOSUB draw1: high = 0
ELSE
  IF y > 1 THEN
  x = 16
  GOSUB up
  ELSE
    x = 16
    was = was - 16
    has = was
    GOSUB 33
  END IF
END IF
RETURN

right:
IF x < 16 THEN
  x = x + 1
  has = was + (16 * (y - 1))
  LOCATE y, 1
  high = 1: GOSUB draw1: high = 0
ELSE
IF y < 20 THEN
  x = 1
GOSUB down
ELSE
  x = 1
  was = was + 16
  has = was
  GOSUB 33
END IF


END IF
RETURN


draw1:
temptt$ = INKEY$
tex$ = "                 "
IF was < 1 THEN was = 1
IF has < 1 THEN has = 1
GET #1, has, tex$

        COLOR 4, 0: PRINT "["; : COLOR 7, 0:
        FOR I% = 1 TO 16
       
       
        inhex$ = MID$(tex$, I%, 1)
        char$ = HEX$(ASC(inhex$))
        IF LEN(char$) = 1 THEN char$ = "0" + char$
        COLOR 7, 0
        IF x = I% AND high = 1 THEN COLOR 15, 7

        PRINT char$; : COLOR 7, 0
        NEXT I%
        COLOR 4, 0: PRINT "] ";
      
        FOR I% = 1 TO 16
       
        inhex$ = MID$(tex$, I%, 1)
        inhex2$ = MID$(tex$, I% + 1, 1)
        char$ = HEX$(ASC(inhex$))
        char2$ = ""
        char2$ = HEX$(ASC(inhex2$))
        IF LEN(char$) = 1 THEN char$ = "0" + char$
        IF LEN(char2$) = 1 THEN char2$ = "0" + char2$

         DO
         th = ASC(inhex$) + 1
         do2 = 0
         FOR r% = 1 TO dblmax
         IF dblhex(r%) = char$ + char2$ THEN
           do2 = 1
           EXIT FOR
         END IF
         NEXT r%
  IF do2 = 1 THEN
    I% = I% + 1
    IF (x = I% OR x = I% - 1) AND high = 1 THEN COLOR 15, 7
    COLOR 15: PRINT dbl(r%); : COLOR 7, 0: EXIT DO
  END IF
        
         IF th = comnewl OR th = comnewl2 THEN
          COLOR 14, 0
          IF x = I% AND high = 1 THEN COLOR 15, 7
         
          PRINT combo(th); : COLOR 7, 0: EXIT DO
         
        
          ELSEIF th = comend OR th = comend2 THEN
          COLOR 15, 0
          IF x = I% AND high = 1 THEN COLOR 15, 7
        
          PRINT combo(th); : COLOR 7, 0: EXIT DO
        
          ELSEIF comhex(th) <> "" THEN
            IF LEN(combo(th)) = 1 THEN COLOR 8 * LEN(combo(th)) - 4, 0
            IF LEN(combo(th)) = 2 THEN COLOR 8 * LEN(combo(th)) - 4, 0
            IF LEN(combo(th)) = 3 THEN COLOR 5
            IF LEN(combo(th)) > 3 THEN COLOR 13
          IF x = I% THEN
            IF high = 1 THEN COLOR 15, 7
          END IF
        
            PRINT combo(th); : COLOR 7, 0: EXIT DO
          END IF
          COLOR 7, 0
          IF x = I% AND high = 1 THEN
            COLOR 15, 7
          END IF
        
          PRINT "#"; : COLOR 7, 0: EXIT DO
        
        LOOP
46
NEXT I%
PRINT
has = has + 16
ror = CSRLIN
lin = POS(0)
LOCATE 21, 1: COLOR 15: PRINT "S-search R-resume SPACE-edit I-insert Q-quit"
LOCATE 22, 1: COLOR 15: PRINT "D-dump P-pointer-based dump J-Jump"
LOCATE 23, 1: COLOR 15: PRINT HEX$(was + (16 * (y - 1)) + (x - 1) - 1) + " (" + STR$(was + (16 * (y - 1)) + (x - 1) - 1) + " )      "
'LOCATE 24, 1: COLOR 15: PRINT "Table #"; tabl;
LOCATE ror, lin
RETURN


search:
fin$ = ""
b = was
CALL finddd(fin$)
findd$ = ""
findd2$ = ""
findd22$ = ""

findd$ = STRING$(15000, " ")
findd2$ = STRING$(LEN(fin$), " ")
findd22$ = STRING$(1, " ")
search2:
DO UNTIL b > LOF(1) - 1
LOCATE 24, 1: COLOR 14: PRINT "Searching..."; b; "                                  ";
fgh:
LOCATE 24, 13: PRINT b;
GET #1, b, findd$

FOR goo% = 1 TO 15000
newstr$ = MID$(findd$, goo%, 1)

IF newstr$ = LEFT$(fin$, 1) THEN
 bb = b + goo% - 1
 FOR t% = 1 TO LEN(fin$)
  bb = bb + 1
  IF bit16 = 1 THEN bb = bb + 1
  GET #1, bb, findd22$
  IF bb > LOF(1) OR b > LOF(1) THEN EXIT DO
  IF t% = LEN(fin$) THEN
    was = bb - LEN(fin$)
    x = 1
    y = 1
    has = was
    GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Found match.                                      ";
    RETURN
  END IF
  IF findd22$ = MID$(fin$, 1 + t%, 1) THEN GOTO ft
  b = b + goo%: GOTO fgh
ft:
  NEXT t%
END IF
NEXT goo%
tf:
b = b + 15000
LOOP
b = 1
has = was
GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "No match found.                                    ";

RETURN

654

CLS
FOR I% = 1 TO lmax
menucol(I% + 1) = 10 + col
menuline(I% + 1) = I% + 1 + lin
menutext(I% + 1) = bktext(I%)
NEXT I%
menutext(1) = "Manual Address"
menucol(1) = col + 10
menuline(1) = lin + 1
menutext(lmax + 2) = "Add Address"
menucol(lmax + 2) = col + 10
menuline(lmax + 2) = lin + 2 + lmax
CLS
fg = lightbar(lmax + 2)


IF fg = lmax + 2 THEN
INPUT "Description?", desc2$
desc3$ = CHR$(13) + CHR$(10) + "(" + HEX$(was + (16 * (y - 1)) + (x - 1) - 1) + "h)" + desc2$
OPEN tbl FOR APPEND AS #2
PRINT #2, desc3$
CLOSE #2
lmax = lmax + 1
bkmark(lmax) = (was + (16 * (y - 1)) + (x - 1) - 1)
bktext(lmax) = desc2$
GOTO thre
END IF


IF fg <> 1 THEN
was = bkmark(fg - 1) + 1
GOTO thre
END IF
LOCATE lin + lmax + 3, col + 1
INPUT "Address?", finall$
IF UCASE$(RIGHT$(finall$, 1)) = "H" THEN
 IF hexx(LEFT$(finall$, LEN(finall$) - 1)) > LOF(1) THEN
  was = LOF(1)
ELSE
  was = hexx(LEFT$(finall$, LEN(finall$) - 1)) + 1
END IF
ELSE
  was = VAL(finall$) + 1
END IF

thre:
x = 1
y = 1
RETURN

6542
CLS
  IF select21 = 1 THEN
    ennd = was + (16 * (y - 1)) + (x - 1)
    select21 = 0
    CLS
    CALL td(begn2, ennd)
    has = was
    GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Script dump complete.                                 ";
    GOTO thre3
  END IF


FOR I% = 1 TO tmax
menucol(I% + 1) = 10 + col
menuline(I% + 1) = I% + 1 + lin
menutext(I% + 1) = dtext(I%)
NEXT I%
menutext(1) = "Manual Dump"
menucol(1) = col + 10
menuline(1) = lin + 1
CLS
fg = lightbar(tmax + 1)


IF fg <> 1 THEN
    begn2 = dmarkst(fg - 1)
    ennd = dmarkend(fg - 1)
    CLS
    CALL td(begn2, ennd)
    has = was
    GOSUB 33
GOTO thre2
END IF
begn2 = was + (16 * (y - 1)) + (x - 1)
select21 = 1
LOCATE 24, 1: COLOR 14: PRINT "Selecting manual dump region (Z to cancel)...                     ";
    has = was
    GOSUB 33
    GOTO thre3
thre2:
x = 1
y = 1
thre3:
RETURN

6543
CLS
  IF select3 = 1 THEN
    CLS
    CLOSE #1
    OPEN fillnamm FOR BINARY AS #4
    INPUT "Output file?", opf$
    OPEN opf$ FOR BINARY AS #1
    ennd = was + (16 * (y - 1)) + (x - 1)
    select3 = 0
    CALL insert(begn3, ennd, 1)
    CLOSE #1
    CLOSE #4
    OPEN fillnamm FOR BINARY AS #1
    has = was
    GOSUB 33
    GOTO thre4
  END IF


FOR I% = 1 TO imax
menucol(I% + 1) = 10 + col
menuline(I% + 1) = I% + 1 + lin
menutext(I% + 1) = instext(I%)
NEXT I%
menutext(1) = "Insert to File"
menucol(1) = col + 10
menuline(1) = lin + 1
CLS
fg = lightbar(imax + 1)


IF fg <> 1 THEN
OPEN insname(fg - 1) FOR BINARY AS #4
    begn3 = insmark(fg - 1)
    ennd = LOF(4) - 1
    CLS
    CALL insert(1, ennd, begn3)
    CLOSE #4
    has = was
   
LOCATE 24, 1: COLOR 14: PRINT "Insertion complete.                                       ";
    GOSUB 33
GOTO thre5
END IF
begn3 = was + (16 * (y - 1)) + (x - 1)
select3 = 1
    has = was
LOCATE 24, 1: COLOR 14: PRINT "Selecting insertion region (Z to cancel)...               ";
    GOSUB 33
    GOTO thre4
thre5:
x = 1
y = 1
thre4:
RETURN

goptdump:
CLS
IF selectpointer = 1 THEN GOTO pt1
IF selectpointer2 = 1 THEN GOTO pt2

selectpointer = 1
menuline(1) = 2: menucol(1) = 2
menuline(2) = 3: menucol(2) = 2
menutext(1) = "16 bit (xx xx)": menutext(2) = "24 bit (xx xx xx)"
ptdumpbegn = was + (16 * (y - 1)) + (x - 1)

LOCATE 1, 1: PRINT "Select Pointer Dump method:"
fg = lightbar(2)
IF fg = 2 THEN pointerdump24bits = 1
CLS
has = was
GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Select end of pointer block (Z to cancel)...                            ";
GOTO endpointerdump

pt1:
selectpointer = 0
selectpointer2 = 1
ptdumpend = was + (16 * (y - 1)) + (x - 1)
has = was
GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Select beginning of text block (Z to cancel)...                         ";
GOTO endpointerdump

pt2:
selectpointer2 = 0
pttextbegn = was + (16 * (y - 1)) + (x - 1)
CALL pointerdump(ptdumpbegn, ptdumpend, pttextbegn)
has = was
GOSUB 33
LOCATE 24, 1: COLOR 14: PRINT "Pointer script dump complete.                                        ";
GOTO endpointerdump

endpointerdump:
RETURN

SUB addhex (curr)
7
DO
theke$ = INKEY$
IF theke$ = "" THEN GOTO 9999
IF ASC(theke$) > 64 THEN
  IF (ASC(theke$) < 71) THEN GOTO getchar
END IF
IF ASC(theke$) > 47 THEN
  IF ASC(theke$) < 58 THEN GOTO getchar
END IF
9999
LOOP WHILE theke$ = ""

getchar:
IF buf$ <> "" THEN
  hex(curr) = buf$ + theke$
  text(curr) = "#"
  curr = curr + 1
  GOTO ty
END IF
buf$ = theke$:  GOTO 7

ty:
END SUB

SUB edit (begn, ennd)
ERASE hex
ERASE text

CLS
IF begn > ennd THEN max = begn - ennd + 2
IF begn < ennd THEN max = ennd - begn + 2
IF begn = ennd THEN max = 2
curr = 1
hex(curr) = ""
GOSUB printhex



DO
1
WHILE thekey$ = ""
thekey$ = INKEY$
WEND
IF thekey$ = CHR$(0) + CHR$(29) THEN
   PRINT "ffffffff": SLEEP
ELSEIF thekey$ = "`" THEN
   IF curr < max THEN CALL addhex(curr): GOSUB printhex: GOTO 12
ELSEIF thekey$ = "~" THEN
   IF yg = 0 THEN LOCATE 1, 1: PRINT "Ask:Y": yg = 1: GOTO 12
   IF yg = 1 THEN LOCATE 1, 1: PRINT "Ask:N": yg = 0: GOTO 12

ELSEIF thekey$ = CHR$(8) THEN
  IF curr = 1 THEN GOSUB printhex: GOTO 12
  oki = 0
  DO WHILE oki = 0
  curr = curr - 1
  IF hex(curr) <> "" THEN oki = 1
  LOOP
  hex(curr) = "": text(curr) = "": GOSUB printhex: GOTO 12
END IF

FOR u% = 1 TO dblmax
dblstuff$ = ""
FOR y% = u% TO 1 STEP -1
IF curr > y% THEN dblstuff$ = dblstuff$ + text(curr - (y%))
787
NEXT y%
dblstuff$ = dblstuff$ + thekey$

FOR o% = 1 TO dblmax
IF dblstuff$ = dbl(o%) THEN
newhex$ = dblhex(o%)
  CALL suggest(dbl(o%), curr, thekey$, u%)
 GOTO 165
END IF
NEXT o%
NEXT u%




IF curr < 2 THEN GOTO 16
FOR o% = maxmix TO 1 STEP -1
IF (curr - o% < 1) THEN GOTO 54
find$ = ""
FOR p% = o% TO 1 STEP -1
find$ = find$ + text(curr - p%)
NEXT p%
FOR I% = 1 TO commax
IF find$ + thekey$ = combo(I%) THEN
  newhex$ = comhex(I%)
  gotit = 0
  CALL suggest(combo(I%), curr, thekey$, o%)
  IF gotit = 1 THEN GOSUB printhex: GOTO 99
END IF
NEXT I%
54
NEXT o%


16
IF curr < max THEN no = 0: CALL hexequiv(thekey$, curr)
165
IF curr < max THEN IF no = 0 THEN GOSUB printhex: curr = curr + 1: GOTO 13
GOTO 12
13
99
lastkey2$ = lastkey1$
lastkey1$ = thekey$
12
thekeybak$ = thekey$
thekey$ = ""
LOOP WHILE thekeybak$ <> CHR$(27)

GOTO writepos




printhex:
CLS
LOCATE 2, 1
PRINT "Type your text in here.  Press ESC to save/return to the main hexeditor."
LOCATE 4, 1
PRINT "[";
I% = 1
DO WHILE I% < max
IF hex(I%) <> "" THEN
  k% = I%
  FOR o% = 1 TO LEN(hex(I%)) / 2
  PRINT MID$(hex(k%), o% * 2 - 1, 2);
  I% = I% + 1
  IF I% < max THEN PRINT "";
  NEXT o%
ELSEIF hex(I%) = "" THEN PRINT "  "; : I% = I% + 1: IF I% < max THEN PRINT "";
END IF

LOOP
PRINT "]";

cntrr% = 0
LOCATE 15, 1
FOR I% = 1 TO max - 1
IF LEN(text(I%)) = 1 THEN COLOR 4
IF LEN(text(I%)) = 2 THEN COLOR 12
IF LEN(text(I%)) = 3 THEN COLOR 7
IF LEN(text(I%)) > 3 THEN COLOR 14


IF LEN(text(I%)) <> 1 THEN
  cntrr% = cntrr% + (LEN(text(I%)))
ELSE cntrr% = cntrr% + 1
END IF

IF text(I%) = CHR$(13) THEN PRINT cntrr% - 1; : cntrr% = 0
IF text(I%) <> "" THEN PRINT text(I%);
NEXT I%
COLOR 15
PRINT "_";
RETURN

writepos:
FOR I% = 1 TO max
IF LEN(hex(I%)) = 2 THEN fin$ = fin$ + CHR$(hexx(hex(I%)))
IF LEN(hex(I%)) = 4 THEN fin$ = fin$ + CHR$(hexx(LEFT$(hex(I%), 2))) + CHR$(hexx(RIGHT$(hex(I%), 2)))
NEXT I%
PUT #1, begn, fin$
CLS
PRINT "Done!";
begn = 0: ennd = 0

END SUB

SUB finddd (fin$)
ERASE hex
ERASE text

CLS
max = 30
curr = 1
hex(curr) = ""
GOSUB printhex2



DO
111
WHILE thekey$ = ""
thekey$ = INKEY$
WEND
IF thekey$ = CHR$(0) + CHR$(29) THEN
   PRINT "ffffffff": SLEEP
ELSEIF thekey$ = "`" THEN
   IF curr < max THEN CALL addhex(curr): GOSUB printhex2: GOTO 121
ELSEIF thekey$ = "~" THEN
   IF yg = 0 THEN LOCATE 1, 1: PRINT "Ask:Y": yg = 1: GOTO 121
   IF yg = 1 THEN LOCATE 1, 1: PRINT "Ask:N": yg = 0: GOTO 121
ELSEIF thekey$ = "{" THEN
   IF bit16 = 0 THEN LOCATE 1, 1: PRINT "16bit:Y": bit16 = 1: GOTO 121
   IF bit16 = 1 THEN LOCATE 1, 1: PRINT "16bit:N": bit16 = 0: GOTO 121

ELSEIF thekey$ = CHR$(8) THEN
  IF curr = 1 THEN GOSUB printhex2: GOTO 121
  oki = 0
  DO WHILE oki = 0
  curr = curr - 1
  IF hex(curr) <> "" THEN oki = 1
  LOOP
  hex(curr) = "": text(curr) = "": GOSUB printhex2: GOTO 121
END IF

FOR u% = 1 TO dblmax
dblstuff$ = ""
FOR y% = u% TO 1 STEP -1
IF curr > y% THEN dblstuff$ = dblstuff$ + text(curr - (y%))
7876
NEXT y%
dblstuff$ = dblstuff$ + thekey$

FOR o% = 1 TO dblmax
IF dblstuff$ = dbl(o%) THEN
newhex$ = dblhex(o%)
  CALL suggest(dbl(o%), curr, thekey$, u%)
IF gotit = 1 THEN GOSUB printhex2: GOTO 997
END IF
NEXT o%
NEXT u%




IF curr < 2 THEN GOTO 161
FOR o% = maxmix TO 1 STEP -1
IF (curr - o% < 1) THEN GOTO 541
find$ = ""
FOR p% = o% TO 1 STEP -1
find$ = find$ + text(curr - p%)
NEXT p%
FOR I% = 1 TO commax
IF find$ + thekey$ = combo(I%) THEN
  newhex$ = comhex(I%)
  gotit = 0
  CALL suggest(combo(I%), curr, thekey$, o%)
  IF gotit = 1 THEN GOSUB printhex2: GOTO 997
END IF
NEXT I%
541
NEXT o%


161
IF curr < max THEN no = 0: CALL hexequiv(thekey$, curr)
1654
IF curr < max THEN IF no = 0 THEN GOSUB printhex2: curr = curr + 1: GOTO 131
GOTO 121
131
997
lastkey2$ = lastkey1$
lastkey1$ = thekey$
121
thekeybak$ = thekey$
thekey$ = ""
LOOP WHILE thekeybak$ <> CHR$(27)

GOTO writepos2




printhex2:
CLS
LOCATE 2, 1
PRINT "Type your text in here.  Press ESC to save/return to the main hexeditor."
LOCATE 4, 1
PRINT "[";
I% = 1
DO WHILE I% < max
IF hex(I%) <> "" THEN
  k% = I%
  FOR o% = 1 TO LEN(hex(I%)) / 2
  PRINT MID$(hex(k%), o% * 2 - 1, 2);
  I% = I% + 1
  IF I% < max THEN PRINT "";
  NEXT o%
  I% = k% + 1
ELSEIF hex(I%) = "" THEN
 PRINT "  ";
 I% = I% + 1
 IF I% < max THEN PRINT "";
END IF
LOOP
PRINT "]";

cntrr% = 0
LOCATE 15, 1
FOR I% = 1 TO max - 1
IF LEN(text(I%)) = 1 THEN COLOR 4
IF LEN(text(I%)) = 2 THEN COLOR 12
IF LEN(text(I%)) = 3 THEN COLOR 7
IF LEN(text(I%)) > 3 THEN COLOR 14


IF LEN(text(I%)) <> 1 THEN
  cntrr% = cntrr% + (LEN(text(I%)))
ELSE cntrr% = cntrr% + 1
END IF

IF text(I%) = CHR$(13) THEN PRINT cntrr% - 1; : cntrr% = 0
IF text(I%) <> "" THEN PRINT text(I%);
NEXT I%
COLOR 15
PRINT "_";
RETURN

writepos2:
FOR I% = 1 TO max
IF LEN(hex(I%)) = 2 THEN fin$ = fin$ + CHR$(hexx(hex(I%)))
IF LEN(hex(I%)) = 4 THEN fin$ = fin$ + CHR$(hexx(LEFT$(hex(I%), 2))) + CHR$(hexx(RIGHT$(hex(I%), 2)))
NEXT I%
'CLS
'PRINT "Searching...press any key to abort"
begn = 0: ennd = 0
END SUB

SUB hexequiv (thekey$, curr) STATIC
       gyt = 0
       FOR I% = 1 TO 300
       IF thekey$ = combo(I%) THEN hex(curr) = comhex(I%): gyt = 1
       NEXT I%
       
       IF LEN(thekey$) > 1 AND gyt = 0 THEN
       IF ASC(MID$(thekey$, 2, 1)) = 58 THEN
            hex(curr) = "00": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 59 THEN hex(curr) = "01": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 60 THEN hex(curr) = "02": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 61 THEN hex(curr) = "03": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 62 THEN hex(curr) = "04": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 63 THEN hex(curr) = "05": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 64 THEN hex(curr) = "06": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 65 THEN hex(curr) = "07": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 66 THEN hex(curr) = "08": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 67 THEN hex(curr) = "09": gyt = 1
        ELSEIF ASC(MID$(thekey$, 2, 1)) = 68 THEN hex(curr) = "00": gyt = 1
          END IF
       END IF
       IF thekey$ = CHR$(13) AND gyt = 0 THEN hex(curr) = newlhex: gyt = 1
       IF gyt = 0 THEN no = 1: GOTO endsu
        text(curr) = thekey$
endsu:
END SUB

FUNCTION hexx (text$)

I = 1
temp1$ = ""
temp2$ = ""
final = 0
gh = LEN(text$)
DO WHILE I < gh + 1
temp1$ = MID$(text$, I, 1)

IF ASC(temp1$) > 47 AND ASC(temp1$) < 58 THEN
 tt(I) = VAL(temp1$)
ELSEIF UCASE$(temp1$) = "A" THEN
  tt(I) = 10
ELSEIF UCASE$(temp1$) = "B" THEN
  tt(I) = 11
ELSEIF UCASE$(temp1$) = "C" THEN
  tt(I) = 12
ELSEIF UCASE$(temp1$) = "D" THEN
  tt(I) = 13
ELSEIF UCASE$(temp1$) = "E" THEN
  tt(I) = 14
ELSEIF UCASE$(temp1$) = "F" THEN
  tt(I) = 15
ELSE
  tt(I) = -1: gh = I - 1: GOTO 23
END IF
I = I + 1
LOOP
23
I = 1
k = 1
FOR I = 1 TO gh
IF tt(I) = -1 THEN GOTO 34
final = final + tt(I) * (16 ^ (gh - I))

NEXT I
34
hexx = final

END FUNCTION

SUB insert (begn, ennd, begn2)
DIM tu AS STRING
DIM ta AS LONG
DIM done1 AS STRING
DIM tempx AS STRING
DIM done2 AS STRING
DIM I AS LONG
DIM end1 AS LONG
DIM ci AS LONG

code$ = " "
ta = begn
end1 = ennd
WHILE ta < end1
ts$ = " "
tu = " "
tpos = ta
ci = begn2

GET #4, tpos, tu

IF pointbegin <> 0 THEN

IF header = 0 THEN done1 = RIGHT$(HEX$(ci - begn2), 2)
IF header = 0 THEN done2 = HEX$(INT((ci - begn2) / 256))
IF header > 0 THEN done1 = RIGHT$(HEX$(ci - header), 2)
IF header > 0 THEN done2 = LEFT$(RIGHT$(HEX$(ci - header), 4), 2)
IF LEN(done1) = 1 THEN done1 = "0" + done1
IF LEN(done2) = 1 THEN done2 = "0" + done2
pointfinal$ = pointfinal$ + CHR$(hexx(done1)) + CHR$(hexx(done2))
END IF


WHILE tpos < end1 + 1
link = 0
tpos = tpos + 1
tab1 = ASC(tu)
FOR o% = 1 TO 257
IF combo(o%) <> "" AND LEN(combo(o%)) = 1 THEN
IF tab1 = 13 THEN ts$ = CHR$(hexx(newlhex)): tpos = tpos + 1: EXIT FOR
IF tab1 = ASC(combo(o%)) THEN ts$ = CHR$(hexx(comhex(o%))): EXIT FOR
END IF
NEXT o%

IF ASC(tu) = 10 THEN link = 1
IF ASC(tu) = 60 THEN link = 2

IF link = 0 THEN PUT #1, ci + 1, ts$: ci = ci + LEN(ts$)

GET #4, tpos, tu

IF link = 2 THEN
  IF tu = "L" THEN
    tua$ = "        "
    GET #4, tpos, tua$
    tempx = CHR$(24)
    PUT #1, ci + 1, tempx: ci = ci + 1
    tempx = CHR$(hexx(MID$(tua$, 6, 2)))
    PUT #1, ci + 1, tempx: ci = ci + 1
    tpos = tpos + 8
    GET #4, tpos, tu

  ELSEIF tu = "E" THEN
    tempx = CHR$(comend - 1)
    PUT #1, ci + 1, tempx: ci = ci + 1
    tpos = tpos + 6
    GET #4, tpos, tu

IF pointbegin <> 0 THEN
IF header = 0 THEN done1 = RIGHT$(HEX$(ci - begn2), 2)
IF header = 0 THEN done2 = HEX$(INT((ci - begn2) / 256))
IF header > 0 THEN done1 = RIGHT$(HEX$(ci - header), 2)
IF header > 0 THEN done2 = LEFT$(RIGHT$(HEX$(ci - header), 4), 2)
IF LEN(done1) = 1 THEN done1 = "0" + done1
IF LEN(done2) = 1 THEN done2 = "0" + done2
IF LOF(4) > tpos + 7 THEN pointfinal$ = pointfinal$ + CHR$(hexx(done1)) + CHR$(hexx(done2))
END IF
   

  ELSEIF tu = "$" THEN
    tpos = tpos + 1
    tua$ = "  "
    GET #4, tpos, tua$
    tempx = CHR$(hexx(tua$))
    PUT #1, ci + 1, tempx: ci = ci + 1
    tpos = tpos + 3
    bina = bina + 1
    GET #4, tpos, tu

  ELSEIF tu = "D" THEN
    IF nodte = 0 THEN
      nodte = 1
    ELSEIF nodte = 1 THEN nodte = 0
    END IF
    tpos = tpos + 6
    GET #4, tpos, tu

  END IF
END IF


5766
IF nodte = 0 THEN
tu2$ = " "
GET #4, tpos, ts$
GET #4, tpos + 1, tu2$


FOR r% = 1 TO commax

IF ts$ + tu2$ = combo(r%) THEN
  tempx = CHR$(hexx(comhex(r%)))
  PUT #1, ci + 1, tempx: ci = ci + 1
  tpos = tpos + 2
  GET #4, tpos, tu
  GOTO 5766
END IF

NEXT r%
END IF

ts$ = " "
tu2$ = " "
WEND


ta = tpos + 1
ts$ = ""


WEND
'PUT #1, begn2 + 1, opi$
IF pointbegin <> 0 THEN PUT #1, pointbegin, pointfinal$

END SUB

FUNCTION lightbar (xmax)
'CLS

gray = 7
hifile = 14
lofile = 15



count = 1

GOSUB redraw
GOSUB getinput


redraw:
FOR curr% = 1 TO xmax
LOCATE menuline(curr%), menucol(curr%)
COLOR gray
PRINT menutext(curr%);

NEXT curr%

LOCATE menuline(count), menucol(count)
COLOR hifile
PRINT menutext(count)
RETURN


getinput:
WHILE ok = 0

KEY(11) ON
KEY(14) ON
DO

ink$ = INKEY$
LOOP WHILE ink$ = ""

IF MID$(ink$, 2, 1) = "H" THEN GOSUB goup
IF MID$(ink$, 2, 1) = "P" THEN GOSUB godown

IF ink$ = CHR$(13) THEN COLOR lofile: lightbar = count: GOTO enddasub
WEND

godown:
IF count >= xmax THEN
LOCATE menuline(count), menucol(count)
COLOR gray
PRINT menutext(count);
LOCATE menuline(1), menucol(1)
COLOR hifile
PRINT menutext(1)
count = 1

ELSE
LOCATE menuline(count), menucol(count)
COLOR gray
PRINT menutext(count);
LOCATE menuline(count + 1), menucol(count + 1)
COLOR hifile
PRINT menutext(count + 1)
count = count + 1
END IF
RETURN


goup:
IF count <= 1 THEN
LOCATE menuline(count), menucol(count)
COLOR gray
PRINT menutext(count);
LOCATE menuline(xmax), menucol(xmax)
COLOR hifile
PRINT menutext(xmax)
count = xmax

ELSE
LOCATE menuline(count), menucol(count)
COLOR gray
PRINT menutext(count);
LOCATE menuline(count - 1), menucol(count - 1)
COLOR hifile
PRINT menutext(count - 1)
count = count - 1
END IF
RETURN

enddasub:
END FUNCTION

SUB pointerdump (ptbegn, ptend, txtbegn)
DIM tpr1 AS STRING
DIM tpr2 AS STRING
DIM tpr3 AS STRING

DIM tu AS STRING
DIM tu2 AS STRING
DIM tu3 AS STRING
DIM ta AS LONG
DIM I AS LONG
DIM end1 AS LONG

eh$ = CHR$(hexx(endhex))
doeh = 0
IF endhex <> "  " THEN doeh = 1
CLS
link = 0
INPUT "Output file?", opf$
OPEN opf$ FOR OUTPUT AS #3

ts = ""

tpr1 = " "
tpr2 = " "
tpr3 = " "

GET #1, ptbegn, tpr1
GET #1, ptbegn + 1, tpr2
GET #1, ptbegn + 2, tpr3
atpr1$ = RIGHT$("00" + HEX$(ASC(tpr1)), 2)
atpr2$ = RIGHT$("00" + HEX$(ASC(tpr2)), 2)
IF pointerdump24bits = 1 THEN atpr3$ = RIGHT$("00" + HEX$(ASC(tpr3)), 2)
lk$ = atpr3$ + atpr2$ + atpr1$
firstptr = hexx(lk$)


WHILE ptbegn < ptend
tpr1 = " "
tpr2 = " "
tpr3 = " "

tu3 = " "
tu2 = " "
tu = " "

GET #1, ptbegn, tpr1
GET #1, ptbegn + 1, tpr2
GET #1, ptbegn + 2, tpr3
atpr1$ = RIGHT$("00" + HEX$(ASC(tpr1)), 2)
atpr2$ = RIGHT$("00" + HEX$(ASC(tpr2)), 2)
IF pointerdump24bits = 1 THEN atpr3$ = RIGHT$("00" + HEX$(ASC(tpr3)), 2)
lk$ = atpr3$ + atpr2$ + atpr1$
ta = txtbegn - firstptr + hexx(lk$)

IF pointerdump24bits = 0 THEN ptbegn = ptbegn + 2
IF pointerdump24bits = 1 THEN ptbegn = ptbegn + 3
tpos = ta
GET #1, tpos, tu
GET #1, tpos - 1, tu2
GET #1, tpos + 1, tu3

WHILE (ASC(tu) <> ASC(eh$) OR doeh = 0) AND tpos < LOF(1)
tpos = tpos + 1


this$ = HEX$(ASC(tu))
this2$ = HEX$(ASC(tu3))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF LEN(this2$) = 1 THEN this2$ = "0" + this2$
FOR o% = 1 TO commax
IF comhex(o%) = this$ THEN ts = combo(o%): GOTO endosub10
NEXT o%
FOR o% = 1 TO dblmax
IF dblhex(o%) = this$ + this2$ THEN ts = dbl(o%): tpos = tpos + 1: GOTO endosub20
NEXT o%
this$ = HEX$(ASC(tu))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF skipnon = 0 THEN ts = "<$" + this$ + ">"
endosub10:
IF this$ = newlhex OR this$ = newlhex2 THEN ts = CHR$(13) + CHR$(10)

endosub20:
IF daku = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 1)
daku = 0
link = 0
END IF

IF handa = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 2)
handa = 0
link = 0
END IF


FOR r% = 1 TO linkmax
IF ASC(tu) = link(r%) AND ASC(tu) <> 0 THEN
link = 1
hexamt = linkamt(r%)
GOTO endlink2
END IF
NEXT r%
endlink2:

IF dodaku = 1 THEN
IF ASC(tu) = dak THEN daku = 1: link = -1
IF ASC(tu3) = dak AND dakfront = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 1)
daku = 0
link = 0
tpos = tpos + 1
END IF

IF ASC(tu) = hand THEN handa = 1: link = -1
IF ASC(tu3) = hand AND dakfront = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 2)
handa = 0
link = 0
tpos = tpos + 1
END IF

END IF



IF link = 1 THEN
this$ = HEX$(ASC(tu))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF skipnon = 0 THEN PRINT #3, "<$" + this$ + ">";
END IF

IF link = 0 THEN PRINT #3, ts;

GET #1, tpos, tu
GET #1, tpos - 1, tu2
GET #1, tpos + 1, tu3

IF link = 1 THEN
FOR he% = 1 TO hexamt
 hexie(he%) = HEX$(ASC(tu))
 IF LEN(hexie(he%)) = 1 THEN hexie(he%) = "0" + HEX$(ASC(tu))
 tpos = tpos + 1
 GET #1, tpos, tu
 GET #1, tpos - 1, tu2
NEXT he%
FOR he% = 1 TO hexamt
IF skipnon = 0 THEN PRINT #3, "<$" + hexie(he%) + ">";
NEXT he%
link = 0
END IF


ts = ""
WEND

PRINT #3, "<END>"
WEND

CLOSE #3
END SUB

SUB pointers
code$ = " "

done1$ = RIGHT$(HEX$(b2 + 1), 2)
done2$ = HEX$(INT((b2 + 1 - textbegin) / 256))

IF LEN(done1$) = 1 THEN done1$ = "0" + done1$
IF LEN(done2$) = 1 THEN done2$ = "0" + done2$


'pointfinal$ = pointfinal$ + hexx(done1$) + hexx(done2$)


DO UNTIL b2 > textend - 1

fghi:
DO
oldcode$ = code$
b2 = b2 + 1
GET #1, b2, code$
IF ASC(code$) = 4 THEN b2 = b2 + 1
IF ASC(code$) = 3 THEN b2 = b2 + 1
LOOP UNTIL (ASC(code$) = 0 OR b2 > textend - 1)

IF b2 > textend - 1 THEN GOTO enditalready

done1$ = RIGHT$(HEX$(b2), 2)
done2$ = HEX$(INT((b2 - textbegin) / 256))

IF LEN(done1$) = 1 THEN done1$ = "0" + done1$
IF LEN(done2$) = 1 THEN done2$ = "0" + done2$

finished$ = finished$ + done1$ + done2$
'CALL hexx(done1$)
'pointfinal$ = pointfinal$ + final
'CALL hexx(done2$)
'pointfinal$ = pointfinal$ + final
LOOP

enditalready:
PUT #1, pointbegin, pointfinal$
END SUB

SUB suggest (letter$, curr, thekey$, lenletter%) STATIC
IF yg = 1 THEN
98
LOCATE 1, 10
PRINT "I suggest using the " + CHR$(34) + letter$ + CHR$(34) + " tile...put it in? "
DO
newkey$ = INKEY$
LOOP UNTIL newkey$ <> ""
IF UCASE$(newkey$) = "N" THEN
  gotit = 0
  GOTO endsub
ELSEIF UCASE$(newkey$) = "Y" THEN
  gotit = 1
  FOR I% = 1 TO (LEN(letter$)) - 1
  curr = curr - 1
  hex(curr) = ""
  text(curr) = ""
  NEXT I%
    hex(curr) = newhex$
  PRINT newhex$: PRINT curr: SLEEP
  text(curr) = letter$
  curr = curr + LEN(newhex$) / 2: GOTO endsub
ELSE GOTO 98
END IF

ELSEIF yg = 0 THEN
  gotit = 1
  FOR I% = 1 TO lenletter%
  curr = curr - 1
  hex(curr) = ""
  text(curr) = ""
  NEXT I%
    hex(curr) = newhex$
  text(curr) = letter$
  curr = curr + LEN(newhex$) / 2: GOTO endsub
END IF

endsub:
END SUB

SUB Table
maxmix = 1
DO
pos2 = pos2 + 1
IF LEN(COMMAND$) < pos2 OR MID$(COMMAND$, pos2, 1) = " " THEN fillnamm = MID$(COMMAND$, 1, pos2): GOTO efd
LOOP WHILE fillnamm = ""
efd:
pos3 = pos2
DO
pos3 = pos3 + 1
IF LEN(COMMAND$) < pos3 OR MID$(COMMAND$, pos3, 1) = " " THEN tbl = MID$(COMMAND$, pos2 + 1, pos3 - pos2): GOTO efd2
LOOP WHILE tbl = ""
efd2:
pos4 = pos3
DO
pos4 = pos4 + 1
IF LEN(COMMAND$) < pos4 OR MID$(COMMAND$, pos4, 1) = " " THEN tbl2$ = MID$(COMMAND$, pos3 + 1, pos4 - pos3): GOTO efd3
LOOP WHILE tbl2$ = ""
efd3:
IF fillnamm = "" THEN INPUT "filename?", fillnamm

IF tbl = "" THEN
INPUT "Table?", tbl
INPUT "Second table (optional)?", tbl2$
END IF
OPEN tbl FOR INPUT AS #2
CLOSE #2
OPEN tbl FOR BINARY AS #2
GOSUB 564
FOR I% = 1 TO 300
SWAP jap(I%), combo(I%)
SWAP japhex(I%), comhex(I%)
NEXT I%
SWAP japend, comend
SWAP japend2, comend2
SWAP japnewl, comnewl
SWAP japnewl2, comnewl2
SWAP jnewlhex, newlhex
SWAP jnewlhex2, newlhex2
SWAP endhex, jendhex
SWAP endhex2, jendhex2

IF tbl2$ = "" THEN GOTO 566
OPEN tbl2$ FOR INPUT AS #2
CLOSE #2
OPEN tbl2$ FOR BINARY AS #2
GOSUB 564
566
FOR I% = 1 TO 300
SWAP combo(I%), jap(I%)
SWAP comhex(I%), japhex(I%)
NEXT I%
SWAP comend, japend
SWAP comend2, japend2
SWAP comnewl, japnewl
SWAP comnewl2, japnewl2
SWAP jnewlhex, newlhex
SWAP jnewlhex2, newlhex2
SWAP endhex, jendhex
SWAP endhex2, jendhex2
GOTO 565
564
newlhex = "  "
endhex = "  "
newlhex2 = "  "
endhex2 = "  "
tpos = 1
dak1$ = "  "
hand1$ = "  "
byte1$ = "     "
byte2$ = " "
r = 1
h = 1
I% = 1
DO UNTIL tpos > LOF(2)
enter = 0

GET #2, tpos, byte1$


IF LEFT$(byte1$, 1) = "$" THEN
GET #2, tpos + 1, byte1$
link(r) = hexx(byte1$)
GET #2, tpos + 4, byte1$
linkamt(r) = VAL(LEFT$(byte1$, 1))
tpos = tpos + 7
r = r + 1
GOTO et
END IF

IF LEFT$(byte1$, 1) = "(" THEN
addrr$ = ""
fx = fx + 1
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = ")" OR tpos = LOF(2) THEN EXIT DO
addrr$ = addrr$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(addrr$, 1)) = "H" THEN
  bkmark(fx) = hexx(LEFT$(addrr$, LEN(addrr$) - 1))
ELSE
  bkmark(fx) = VAL(addrr$)
END IF
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = CHR$(13) OR tpos = LOF(2) THEN EXIT DO
bktext(fx) = bktext(fx) + byte2$
tpos = tpos + 1
LOOP
lmax = lmax + 1
tpos = tpos + 2
GOTO et
END IF

IF LEFT$(byte1$, 1) = "[" THEN
addrr$ = ""
fx2 = fx2 + 1
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = "-" OR tpos = LOF(2) THEN EXIT DO
addrr$ = addrr$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(addrr$, 1)) = "H" THEN
  dmarkst(fx2) = hexx(LEFT$(addrr$, LEN(addrr$) - 1))
ELSE
  dmarkst(fx2) = VAL(addrr$)
END IF
tpos = tpos + 1
addrr$ = ""
DO
GET #2, tpos, byte2$
IF byte2$ = "]" OR tpos = LOF(2) THEN EXIT DO
addrr$ = addrr$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(addrr$, 1)) = "H" THEN
  dmarkend(fx2) = hexx(LEFT$(addrr$, LEN(addrr$) - 1))
ELSE
  dmarkend(fx2) = VAL(addrr$)
END IF
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = CHR$(13) OR tpos = LOF(2) THEN EXIT DO
dtext(fx2) = dtext(fx2) + byte2$
tpos = tpos + 1
LOOP
tmax = tmax + 1
tpos = tpos + 2
GOTO et
END IF

IF LEFT$(byte1$, 1) = "{" THEN
addrr$ = ""
fx3 = fx3 + 1
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = "-" OR tpos = LOF(2) THEN EXIT DO
addrr$ = addrr$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(addrr$, 1)) = "H" THEN
  insmark(fx3) = hexx(LEFT$(addrr$, LEN(addrr$) - 1))
ELSE
  insmark(fx3) = VAL(addrr$)
END IF
tpos = tpos + 1
addrr$ = ""
DO
GET #2, tpos, byte2$
IF byte2$ = "}" OR tpos = LOF(2) THEN EXIT DO
addrr$ = addrr$ + byte2$
tpos = tpos + 1
LOOP
insname(fx3) = addrr$
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = CHR$(13) OR tpos = LOF(2) THEN EXIT DO
instext(fx3) = instext(fx3) + byte2$
tpos = tpos + 1
LOOP
imax = imax + 1
tpos = tpos + 2
GOTO et
END IF

IF LEFT$(byte1$, 1) = ">" THEN
dakfront = 1
tpos = tpos + 3
GOTO et
END IF

IF LEFT$(byte1$, 1) = "#" THEN
skipnon = 1
tpos = tpos + 3
GOTO et
END IF


IF LEFT$(byte1$, 1) = CHR$(13) THEN
tpos = tpos + 2
GOTO et
END IF


IF LEFT$(byte1$, 1) = "!" THEN
GET #2, tpos + 1, dak1$
dak = hexx(dak1$)
tpos = tpos + 5
dodaku = 1
GOTO et
END IF

IF LEFT$(byte1$, 1) = "@" THEN
GET #2, tpos + 1, hand1$
hand = hexx(hand1$)
tpos = tpos + 5
dodaku = 1
GOTO et
END IF


IF LEFT$(byte1$, 1) = "*" THEN
IF comnewl = 0 THEN
GET #2, tpos + 1, newlhex
g = hexx(newlhex)
combo(g + 1) = "*": comhex(g + 1) = newlhex
comnewl = g + 1
END IF
IF comnewl > 0 THEN
GET #2, tpos + 1, newlhex2
g = hexx(newlhex2)
combo(g + 1) = "*": comhex(g + 1) = newlhex2
comnewl2 = g + 1
END IF
tpos = tpos + 5
commax = commax + 1
GOTO et
END IF

IF LEFT$(byte1$, 1) = "/" THEN
IF comend = 0 THEN
GET #2, tpos + 1, endhex
f = hexx(endhex)
combo(f + 1) = "/": comhex(f + 1) = endhex
comend = f + 1
END IF
IF comend > 0 THEN
GET #2, tpos + 1, endhex2
f = hexx(endhex2)
combo(f + 1) = "/": comhex(f + 1) = endhex2
comend2 = f + 1
END IF
tpos = tpos + 5
commax = commax + 1
GOTO et
END IF

IF LEFT$(byte1$, 1) = "&" THEN
dabyte$ = ""
tpos = tpos + 1
DO
GET #2, tpos, byte2$
IF byte2$ = "-" OR tpos = LOF(2) THEN EXIT DO
dabyte$ = dabyte$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(dabyte$, 1)) = "H" THEN
  pointbegin = hexx(LEFT$(dabyte$, LEN(dabyte$) - 1)) + 1
ELSE
  pointbegin = VAL(dabyte$) + 1
END IF
tpos = tpos + 1
dabyte$ = ""
DO
GET #2, tpos, byte2$
IF byte2$ = CHR$(13) OR tpos = LOF(2) THEN EXIT DO
dabyte$ = dabyte$ + byte2$
tpos = tpos + 1
LOOP
IF UCASE$(RIGHT$(dabyte$, 1)) = "H" THEN
  header = hexx(LEFT$(dabyte$, LEN(dabyte$) - 1))
ELSE
  header = VAL(dabyte$)
END IF

GOTO et
END IF

IF MID$(byte1$, 3, 1) = "=" THEN
fb = hexx(LEFT$(byte1$, 2))
j = fb
comhex(j + 1) = LEFT$(byte1$, 2)
tpos = tpos + 3

ELSEIF MID$(byte1$, 5, 1) = "=" THEN
dblhex(h) = LEFT$(byte1$, 4)
tpos = tpos + 5
do3 = 1
END IF

dabyte$ = ""
chr = 1
DO
GET #2, tpos, byte2$
IF byte2$ = CHR$(13) OR tpos = LOF(2) THEN EXIT DO
dabyte$ = dabyte$ + byte2$
tpos = tpos + 1
chr = chr + 1
LOOP

IF chr > maxmix THEN maxmix = chr

IF do3 = 0 THEN
combo(j + 1) = dabyte$: tpos = tpos + 2: commax = commax + 1
END IF

IF do3 = 1 THEN
dbl(h) = dabyte$: tpos = tpos + 2: dblmax = dblmax + 1
h = h + 1
do3 = 0
END IF
et:
I% = I% + 1
LOOP
CLOSE #2
commax = 275
linkmax = 20
RETURN
565
FOR t% = 1 TO 275
NEXT t%

END SUB

SUB td (begn, ennd)
eh$ = CHR$(hexx(endhex))
doeh = 0
IF endhex <> "  " THEN doeh = 1
CLS
link = 0
INPUT "Output file?", opf$
OPEN opf$ FOR OUTPUT AS #3

DIM tu AS STRING
DIM tu2 AS STRING
DIM tu3 AS STRING
DIM ta AS LONG
DIM I AS LONG
DIM end1 AS LONG
ts = ""
ta = begn
end1 = ennd
WHILE ta < end1

tu3 = " "
tu2 = " "
tu = " "
tpos = ta

GET #1, tpos, tu
GET #1, tpos - 1, tu2
GET #1, tpos + 1, tu3
WHILE (ASC(tu) <> ASC(eh$) OR doeh = 0) AND tpos < end1 + 1
tpos = tpos + 1


this$ = HEX$(ASC(tu))
this2$ = HEX$(ASC(tu3))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF LEN(this2$) = 1 THEN this2$ = "0" + this2$
FOR o% = 1 TO commax
IF comhex(o%) = this$ THEN ts = combo(o%): GOTO endosub
NEXT o%
FOR o% = 1 TO dblmax
IF dblhex(o%) = this$ + this2$ THEN ts = dbl(o%): tpos = tpos + 1: GOTO endosub2
NEXT o%
this$ = HEX$(ASC(tu))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF skipnon = 0 THEN ts = "<$" + this$ + ">"
endosub:
IF this$ = newlhex OR this$ = newlhex2 THEN ts = CHR$(13) + CHR$(10)

endosub2:
IF daku = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 1)
daku = 0
link = 0
END IF

IF handa = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 2)
handa = 0
link = 0
END IF


FOR r% = 1 TO linkmax
IF ASC(tu) = link(r%) AND ASC(tu) <> 0 THEN
link = 1
hexamt = linkamt(r%)
GOTO endlink
END IF
NEXT r%
endlink:

IF dodaku = 1 THEN
IF ASC(tu) = dak THEN daku = 1: link = -1
IF ASC(tu3) = dak AND dakfront = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 1)
daku = 0
link = 0
tpos = tpos + 1
END IF

IF ASC(tu) = hand THEN handa = 1: link = -1
IF ASC(tu3) = hand AND dakfront = 1 THEN
ts2 = MID$(ts, 2, 1)
MID$(ts, 2) = CHR$(ASC(ts2) + 2)
handa = 0
link = 0
tpos = tpos + 1
END IF

END IF



IF link = 1 THEN
this$ = HEX$(ASC(tu))
IF LEN(this$) = 1 THEN this$ = "0" + this$
IF skipnon = 0 THEN PRINT #3, "<$" + this$ + ">";
END IF

IF link = 0 THEN PRINT #3, ts;

GET #1, tpos, tu
GET #1, tpos - 1, tu2
GET #1, tpos + 1, tu3

IF link = 1 THEN
FOR he% = 1 TO hexamt
 hexie(he%) = HEX$(ASC(tu))
 IF LEN(hexie(he%)) = 1 THEN hexie(he%) = "0" + HEX$(ASC(tu))
 tpos = tpos + 1
 GET #1, tpos, tu
 GET #1, tpos - 1, tu2
NEXT he%
FOR he% = 1 TO hexamt
IF skipnon = 0 THEN PRINT #3, "<$" + hexie(he%) + ">";
NEXT he%
link = 0
END IF


ts = ""
WEND

ta = tpos + 1

PRINT #3, "<END>"
WEND
CLOSE #2
CLOSE #3
begn = 0: ennd = 0
END SUB

SUB td2
tpos = 1
INPUT "Jap table?", tbl$
OPEN tbl$ FOR BINARY AS #2
byte1$ = "  "
byte2$ = "  "
I% = 1
DO UNTIL tpos > LOF(2) - 2
enter = 0

GET #2, tpos, byte1$

japhex(I%) = byte1$

tpos = tpos + 3

GET #2, tpos, byte2$
IF RIGHT$(byte2$, 1) = CHR$(13) THEN enter = 1
IF enter = 1 THEN jap(I%) = LEFT$(byte2$, 1): tpos = tpos + 3
IF enter = 0 THEN jap(I%) = byte2$: tpos = tpos + 4

et2:
I% = I% + 1
LOOP
CLOSE #2
END SUB

SUB tdbak
OPEN "mother2.euc" FOR BINARY AS #2
OPEN "output.euc" FOR OUTPUT AS #3
DIM ts(1 TO 2) AS STRING
DIM tu AS STRING
DIM ta AS LONG
DIM I AS LONG
DIM end1 AS LONG

ta = begn
end1 = ennd
WHILE ta < end1
ts(1) = " "
ts(2) = " "
tu = " "
tpos = ta

GET #1, tpos, tu
WHILE tu <> CHR$(0) AND tpos < end1 + 1
tpos = tpos + 1
tab1 = ((ASC(tu) * 2)) + 1
GET #2, tab1, ts(1)
GET #2, tab1 + 1, ts(2)

IF ASC(tu) = 33 THEN link = 1: hexamt = 2
IF ASC(tu) = 35 THEN link = 1: hexamt = 4
IF ASC(tu) = 2 THEN link = 1: hexamt = 1

IF link = 1 THEN PRINT #3, "<$" + ts(1) + ts(2) + ">";
IF link = 0 THEN PRINT #3, ts(1) + ts(2);

GET #1, tpos, tu

IF link = 1 THEN
FOR he% = 1 TO hexamt
 hexie(he%) = HEX$(ASC(tu))
 IF LEN(hexie(he%)) = 1 THEN hexie(he%) = "0" + HEX$(ASC(tu))
 tpos = tpos + 1
 GET #1, tpos, tu
NEXT he%
FOR he% = 1 TO hexamt
 PRINT #3, "<$" + hexie(he%) + ">";
NEXT he%
link = 0
END IF


ts(2) = " "
WEND

ta = tpos + 1
ts(1) = ""
ts(2) = ""

PRINT #3, "<END>"
WEND
CLOSE #2
CLOSE #3
END SUB

