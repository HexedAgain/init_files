(setq debug-on-quit nil)
(defun fast-load-abv () (interactive) (load-file "abv-functions.el"))
(defun load-abbrevs () (interactive) (load-file "~/.emacs.d/abbrevs.el"))

;;utility functions -----------------------------------------------------------------------------------------------
;;-----------------------------------------------------------------------------------------------------------------

(defun calculate-row-index (i-element rows cols)
  "gets the row position of an element of a matrix, i.e. for a 3 x 3 matrix then element 4 would be 2, element 8 would be 3"
  (+ 1 (- rows (/ (+ i-element (- cols 1)) cols)))
)

(defun calculate-column-index (i-element rows cols)
  "gets the column position of an element of a matrix, i.e. for a 3 x 3 matrix then element 4 would be 1, element 8 would be 2"
  (+ 1 (% (- cols (% i-element cols)) cols))
)

(defun insert-n-strings (noOfRepeats string)
  "will concatenate a sequence of strings together and insert them at current point."
  (while (> noOfRepeats 0)
    (insert string)
    (setq noOfRepeats (1- noOfRepeats))))


(defun atomic-length (i-list)
  "will return the number of atomic elements contained in the input list even if the list is comprised of several lists\n
   for example (atomic-length ((1 2 3) (4 5 6))) will return 6"
  (let ((counter 0) (temp-counter 0) (curr-length (length i-list)))
   (while (< counter curr-length) 
    (if (listp (nth counter i-list)) 
     (setq temp-counter (+ temp-counter 
                           (atomic-length (nth counter i-list)))) 
     (setq temp-counter (+ temp-counter 1)))
    (setq counter (1+ counter)))
   temp-counter
  ))

;;-----------------------------------------------------------------------------------------------------------------

 
(defun abv-matrix ()
  (interactive)
  "outputs an n x m matrix in latex form wrt user specified elements"
  "bracket style for now is of type '()'"
  
  (setq rows (string-to-number (read-from-minibuffer "How many rows? ")))
  (setq cols (string-to-number (read-from-minibuffer "How many columns? ")))
  (if (or (< rows 1) (< cols 1))
      (error "both the number of rows and number of columns must be positive")
  )

  (insert "\\left (\\begin{matrix}\n")
  (let ((num-elems (* rows cols)) (prev-row 1) this-prompt this-row this-col)
    (while (> num-elems 0)
      (setq this-row (calculate-row-index num-elems rows cols))
      (setq this-col (calculate-column-index num-elems rows cols))
      (setq this-prompt
	(concat "element " (int-to-string this-row) ", " (int-to-string this-col) ": "))
      (if (> this-row prev-row)
	  (progn (setq prev-row (+ 1 prev-row))
		 (insert "\\\\\n"))
      )
      (insert (read-from-minibuffer this-prompt))
      (if (< this-col cols) (insert " & "))
      (setq num-elems (1- num-elems))
    )
  (insert "\n\\end{matrix}\\right )\n")
  )
) 
 
(defun abv-determinant ()
  (interactive)
  "outputs an n x m matrix in latex form wrt user specified elements"
  "bracket style for now is of type '()'"
  
  (setq rows (string-to-number (read-from-minibuffer "How many rows? ")))
  (setq cols (string-to-number (read-from-minibuffer "How many columns? ")))
  (if (or (< rows 1) (< cols 1))
      (error "both the number of rows and number of columns must be positive")
  )

  (insert "\\begin{vmatrix}\n")
  (let ((num-elems (* rows cols)) (prev-row 1) this-prompt this-row this-col)
    (while (> num-elems 0)
      (setq this-row (calculate-row-index num-elems rows cols))
      (setq this-col (calculate-column-index num-elems rows cols))
      (setq this-prompt
	(concat "element " (int-to-string this-row) ", " (int-to-string this-col) ": "))
      (if (> this-row prev-row)
	  (progn (setq prev-row (+ 1 prev-row))
		 (insert "\\\\\n"))
      )
      (insert (read-from-minibuffer this-prompt))
      (if (< this-col cols) (insert " & "))
      (setq num-elems (1- num-elems))
    )
  (insert "\n\\end{vmatrix}\n")
  )
) 

;;TODO =====================================================================
(defun abv-table (cols)
  (interactive "nHow many columns? ")
  (if (< cols 1)
      (error "The number of columns must be positive")
  )

  (insert "\\begin{center}\n\\begin{tabular}{")
)
;; =========================================================================

(defun abv-addbraces (noOfBraces)
    (interactive "nhow many braces?")
    (save-excursion
      (insert-n-strings noOfBraces "{}"))
    (forward-char))




;;function to create an abbreviation file

;;first line of each file will specify which abbreviation table the abbreviations belong to.
;;need to define some sort of map structure and pop the contents of each file into the corresponding section of the map
;;need to then print out the contents of the map to the file abbrevs1

;;need to first load 


(defun abv-insert-environment ()
  (interactive)
  (setq prompt "environment? ")
  (setq i-environment (read-from-minibuffer prompt))
    (setq o-string
      (concat "\\begin{" i-environment "}\n\n\\end{" i-environment "}"))
    (insert o-string)
    (previous-line))


(defun get-file-choice (i-List offset &optional i-error last-prompt-buffer)
  (interactive)
  (let ((selection 1)
	(len-first (length (car i-List) ))
	(curr-files (reverse (nth (/ offset (length (car i-List) )) i-List)))
	;can probably send in the prompt-buffer immediately!
	(prompt-buffer "\nplease choose a file number, press 'n' for next, 'p' for previous")
	(allowed-inputs)) 

    (setq allowed-inputs (cons "p" (cons "n" (mapcar 'number-to-string (number-sequence 1 (atomic-length i-List) )))))
    (if (not last-prompt-buffer)
	(let ((curr-files curr-files))
	  (dotimes (i (length curr-files) )
	    (setq prompt-buffer (concat (car curr-files) prompt-buffer ))
	    (setq curr-files (cdr curr-files) )))
      (setq prompt-buffer last-prompt-buffer))
    
    (setq selection (read-from-minibuffer (concat (if (not i-error) "" i-error) prompt-buffer ) ))
    (if (member selection allowed-inputs)
	(progn 
               (if (equal selection "n")
		   (if (< (+ offset len-first) (atomic-length i-List))
		      (setq selection (get-file-choice i-List (+ offset len-first)))
		     (setq selection (get-file-choice i-List offset "there are no more files forward\n" prompt-buffer))))
               (if (equal selection "p")
		   (if (> (- (+ offset 1) (length (car i-List)) ) 0)
		       (setq selection (get-file-choice i-List (- offset len-first )))
		     (setq selection (get-file-choice i-List offset "there are no more files backward\n" prompt-buffer))))
	       )
      (setq selection (get-file-choice i-List offset (concat "invalid choice: " selection "\n") prompt-buffer)))
    selection
    )
  )

(defun generate-file-lists (iList iSize)
  ;if iSize is too big then should throw some sort of error
  (let ((list-min 0) (list-max (min (length iList) (- iSize 1) ) ) (tempList ()) (counter 0) (file-no-path))
    (setq tempList (list (list-subset iList list-min list-max)))
    (setq counter (+ counter iSize) )
    (while (< counter (length iList))
      (setq list-min (min (- (length iList) 1) (+ list-max 1) ) )
      (setq list-max (min (+ list-max iSize) (- (length iList) 1)))
      (setq tempList (cons (list-subset iList list-min list-max) tempList) )
      (setq counter (+ counter iSize) ))
    (setq tempList (reverse tempList))))

;(defun make-numbered-file-lists (file-string f-lists l-size)
;  (setq file-str (get-split-string-from-file "abbrevsGen.backup/abbrevFiles"))
;  (let ( (len-sequence (number-sequence 1 (length file-str))) )
;    (setq f-lists (generate-file-lists
;		      (cl-mapcar (lambda (el1 el2) (concat (number-to-string el1) ": " el2 "\n")) len-sequence str)
;		      l-size) )))

(defun make-numbered-file-lists (io-file-lists io-file-str i-sublists-size)
  (interactive)
  io-file-lists
  (let ( (t-file-str (get-split-string-from-file "abbrevsGen.backup/abbrevFiles")) (L io-file-lists)) 
    (let ( (len-sequence (number-sequence 1 (length t-file-str))) (t-list (list nil)) )
      ;(setq io-file-lists (generate-file-lists
      ;(setq L (generate-file-lists
      (setcar t-list (generate-file-lists
			   (cl-mapcar (lambda (el1 el2) (concat (number-to-string el1) ": " el2 "\n")) len-sequence t-file-str)
			   i-sublists-size) )
                           (setcar L (car (car t-list)))
                           (setcdr L (cdr (car t-list) ) )
                           (setcar io-file-str (car t-file-str))
                           (setcdr io-file-str (cdr t-file-str))) )

    io-file-lists
    io-file-str
  (let ( (L io-file-lists) ) (setcar L (car L) ))
  io-file-lists
      )

;(make-numbered-file-lists (list nil) (list nil) 5)

(defun set-abbrev-and-expansion (io-abbrev io-expansion)
  (let ((a) (x))
  (while
      (equal "" (setq a (concat "\"" (read-from-minibuffer "abrreviation? ") "\""))))
  (setcar io-abbrev a)
  (while
      (equal "" (setq x (read-from-minibuffer "expansion? "))) )
  (setcar io-expansion x)))



(defun set3 (L val)
  (let ((M L))
    (setq M (cdr M) )
    (setq M (cdr M) )
    (setcar M val)
    L) )

(defun abv-abbreviation-maker (&optional i-abbrev i-expansion i-file i-error)
;(defun abv-abbreviation-maker (&optional i-abbrev-elements i-file i-error)
  (interactive)
  ;(let ((abbrev-text abbrev) (expansion-text expansion) (str) (len-sequence) (file-lists ) (file-selection file) (action))
  ;(let ((abbrev-text abbrev) (expansion-text expansion) (str) (file-lists ) (file-selection file) (action))
  ;(let ((abbrev-parts abbrev-elements) (str) (file-lists ) (file-selection file) (action))
  (let ((a-abbrev-text (if (equal i-abbrev nil) (list nil) i-abbrev))
        (a-expansion-text (if (equal i-expansion nil) (list nil) i-expansion))
	(a-strings-of-files (list nil))
	(a-numbered-file-lists (list nil))
	(file-selection i-file)
        (this-window-buffer (buffer-name (window-buffer (frame-selected-window) ) ))
	(action))
    ;this function will be called recursively, if we find that the abbreviation already exists in our file selection.
    ;On the first entry however the abbreviations should not be set.
    ;(if (equal a-abbrev-parts (list nil nil))
    (if (equal i-abbrev nil)
	(progn
	  (set-abbrev-and-expansion    a-abbrev-text a-expansion-text)
	  (make-numbered-file-lists    a-numbered-file-lists a-strings-of-files 5)
	  (setq file-selection (concat "~/.emacs.d/abbrevsGen.backup/" (setq file-no-path (nth (- (string-to-number (get-file-choice a-numbered-file-lists 0)) 1) a-strings-of-files))))

          ;the strings hide in lists (only way I could mutate these vars in a function) - correct this now
          (setq a-abbrev-text (car a-abbrev-text)) (setq a-expansion-text (car a-expansion-text)))) 

    (if (exists-in-file file-selection a-abbrev-text)
	(progn
	  (setq action
		(get-constrained-response
		 '("1" "2" "3")
		 "1: replace existing abbreviation\n2: choose new abbreviation\n3: choose new file\n\nabbreviation already exists in this file, please choose action\n "
		 "invalid choice\n"))
	  (if (equal action "1" )
	      (progn
		;how we open and close this file really depends whether the buffer is already open and whether it exists in a visible window.
		;1     if in the case that we are calling this function on an abbreviation file itself then we want simply to set mark where we are,
		;      apply the replacement and then jump back to our previous position.
		;2     if in the case that the buffer is open in a different window we want to switch to that window, apply the replacement, save the file,]
		;      and then return to our position in the original window.
		;3     if in the case that the buffer is open but it is not in any open windows we should switch the current window such that we are working
		;      on that buffer, apply the replacement, save, and then switch back to the previous buffer in the same window.
		;4     if in the case that the buffer is not open then we need to open the buffer (in another window, say,) apply the replacement, save the file
		;      kill the buffer and return to the window we were previously working on with the previous buffer

		(let ( (file-choice-state (get-buffer-state this-window-buffer file-no-path)) )
		  ;(find-file-other-window file-selection)
                  (get-constrained-response '("y") (concat "apparently we got that the current buffer state is: " file-choice-state) "hello")
		  
		  (goto-char 1)            ;--------------------------------------------
		  (search-forward (concat "(\"" abbrev-text "\""))                     ;
		  (forward-char 2)                                                     ;
		  (set-mark (point))                                                   ; these instructions can be wrapped up into one little procedure
		  (end-of-line)                                                        ;
		  (search-backward "\"")                                               ;
		  (delete-region (mark) (point))                                       ;
		  (insert expansion-text)  ;--------------------------------------------

		  (save-buffer)
		  (if (> (count-windows) old-win-count) (kill-buffer-and-window)))))
	  
	  (if (equal action "2" )
	      (progn
		(while (equal "" (setq abbrev-text (read-from-minibuffer "new abbreviation? "))) )
		(abv-abbreviation-maker abbrev-text expansion-text file-selection)))

	  (if (equal action "3" )
	    (abv-abbreviation-maker abbrev-text expansion-text (concat "abbrevsGen.backup/" (nth (- (string-to-number (get-file-choice file-lists 0)) 1) str)))))

      ;the else case, we're just going to append the abbreviation to the end of the file
      (progn
	(let ( (old-win-count (count-windows)) )
	  (find-file-other-window file-selection)
	  (end-of-buffer)
	  (insert (concat "\n(\"" abbrev-text "\" \"" expansion-text "\")"))
	  (if (> (count-windows) old-win-count) (kill-buffer-and-window)))
	))
     ; )
    ;(princ (get-split-string-from-file file-selection) )
					;  (princ conc-text)
					;  ;(shell-command conc-text));;end let
    ))

;(abv-abbreviation-maker)

(defun add-abbreviation (iAbbrevList)
  )

(provide 'abv-functions)


(defun exists-in-file (file search-str)
  (interactive)
  (let ( (old-win-count (count-windows)) )
    ;this function here needs to determine the buffer state of the file that we are going to be searching through, just counting windows, whatever I was trying to achieve with that logic, is simply not going to work in the slightest.
  (condition-case err
      (progn
	(if (not (file-exists-p file)) (signal 'file-error file) )
	(find-file-other-window file)
	(goto-char 1)
	(setq found (search-forward search-str))
	(if (> (count-windows) old-win-count) (kill-buffer-and-window) )
	found)
    ('file-error (message "cannot find file: %s" err) )
    ('search-failed (kill-buffer-and-window))
    )))

;(exists-in-file "abbrevsGen.backup/testing" "(\"popn\"")

;(princ (current-buffer))

(defun get-constrained-response (allowed-responses prompt reply-text )
  (let ((ret-val) (new-prompt prompt))
    (while (not
	    (member
	     (setq ret-val
		   (read-from-minibuffer new-prompt))
	     allowed-responses) )
      (setq new-prompt (concat reply-text prompt)))
    ret-val))
;    (get-constrained-response allowed-responses (concat reply-text prompt) "")))


;(get-constrained-response '("1" "2" "3") "say something" "grrrr")
(end-of-buffer)

(insert "\n")
 

(defun exists-buffer-p (buf)
(not (equal nil (get-buffer buf))) )

(exists-buffer-p "testing")

(defun tokenise-string (i-string i-token-variable)
  (interactive)
  (let ( (o-list (reverse (split-string i-string i-token-variable))))
    ;(if (equal (car o-list) "") (setq o-list (cdr o-list) ))
;    (if (equal (length o-list) 1) (setq o-list (list o-list) ))
    (reverse o-list)
    )
  )

(tokenise-string "fg#" "#")

(defun get-indexed-string (i-strings i-start i-end i-prior i-after)
  (let ( (start-list) (end-list) (current-index i-start) (counter 0) (o-list))
    (while (< counter i-prior)
      (setq start-list (cons
                        (insert-index i-strings i-start counter)
                        start-list)) (setq counter (+ counter 1)))
    (setq counter (+ (* i-after -1) 1))
    (while (< counter 1)
      (setq end-list (cons
                        (insert-index i-strings i-end counter)
                        end-list)) (setq counter (+ counter 1)))
    (setq o-list (list (reverse start-list) (reverse end-list)))
                                        ;(princ start-list)
    ;;first make two lists the start-list and the end-list
    ))

(defun insert-index (i-string-list i-last-index i-incr)
  "this function should be given just a list of tokens - the last element will not need an index (it will be \"\" if the original expression ended with a #). appended on each token will be the sum of the last index and the amount to increment. At the end all tokens should be recombined into one string"
  (let ( (temp-list ) (o-string ""))
    ;;chomping off the end element for now (it needs no index) - we shall put it back at the end
    (setq temp-list (cdr (reverse i-string-list)))
    ;;append everything with indexes
    (setq temp-list (mapcar (lambda (lam-x) (setq lam-x (concat lam-x (calc-index-increment i-last-index i-incr)) )) temp-list))
    ;;get back the last element
    (setq temp-list (reverse (cons (car (reverse i-string-list)) temp-list)))
    ;;make into one string
    (mapcar (lambda (x) (setq o-string (concat o-string x)) ) temp-list)
    o-string
  ))

;(insert-index (list "" "f_" "g^" "") "n" 3)

;(insert-index (list "f_" "") "n" 3)


(defun calc-index-increment (i-lhs i-rhs)
  "Will increment the left handside by the right handside. the right hand side should be a number. The output will be braced if the string length is greater than 1"
  (let ( (temp) )
    (setq temp (calc-eval (concat i-lhs " + " (number-to-string i-rhs) )))
    (if (> (length temp) 1)
        (setq temp (concat "{" temp "}") ))
    temp))

;(get-indexed-string (list "\\frac{g_" "}{f^" "(x)}") "n" "q+5" 2 2)
;(get-indexed-string (list "f_#") "n" "q+5" 2 2)

(defun join-strings (i-list &optional glue-string chomp)
  (let ((o-string "") (glue (if (or (not glue-string) (equal glue-string "")) "" glue-string)) (temp ""))
    (mapcar (lambda (x) (setq o-string (concat o-string x glue)) ) i-list)
    (if (and (not (equal glue "")) (not (equal chomp "no-chomp")))
        (setq o-string (chomp-last-char o-string)))
    o-string
      ) )

(defun chomp-last-char (i-string)
  (reverse-string (substring (reverse-string i-string) 1)))

(defun chomp-n-last-chars (i-string i-substring-index)
  (reverse-string (substring (reverse-string i-string) i-substring-index)))

(defun chomp-first-char (i-string)
  (substring i-string 1))

(defun chomp-n-first-chars (i-string i-substring-index)
  (substring i-string i-substring-index))

(defun reverse-string (i-string)
  (apply 'string (reverse (string-to-list i-string))) )

(join-strings (list "hello" "horrible" "world") " ")

(chomp-n-last-chars (join-strings (list "hello" "world") " ") 5)

(defun sum-or-sequence (&optional do-defaults sep)
  "type in some expression for which a variable index is given the placeholder symbol #. You will be asked where the sequence starts, where it ends, how many terms precede the dots, how many come after, and what separates the terms. The resulting expression will be expanded out with respect to #"
  (interactive)
  (let ((expression (read-from-minibuffer "expression? (place holder symbol for index var will be '#')"))
        (start-term (read-from-minibuffer "starting term? "))
        (end-term (read-from-minibuffer "last term? "))
        (terms-prior (string-to-number (read-from-minibuffer "terms before dots? ")))
        (terms-after (string-to-number (read-from-minibuffer "terms after dots? ")))
        (separator (read-from-minibuffer "term separator? ") );else get from input!
        (string-tokenised)
        (lhs-and-rhs)
        (print-str)
        (temp) ;this one is not needed methinks
        (dots-type)
        (chomp-num))

    (if (member separator (list "," ""))
        (progn
          (setq dots-type "\\dots")
          (setq separator ",\\ ")
          (setq chomp-num 3))
      (progn
        (setq dots-type "\\cdots")
        (setq chomp-num (+ (length separator) 0))
        (setq separator (concat " " separator " "))
        ))
      
    (if (equal do-defaults t)
        (progn
          (setq string-tokenised (tokenise-string expression "#"))
          (setq lhs-and-rhs (get-indexed-string string-tokenised "1" "n" 2 1)))
        do-defaults
        (progn
          (setq string-tokenised (tokenise-string expression "#"))
          (setq lhs-and-rhs (get-indexed-string string-tokenised start-term end-term terms-prior terms-after))
          ))
    (if (not (cadr lhs-and-rhs) ) (setcdr lhs-and-rhs (list (list " "))) )
    lhs-and-rhs
    (setq print-str
          (concat (join-strings (car lhs-and-rhs) separator "no-chomp")
                  dots-type
                  separator
                  (join-strings (cadr lhs-and-rhs) separator)))
    (insert (chomp-n-last-chars print-str chomp-num))
    )
  )
