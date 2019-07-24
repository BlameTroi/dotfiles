" Vim syntax file
" Language:    libertybasic
" Maintainer:  Troy Brumley
" Updated:     07/22/2019
"
" Description:
"
"       I'm attmpting to get a syntax for Liberty BASIC working. I
"       started using the various earlier basic syntax files but
"       Liberty BASIC is a much smaller language than VB, QB, and
"       Free BASIC, so I decided to start over from scratch. I may
"       lift some patterns from the Free BASIC syntax file.
"
" Progress:
"
"   07/23/2019:
"   Initial version works but has no folding support yet. Problems
"   include properly highlighting labels, which can be either
"   numbers or [label.text] in form.
"
if exists("b:current_syntax")
  finish
endif
syn clear
"
" Liberty BASIC 4.5.1 idiosyncracies:
" 1) some function names *must* include the opening left paren.
" 2) some global system variable names are case sensitive.
" 3) if/then/else/endif -- there is no elseif.
" 4) the engine is written in Smalltalk, so data typing of variables
"    boils down to numeric or string, and stringness is indicated by
"    the traditional $ appended to the function or variable name.
" 5) branch/function targets can be line numbers or names enclosed
"    in square brackets.
"
" allow an opening paren in a keyword, indicating a function name
" allow dollar sign $ in a keyword, indicating a string
 setlocal iskeyword+=\(
" hack to deal with vim highlighting of vim files... )"
 setlocal iskeyword+=\$
"
">>>>case
"
" most of the language is case insensitive, so we set the default
" here and then bracket any areas that need to be case sensitive
" in case match & case ignore. always leave things in case ignore!
"
 syn case ignore
"
">>>>commands"
"
" Keywords, function names, and system variable names are pulled
" from the help file included with the Liberty BASIC 4.5.1
" environment.
"
 syn keyword lbKeyword APPEND AS
 syn keyword lbKeyword BEEP BMPBUTTON BMPSAVE
 syn keyword lbKeyword BOOLEAN BUTTON BYREF
 syn keyword lbKeyword CALL CALLBACK CALLDLL CALLFN
 syn keyword lbKeyword CASE CHECKBOX CLOSE CLS
 syn keyword lbKeyword COLORDIALOG COMBOBOX CONFIRM CURSOR
 syn keyword lbKeyword DATA DIALOG DIM DLL DO DOUBLE
 syn keyword lbKeyword DUMP DWORD
 syn keyword lbKeyword ELSE END ERROR EXIT
 syn keyword lbKeyword FIELD FILEDIALOG FILES FONTDIALOG
 syn keyword lbKeyword FOR FUNCTION
 syn keyword lbKeyword GET GETTRIM GLOBAL GOSUB GOTO
 syn keyword lbKeyword GRAPHICBOX GRAPHICS GROUPBOX
 syn keyword lbKeyword IF INPUT INPUTCSV
 syn keyword lbKeyword KILL
 syn keyword lbKeyword LET LINE LISTBOX LOADBMP LONG
 syn keyword lbKeyword LOOP LPRINT
 syn keyword lbKeyword MAINWIN MAPHANDLE MENU
 syn keyword lbKeyword NAME NEXT NOMAINWIN NONE NOTICE
 syn keyword lbKeyword ON ONCOMERROR OPEN OUT OUTPUT
 syn keyword lbKeyword PASSWORD PLAYMIDI PLAYWAVE
 syn keyword lbKeyword POPUPMENU PRINT PRINTERDIALOG
 syn keyword lbKeyword PROMPT PTR PUT
 syn keyword lbKeyword RADIOBUTTON RANDOM RANDOMIZE
 syn keyword lbKeyword READ READJOYSTICK REDIM
" removed REM, it's now handled in lbComment 
 syn keyword lbKeyword RESTORE RESUME RETURN RUN
 syn keyword lbKeyword SCAN SELECT SHORT SORT STATICTEXT
 syn keyword lbKeyword STOP STOPMIDI STRUCT SUB
 syn keyword lbKeyword TEXT TEXTBOX TEXTEDITOR
 syn keyword lbKeyword THEN TIMER TITLEBAR TO TRACE
 syn keyword lbKeyword ULONG UNLOADBMP UNTIL USHORT
 syn keyword lbKeyword VOID
 syn keyword lbKeyword WAIT WINDOW WEND WHILE WORD
 syn keyword lbKeyword XOR
"
">>>>Functions:
"
" note that the opening paren is part of the function name
" and that a dollar sign $ indicates a string function
"
 syn keyword lbFunction ABS( ACS( AFTER$( AFTERLAST$( ASC( ASN( ATN(
 syn keyword lbFunction CHR$( COS(
 syn keyword lbFunction DATE$( DECHEX$(
 syn keyword lbFunction EOF( EVAL( EVAL$( EXP(
 syn keyword lbFunction HBMP( HEXDEC( HTTPGET$( HWND(
 syn keyword lbFunction INP( INPUT$( INPUTTO$( INSTR( INT(
 syn keyword lbFunction LEFT$( LEN( LOF( LOG( LOWER$(
 syn keyword lbFunction MAX( MIDIPOS( MID$( MIN( MKDIR(
 syn keyword lbFunction NOT(
 syn keyword lbFunction REMCHAR$( REPLSTR$( RIGHT$( RMDIR( RND(
 syn keyword lbFunction SIN( SPACE$( SQR( STR$(
 syn keyword lbFunction TAB( TAN( TIME$( TRIM$( TXCOUNT(
 syn keyword lbFunction UPPER$( UPTO$( USING(
 syn keyword lbFunction VAL(
 syn keyword lbFunction WINSTRING( WORD$(
"
">>>>System Variables:
"
" note: these are case sensitive in Liberty BASIC so we'll need
" to use a distinctive hilighting to help see when the wrong
" case is used.
"
 syn case match
 syn keyword lbSystemVariable BackgroundColor$
 syn keyword lbSystemVariable ComboboxColor$ CommandLine$
 syn keyword lbSystemVariable DefaultDir$ DisplayHeight DisplayWidth Drives$
 syn keyword lbSystemVariable Err Err$
 syn keyword lbSystemVariable ForegroundColor$
 syn keyword lbSystemVariable Joy1x Joy1y Joy1z Joy1button1 Joy1button2 Joy2x Joy2y Joy2z Joy2button1 Joy2button2
 syn keyword lbSystemVariable ListboxColor$
 syn keyword lbSystemVariable Platform$ PrintCollate PrintCopies PrinterFont$ PrinterName$
 syn keyword lbSystemVariable TextboxColor$ TexteditorColor$
 syn keyword lbSystemVariable Version$
 syn keyword lbSystemVariable WindowHeight WindowWidth
 syn keyword lbSystemVariable UpperLeftX UpperLeftY
 syn case ignore
"
">>>>Literals:
" Normal integer
 syn match lbInteger "\<\d\+\>"
" various forms of floating point numbers
 syn match lbFloat "\<\d\+\.\d*\(e[-+]\=\d\+\)\=[fl]\=\>"
 syn match lbFloat "\.\d\+\(e[-+]\=\d\+\)\=[fl]\=\>"
 syn match lbFloat "\<\d\+e[-+]\=\d\+[fl]\=\>"
" Strings
 syn region lbString  start='"' end='"'
"
">>>>Special text matches for strings and comments:
 syn match lbSpecial contained "\\."
 syn keyword lbTodo contained TODO
"
">>>>Expression Operators:
 syn match lbMathOp "[\+\-\=\*\/\>\<\^]"
 syn keyword lbLogicalOp AND OR
" Variable name identifier (todo: allow $)
 syn match lbIdentifier  "\<[a-zA-Z][a-zA-Z0-9]*\>"
 " need to add $ to above ...
" Labels.
" does not work- syn region lbLabel start="\[" end="\]" contains=lbIdentifier
" does not work- syn match lbLabel "\<\[\.+\]\>"
" syn match lbLabelText "\<[a-zA-Z][a-zA-Z0-9.]*\>"
" syn region lbLabel start="\<\[" end="\]\>"
" was on above lbLabel def contains=lbLabelText
" syn region lbLineNumber start="^\d" end="\s"
""
">>>>Comments:
"
" comments are either REM or apostrophe opened and end at the end of the
" line. remember to extra highlight TODO. 
"
" *** due to how match priority works, these need to come after
" *** definitions such as identifier and label text.
"
 syn region lbComment start="\s*'" end="$" contains=lbTodo
 syn region lbComment start="^'" end="$" contains=lbTodo
 syn region lbComment start=":\s*rem" end="$" contains=lbTodo
 syn region lbComment start="^\s*rem" end="$" contains=lbTodo
"
" """""""""""""""""""""""""""""""""""" to here """""""""""""""""""
" original stuff in this file ...
" todo: let's start cleaning up
"syn region libertybasicConditional  start="\son\s+" skip=".*" end="gosub"
"syn region libertybasicConditional  start="\son\s+" skip=".*" end="goto"
"syn match libertybasicConditional  "\<select\s+case\>"
"
"syn match libertybasicFiles   "\<get\s+#\>"
"syn match libertybasicFiles   "\<input\s+#\>"
"syn match libertybasicFiles   "\<line\s+input\s+#\>"
"syn match libertybasicFiles   "\<put\s+#\>"
"
"syn match libertybasicHardware  "\<open\s+com\>"
"
"syn match libertybasicUserInput  "\<line\s+input\>"
"
"
" Function list
"
" Catch errors caused by wrong parenthesis
"
"syn region libertybasicParen  transparent start='(' end=')' contains=ALLBUT,@libertybasicParenGroup
"syn match libertybasicParenError ")"
"syn match libertybasicInParen contained "[{}]"
"syn cluster libertybasicParenGroup contains=libertybasicParenError,lbSpecial,lbTodo,libertybasicUserCont,libertybasicUserLabel,libertybasicBitField
"
" Integer number, or floating point number without a dot and with "f".
" Hex end marking isn't quite right. Requires a space. Not sure how to
" make that better
"
"syn region libertybasicHex  start="&h" end="\W"
"syn region libertybasicHexError start="&h\x*[g-zG-Z]" end="\W"
"
"

" Now do the comments and labels
"
"syn match libertybasicLabel  "^\d"
"syn match libertybasicLabel  "\<^\w+:\>"
"
" Create the clusters
" todo: txb- I'm not seeing these used
"syn cluster lbNumber  contains=lbInteger,lbFloat
"syn cluster libertybasicError  contains=libertybasicHexError,libertybasicOctalError
"
" Used with OPEN statement
"
"syn match libertybasicFilenumber "#\d\+"

"
" The default methods for highlighting.  Can be overridden later
"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_lbasic_syntax_inits")
  if version < 508
    let did_lbasic_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink lbDateTime  Type
  HiLink lbFunction  Function
  HiLink lbSystemVariable Special
  HiLink lbString  String
  HiLink lbMathOp Operator
  HiLink lbLogicalOp Operator
  HiLink lbInteger  Number
  HiLink lbFloat  Number
  HiLink lbTodo  Todo
  HiLink lbKeyword Statement
  HiLink lbComment  Comment
" HiLink lbLineNumber  Label
" HiLink lbSpecial  Special
" HiLink libertybasicArrays  Statement
" HiLink libertybasicBitManipulation Operator
" HiLink libertybasicCompilerSwitches PreCondit
" HiLink libertybasicConsole  Identifier
" HiLink libertybasicDataTypes  Type
" HiLink libertybasicDebug  Special
" HiLink libertybasicErrorHandling Special
" HiLink libertybasicFiles  Identifier
" HiLink libertybasicGraphics  Function
" HiLink libertybasicHardware  Identifier
" HiLink libertybasicLogical  Conditional
" HiLink libertybasicLoop   Statement
" HiLink libertybasicMemory  Function
" HiLink libertybasicMisc  Special
" HiLink libertybasicModularizing Special
" HiLink libertybasicMultithreading Special
" HiLink libertybasicShell  Special
" HiLink libertybasicEnviron  Special
" HiLink libertybasicPointer  Special
" HiLink libertybasicProgramFlow Statement
" HiLink libertybasicTypeCasting Type
" HiLink libertybasicUserInput  Statement
" HiLink libertybasicOut  Comment
" HiLink libertybasicOut2  Comment
" HiLink libertybasicSkip  Comment
" HiLink libertybasicConditional Conditional
" HiLink libertybasicHexError  Error
" HiLink libertybasicOctalError  Error
" HiLink libertybasicPreProcInclude  Include
  delcommand HiLink
endif




let b:current_syntax = "libertybasic"

" vim: ts=8
