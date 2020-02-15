
; WRITTEN BY YUSUF PATOGLU - 151044027 (almost same as my own past year project.)
;PROGRAMMING LANGUAGES HOMEWORK2




;;This function defines all operators in given list then checks the operator in given list then returns true or false.
(defun operatorFinder (parsedStr)
	(setq g++Operators '("+" "-" "/" "*" "(" ")" "“" "”" "**"))
	(if 
		(find parsedStr g++Operators :test #'equal)   
		1
		0))
;;This function finds comments.
(defun commentFinder (parsedStr)
	(setq comment '(";;"))
	(if 

		(find parsedStr comment :test #'equal)    
		1
		0))
;;This function defines all keywords in given list then checks the keywords in given list then returns true or false.
(defun keywordFinder (parsedStr)
	(setq g++Keywords '("and" "or" "not" "equal" "less" "nil" "list" "append" "concat" "set" "deffun" "for" "if"  "exit" "load" "disp" "true" "false")) 
	(if 
		(find parsedStr g++Keywords :test #'equal)
		1
		0))
;;This function defines all keywords in given list then checks the keywords in given list then returns true or false.
(defun keywordFinder (parsedStr)
	(setq g++Keywords '("and" "or" "not" "equal" "less" "nil" "list" "append" "concat" "set" "deffun" "for" "if"  "exit" "load" "disp" "true" "false")) 
	(if 
		(find parsedStr g++Keywords :test #'equal)
		1
		0))
;;This function defines all integer values in given list then checks the integers in given list then returns true or false.
(defun integerFinder (parsedStr)
	(setq g++Integers  '("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" )) 
	
	(setq parsedLen (length parsedStr))

	(loop for counter from 0 to (- (length parsedStr) 1)

	    do 	(if ( not (find (string (char parsedStr counter)) g++Integers :test #'equal))
	   		(return-from integerFinder 0)
	   		1)))



(defun interpreter (str-input)
	(cond 


	 			((string-equal str-input "+" )
	 				(print "OP_PLUS"))
			 	((string-equal str-input "-" )
	 				(print "OP_MINUS"))
			 	((string-equal str-input "/" )
	 				(print "OP_DIV"))
			 	((string-equal str-input "*" )
	 				(print "OP_MULT"))
			 	((string-equal str-input "(" )
	 				(print "OP_OP"))
			 	((string-equal str-input ")" )
	 				(print "OP_CP"))
			 	((string-equal str-input "**" )
	 				(print "OP_DBLMULT"))
			 	((string-equal str-input "“" )
	 				(print "OP_OC"))
			 	((string-equal str-input "”" )
	 				(print "OP_CC"))
			 	((string-equal str-input "," )
	 				(print "OP_COMMA"))
			 	((string-equal str-input "and" )
	 				(print "KW_AND"))
			 	((string-equal str-input "or" )
	 				(print "KW_OR"))
			 	((string-equal str-input "not" )
	 				(print "KW_NOT"))
			 	((string-equal str-input "equal" )
	 				(print "KW_EQUAL"))
			 	((string-equal str-input "less" )
	 				(print "KW_LESS"))
			 	((string-equal str-input "nil" )
	 				(print "KW_NIL"))
			 	((string-equal str-input "list" )
	 				(print "KW_LIST"))
			 	((string-equal str-input "append" )
	 				(print "KW_APPEND"))
			 	((string-equal str-input "concat" )
	 				(print "KW_CONCAT"))
			 	((string-equal str-input "set" )
	 				(print "KW_SET"))
			 	((string-equal str-input "deffun" )
	 				(print "KW_DEFFUN"))
			 	((string-equal str-input "for" )
	 				(print "KW_FOR"))
			 	((string-equal str-input "if" )
	 				(print "KW_IF"))
			 	((string-equal str-input "exit" )
	 				(print "KW_EXIT"))
			 	((string-equal str-input "load" )
	 				(print "KW_LOAD"))
			 	((string-equal str-input "disp" )
	 				(print "KW_DISP"))
			 	((string-equal str-input "true" )
	 				(print "KW_TRUE"))
			 	((string-equal str-input "false" ))))

;;This function defines all letters in given list then checks the letters in given list then returns true or false.
(defun letterFinder (parsedStr)
	(setq g++Letters '("a" "b" "c" "d" "e" "f" "g" "h" "i" "j" "k" "l" "m" "n" "o" "p" "r" "s" "t" "u" "v" "w" "x" "y" "q" "z" "A" "B" "C" "D" "E" "F" "G" "H" "I" "J" "K" "L" "M" "N" "O" "P" "R" "S" "T" "U" "V" "W" "X" "Y" "Z" "Q"))
	(setq parsedLen (length parsedStr))
		(loop for a from 0 to (- (length parsedStr) 1)

		   do 	(if ( not (find (string (char parsedStr a)) g++Letters :test #'equal))
		   		(return-from letterFinder 0)
		   		1)))
;;gets the file content with specified directory.
(defun file-get-contents (filename)
  (with-open-file (stream filename)
    (let ((contents (make-string (file-length stream))))
      (read-sequence contents stream)
   
      contents)))

;;This is the gppinterpreter functions that will be runned as main function.
(defun gppinterpreter (&optional filename)


	(if(string-equal filename nil)
			(progn
				(loop 
					(clear-input)
 					(finish-output)
  					(setq finalString(read-line))
					(finish-output)
					
					
					(setq finalString (string (replace-all finalString "(" "( ")))
						
					;Adding some spaces to in file for opening paranthesis
					(setq finalString (string (replace-all finalString ")" " )")))



					(setq mylist (split-by-one-space finalString))
				

					(loop for x in mylist
	 					do (cond 
	 						((= (operatorFinder x) 1 )
							(interpreter x))

			 				((= (keywordFinder x) 1 )
							(interpreter x))
		
							((eq (letterFinder x) NIL )
							(print "IDENTIFIER"))
					
							((eq (integerFinder x)  NIL)					
									(print "VALUE"))
							((eq (commentFinder x)  1)					
									(print "COMMENT"))
				
							))))) 
	
	(setq finalString (string (file-get-contents filename)))
	(setq finalString (string (replace-all finalString "(" "( ")))
	(setq finalString (string (replace-all finalString ")" " )")))
	(setq mylist (split-by-one-space finalString))
	

	 (loop for x in mylist
	 	do (cond 
	 			((= (operatorFinder x) 1 )
					(interpreter x))

			 	((= (keywordFinder x) 1 )
					(interpreter x))
		
				((eq (letterFinder x) NIL )
					(print "IDENTIFIER")
					)
				((eq (integerFinder x)  NIL)					
					(print "VALUE"))
				((eq (commentFinder x)  1)					
					(print "COMMENT"))
				
			)
        )   
	 (print "Lexer  finished tokenizing")
	 (princ filename)
	 t)

;;I mimicked this list replacing (to supply spaces between paranthesis) method in cookbook source. Link is given below.
;;http://cl-cookbook.sourceforge.net/strings.html#manip
(defun replace-all (string part replacement &key (test #'char=))
  (with-output-to-string (out)
    (loop with part-length = (length part)
          for old-pos = 0 then (+ pos part-length)
          for pos = (search part string
                            :start2 old-pos
                            :test test)
          do (write-string string out
                           :start old-pos
                           :end (or pos (length string)))
          when pos do (write-string replacement out)
          while pos)))

;;this is the helper parser that parses the given string space by space.
;;"https://lispcookbook.github.io/cl-cookbook/strings.html"
(defun split-by-one-space (parsedStr)
    (loop for i = 0 then (1+ j)
          as j = (position #\Space parsedStr :start i)
          collect (subseq parsedStr i j)
          while j))	

;;clear buffer and get input
(defun get-input (input)
  (clear-input)
  (finish-output)
  (read-line))


