" Vim syntax file
" Language:    QB64
" Maintainer:  Troy Brumley <blametroi@gmail.com>
" Updated:     In progress 26 December 2018
"
" Description:
"
"   I started this from the freebasic.vim file by Mark Manning. His
"   qb64 support is fine but I wanted to roll my own to learn
"   how to create a syntax definition. QB64 (see https://qb64.org/)
"   is QB4.5 brought into a more modern age with significant support
"   for updated graphics and memorty while providing backward
"   compatability with QB4.5.
"
"   Please see the freebasic.vim file for a detailed history of
"   the changes made there. Manning's work is well commented. I'm
"   just building off what he did.
"
"   base: freebasic.vim, Mark Manning <markem@airmail.net>, 10/22/2006.
"
if exists("b:current_syntax")
  finish
endif
"
"	Be sure to turn on the "case ignore" since current versions
"	of qb64 support both upper as well as lowercase
"	letters. - MEM 10/1/2006
"
syn case ignore
"
"   While QB64 breaks its keywords into two groups in their
"   documentation (classic QB4.5 and QB64 extensions) that
"   distinction isn't needed here, I'm calling everything
"   a QB64 keyword.
"
syn keyword	qb64Arrays		ERASE LBOUND REDIM PRESERVE UBOUND DIM AS SHARED

syn keyword	qb64BitManipulation	BIT BITRESET BITSET HIBYTE HIWORD LOBYTE LOWORD SHL SHR

syn keyword	qb64CompilerSwitches	DEFBYTE DEFDBL DEFINT DEFLNG DEFLNGINT DEFSHORT DEFSNG DEFSTR
syn keyword	qb64CompilerSwitches	DEFUBYTE DEFUINT DEFULNGINT DEFUSHORT
syn match	qb64CompilerSwitches	"\<option\s+\(BASE\|BYVAL\|DYNAMIC\|ESCAPE\|EXPLICIT\|NOKEYWORD\)\>"
syn match	qb64CompilerSwitches	"\<option\s+\(PRIVATE\|STATIC\)\>"

syn region	qb64Conditional		start="\son\s+" skip=".*" end="gosub"
syn region	qb64Conditional		start="\son\s+" skip=".*" end="goto"
syn match	qb64Conditional		"\<select\s+case\>"
syn keyword	qb64Conditional		if iif then case else elseif with

syn match	qb64Console		"\<open\s+\(CONS\|ERR\|PIPE\|SCRN\)\>"
syn keyword	qb64Console		BEEP CLS CSRLIN LOCATE PRINT POS SPC TAB VIEW WIDTH

syn keyword	qb64DataTypes		BYTE CONST DOUBLE ENUM INTEGER LONG LONGINT SHORT STRING
syn keyword	qb64DataTypes		SINGLE TYPE UBYTE UINTEGER ULONGINT UNION UNSIGNED USHORT WSTRING ZSTRING

syn keyword	qb64DateTime		DATE DATEADD DATEDIFF DATEPART DATESERIAL DATEVALUE DAY HOUR MINUTE
syn keyword	qb64DateTime		MONTH MONTHNAME NOW SECOND SETDATE SETTIME TIME TIMESERIAL TIMEVALUE
syn keyword	qb64DateTime		TIMER YEAR WEEKDAY WEEKDAYNAME

syn keyword	qb64Debug		ASSERT STOP

syn keyword	qb64ErrorHandling	ERR ERL ERROR LOCAL RESUME
syn match	qb64ErrorHandling	"\<resume\s+next\>"
syn match	qb64ErrorHandling	"\<on\s+error\>"

syn match	qb64Files		"\<get\s+#\>"
syn match	qb64Files		"\<input\s+#\>"
syn match	qb64Files		"\<line\s+input\s+#\>"
syn match	qb64Files		"\<put\s+#\>"
syn keyword	qb64Files		ACCESS APPEND BINARY BLOAD BSAVE CLOSE EOF FREEFILE INPUT LOC
syn keyword	qb64Files		LOCK LOF OPEN OUTPUT RANDOM RESET SEEK UNLOCK WRITE

syn keyword	qb64Functions		ALIAS ANY BYREF BYVAL CALL CDECL CONSTRUCTOR DESTRUCTOR
syn keyword	qb64Functions		DECLARE FUNCTION LIB OVERLOAD PASCAL STATIC SUB STDCALL
syn keyword	qb64Functions		VA_ARG VA_FIRST VA_NEXT

syn match	qb64Graphics		"\<palette\s+get\>"
syn keyword	qb64Graphics		ALPHA CIRCLE CLS COLOR CUSTOM DRAW FLIP GET
syn keyword	qb64Graphics		IMAGECREATE IMAGEDESTROY LINE PAINT PALETTE PCOPY PMAP POINT
syn keyword	qb64Graphics		PRESET PSET PUT RGB RGBA SCREEN SCREENCOPY SCREENINFO SCREENLIST
syn keyword	qb64Graphics		SCREENLOCK SCREENPTR SCREENRES SCREENSET SCREENSYNC SCREENUNLOCK
syn keyword	qb64Graphics		TRANS USING VIEW WINDOW

syn match	qb64Hardware		"\<open\s+com\>"
syn keyword	qb64Hardware		INP OUT WAIT LPT LPOS LPRINT

syn keyword	qb64Logical		AND EQV IMP OR NOT XOR

syn keyword	qb64Math			ABS ACOS ASIN ATAN2 ATN COS EXP FIX INT LOG MOD RANDOMIZE
syn keyword	qb64Math			RND SGN SIN SQR TAN

syn keyword	qb64Memory			ALLOCATE CALLOCATE CLEAR DEALLOCATE FIELD FRE PEEK POKE REALLOCATE

syn keyword	qb64Misc			ASM DATA LET TO READ RESTORE SIZEOF SWAP OFFSETOF

syn keyword	qb64Modularizing		CHAIN COMMON EXPORT EXTERN DYLIBFREE DYLIBLOAD DYLIBSYMBOL
syn keyword	qb64Modularizing		PRIVATE PUBLIC

syn keyword	qb64Multithreading		MUTEXCREATE MUTEXDESTROY MUTEXLOCK MUTEXUNLOCK THREADCREATE THREADWAIT

syn keyword	qb64Shell			CHDIR DIR COMMAND ENVIRON EXEC EXEPATH KILL NAME MKDIR RMDIR RUN

syn keyword	qb64Environ		SHELL SYSTEM WINDOWTITLE POINTERS

syn keyword	qb64Loops			FOR LOOP WHILE WEND DO CONTINUE STEP UNTIL next

syn keyword	qb64Pointer		PROCPTR PTR SADD STRPTR VARPTR

syn keyword	qb64Predefined		__DATE__ __FB_DOS__ __FB_LINUX__ __FB_MAIN__ __FB_MIN_VERSION__
syn keyword	qb64Predefined		__FB_SIGNATURE__ __FB_VERSION__ __FB_WIN32__ __FB_VER_MAJOR__
syn keyword	qb64Predefined		__FB_VER_MINOR__ __FB_VER_PATCH__ __FILE__ __FUNCTION__
syn keyword	qb64Predefined		__LINE__ __TIME__

" Preprocessor
syn keyword	qb64PreProcIncludeWords		DEFINED ONCE
syn region	qb64PreProcIncluded	display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
syn match	qb64PreProcInclude	display "^\s*\(%:\|#\)\s*lang\>\s*\"" contains=qb64PreProcIncluded
syn match	qb64PreProcInclude	display "^\s*\(%:\|#\)\s*include\>\s*\"" contains=qb64PreProcIncluded
syn match	qb64PreProcInclude	display "^\s*\(%:\|#\)\s*include\sonce\>\s*\"" contains=qb64PreProcIncluded
syn region	qb64PreProcDefine	start="^\s*\(%:\|#\)\s*\(define\|undef\)\>" skip="\\$" end="$" end="//"me=s-1 contains=qb64Number,qb64Comment
syn region	qb64PreProcCondit	start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" end="//"me=s-1 contains=qb64Comment
syn match	qb64PreProcCondit	display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"
syn region	qb64Out		start="^\s*\(%:\|#\)\s*if\s\+0\+\>" end=".\@=\|$" contains=qb64Out2 fold
syn region	qb64Out2		contained start="0" end="^\s*\(%:\|#\)\s*\(endif\>\|else\>\|elif\>\)" contains=qb64Skip
syn region	qb64Skip		contained start="^\s*\(%:\|#\)\s*\(if\>\|ifdef\>\|ifndef\>\)" skip="\\$" end="^\s*\(%:\|#\)\s*endif\>" contains=qb64Skip

syn keyword	qb64ProgramFlow		END EXIT GOSUB GOTO
syn keyword	qb64ProgramFlow		IS RETURN SCOPE SLEEP

syn keyword	qb64String			INSTR LCASE LEFT LEN LSET LTRIM MID RIGHT RSET RTRIM
syn keyword	qb64String			SPACE STRING TRIM UCASE ASC BIN CHR CVD CVI CVL CVLONGINT
syn keyword	qb64String			CVS CVSHORT FORMAT HEX MKD MKI MKL MKLONGINT MKS MKSHORT
syn keyword	qb64String			OCT STR VAL VALLNG VALINT VALUINT VALULNG

syn keyword	qb64TypeCasting		CAST CBYTE CDBL CINT CLNG CLNGINT CPTR CSHORT CSIGN CSNG
syn keyword	qb64TypeCasting		CUBYTE CUINT CULNGINT CUNSG CURDIR CUSHORT

syn match	qb64UserInput		"\<line\s+input\>"
syn keyword	qb64UserInput		GETJOYSTICK GETKEY GETMOUSE INKEY INPUT MULTIKEY SETMOUSE
"
"	Do the Basic variables names first.  This is because it
"	is the most inclusive of the tests.  Later on we change
"	this so the identifiers are split up into the various
"	types of identifiers like functions, basic commands and
"	such. MEM 9/9/2006
"
syn match	qb64Identifier		"\<[a-zA-Z_][a-zA-Z0-9_]*\>"
syn match	qb64GenericFunction	"\<[a-zA-Z_][a-zA-Z0-9_]*\>\s*("me=e-1,he=e-1
"
"	Function list
"
syn keyword	qb64Todo		contained TODO
"
"	Catch errors caused by wrong parenthesis
"
syn region	qb64Paren		transparent start='(' end=')' contains=ALLBUT,@qb64ParenGroup
syn match	qb64ParenError	")"
syn match	qb64InParen	contained "[{}]"
syn cluster	qb64ParenGroup	contains=qb64ParenError,qb64Special,qb64Todo,qb64UserCont,qb64UserLabel,qb64BitField
"
"	Integer number, or floating point number without a dot and with "f".
"	Hex end marking isn't quite right. Requires a space. Not sure how to
"	make that better
"
syn region	qb64Hex		start="&h" end="\W"
syn region	qb64HexError	start="&h\x*[g-zG-Z]" end="\W"
syn match	qb64Integer	"\<\d\+\(u\=l\=\|lu\|f\)\>"
"
"	Floating point number, with dot, optional exponent
"
syn match	qb64Float	"\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
"
"	Floating point number, starting with a dot, optional exponent
"
syn match	qb64Float	"\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
"
"	Floating point number, without dot, with exponent
"
syn match	qb64Float	"\<\d\+e[-+]\=\d\+[fl]\=\>"
"
"	Hex number
"
syn case match
syn match	qb64Octal	"\<0\o*\>"
syn match	qb64OctalError	"\<0\o*[89]"
"
"	String and Character contstants
"
syn region	qb64String	start='"' end='"' contains=qb64Special,qb64Todo
syn region	qb64String	start="'" end="'" contains=qb64Special,qb64Todo
"
"	Now do the comments and labels
"
syn match	qb64Label	"^\d"
syn match	qb64Label	"\<^\w+:\>"
syn region	qb64LineNumber	start="^\d" end="\s"
"
"	Create the clusters
"
syn cluster	qb64Number	contains=qb64Hex,qb64Octal,qb64Integer,qb64Float
syn cluster	qb64Error	contains=qb64HexError,qb64OctalError
"
"	Used with OPEN statement
"
syn match	qb64Filenumber	"#\d\+"
syn match	qb64MathOperator	"[\+\-\=\|\*\/\>\<\%\()[\]]" contains=qb64Paren


"
"	Comments
"
syn match	qb64Special	contained "\\."
syn region	qb64Comment	start="^rem" end="$" contains=qb64Special,qb64Todo
syn region	qb64Comment	start=":\s*rem" end="$" contains=qb64Special,qb64Todo
syn region	qb64Comment	start="\(^\|\s\)rem\s" end="$" contains=qb64Special,qb64Todo
syn region	qb64Comment	start="\s*'" end="$" contains=qb64Special,qb64Todo
syn region	qb64Comment	start="^'" end="$" contains=qb64Special,qb64Todo

syn region	qb64Comment	start="^'" end="$" contains=qb64Special,qb64Todo
syn region	qb64Comment	start="/'" end="'/" contains=qb64Special,qb64Todo


"
"	The default methods for highlighting.  Can be overridden later
"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_fbasic_syntax_inits")
  if version < 508
    let did_fbasic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink qb64Arrays		Statement
  HiLink qb64BitManipulation	Operator
  HiLink qb64CompilerSwitches	PreCondit
  HiLink qb64Console		Identifier
  HiLink qb64DataTypes		Type
  HiLink qb64DateTime		Type
  HiLink qb64Debug		Special
  HiLink qb64ErrorHandling	Special
  HiLink qb64Files		Identifier
  HiLink qb64Functions		Function
  HiLink qb64Graphics		Function
  HiLink qb64Hardware		Identifier
  HiLink qb64Logical		Conditional
  HiLink qb64Loops 		Statement
  HiLink qb64Math		Function
  HiLink qb64Memory		Function
  HiLink qb64Misc		Special
  HiLink qb64Modularizing	Special
  HiLink qb64Multithreading	Special
  HiLink qb64Shell		Special
  HiLink qb64Environ		Special
  HiLink qb64Pointer		Special

  HiLink qb64Predefined		PreProc
  HiLink qb64PreProcIncluded	String
  HiLink qb64PreProcCondit	PreProc
  HiLink qb64PreProcDefine	PreProc

  HiLink qb64ProgramFlow	Statement
  HiLink qb64String		String
  HiLink qb64TypeCasting	Type
  HiLink qb64UserInput		Statement
  HiLink qb64Comment		Comment
  HiLink qb64Out 	Comment
  HiLink qb64Out2 	Comment
  HiLink qb64Skip 	Comment

  HiLink qb64Conditional	Conditional
  HiLink qb64HexError		Error
  HiLink qb64OctalError		Error

  HiLink qb64PreProcInclude		Include
  HiLink qb64Label		Label
  HiLink qb64LineNumber		Label
  HiLink qb64MathOperator	Operator
  HiLink qb64Integer		Number
  HiLink qb64Float		Number
  HiLink qb64Hex		Number
  HiLink qb64Octal		Number
  HiLink qb64Special		Special
  HiLink qb64Todo		Todo

  delcommand HiLink
endif




let b:current_syntax = "qb64"

" vim: ts=4
