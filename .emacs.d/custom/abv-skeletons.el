;;latex skeletons
(define-skeleton 1-brace "" nil "{" _ "}")
(define-skeleton 2-brace "" nil "{" _ "}{}")
(define-skeleton 3-brace "" nil "{" _ "}{}{}")
(define-skeleton 4-brace "" nil "{" _ "}{}{}{}")
(define-skeleton sqrt-frac "" nil "\\sqrt{\\frac{" _ "}{}}")
(define-skeleton b-matrix "" nil "\\begin{bmatrix}\n" _ "\n\\end{bmatrix}")
(define-skeleton enumerate "" nil "\\begin{enumerate}\n\\item " _ "\n\\end{enumerate}")
(define-skeleton tabular "" nil "\\begin{center}\n\\begin{tabular}\n" _ "\n\\end{tabular}\n\\end{center}")
(define-skeleton no-numbered-equation "" nil "\\begin{equation}\n\\nonumber " _ "\n\\end{equation}")
(define-skeleton no-numbered-align "" nil "\\begin{align}\n\\nonumber " _ "\n\\end{align}")
(define-skeleton numbered-equation "" nil "\\begin{equation}\\label{" _ "}\n\n\\end{equation}")
(define-skeleton numbered-align "" nil "\\begin{align}\\label{" _ "}\n" _ "\n\\end{align}")
(define-skeleton quotes "" nil "``" _ "''")
(define-skeleton nth-root "" nil "\\sqrt[" _ "]{}")
(define-skeleton underline "" nil "\\underline{" _ "}") 
(define-skeleton brace-func "" nil "\\left\\{\\begin{array}{l}" _ "\\end{array}\\right.")
(define-skeleton smallsum "" nil "\\sum\\nolimits_{" _ "}^{}")
(define-skeleton overbrace "" nil "\\overbrace{" _ "}^{}")
(define-skeleton volumeint "" nil "\\int\\!\\!\\!\\int\\!\\!\\!\\int\\nolimits_{" _ "}{}\\,\\di{}")
(define-skeleton surfaceint "" nil "\\int\\!\\!\\!\\int\\nolimits_{" _ "}{}\\,\\di{}")
(define-skeleton inlineint "" nil "\\int\\nolimits_{" _ "}^{}{}\\,\\di{}")
(define-skeleton inline-partial-derivative "" nil "\\tfrac{\\partial {" _ "}}{\\partial {}}")
(define-skeleton maths-comment "" nil "\\comment{" _ "}{}")
(define-skeleton include-graphics "" nil "\n\\begin{figure}[h]\n\\centering\n\\includegraphics[width=1.00\\textwidth]{Diagrams/" _ "}\n\\caption{}\n\\label{}\n\\end{figure}")
(define-skeleton bigproduct "" nil "\\displaystyle{\\prod\\limits_{\\substack{" _ "}}^{}}")
(define-skeleton bigsummation "" nil "\\displaystyle{\\sum\\limits_{\\substack{" _ "}}^{}}")
(define-skeleton quoted "" nil "``" _ "''")

;;html skeletons
(define-skeleton sk_html "" nil "<html>\n" _ "\n" "</html>")
(define-skeleton sk_head "" nil "<head>\n" _ "\n" "</head>")
(define-skeleton sk_title "" nil "<title>\n" _ "\n" "</title>")
(define-skeleton sk_body "" nil "<body>\n" _ "\n" "</body>")
(define-skeleton sk_h1 "" nil "<h1>" _ "</h1>")
(define-skeleton sk_h2 "" nil "<h2>" _ "</h2>")
(define-skeleton sk_h3 "" nil "<h3>" _ "</h3>")
(define-skeleton sk_h4 "" nil "<h4>" _ "</h4>")
(define-skeleton sk_h5 "" nil "<h5>" _ "</h5>")
(define-skeleton sk_h6 "" nil "<h6>" _ "</h6>")

(define-skeleton sk_arg_body "" "" 
    '(setq v1 (skeleton-read "type? "))
    "<body" (if (eq (length v1) 0) "" (concat " type=\"" v1 "\"")) ">" _ "</body>")

;would be cool if this thing could actually help search for the files from the current directory
(define-skeleton sk_img "" "" 
    "<img"
    '(setq v1 (skeleton-read "src? "))
    (if (eq (length v1) 0) "" (concat " src=\"" v1 "\""))
    '(setq v1 (skeleton-read "width? "))
    (if (eq (length v1) 0) "" (concat " width=\"" v1 "\""))
    '(setq v1 (skeleton-read "height? "))
    (if (eq (length v1) 0) "" (concat " height=\"" v1 "\""))
    "/>")



;(define-skeleton java-class "" "" 
;    '(setq v1 (skeleton-read "public? "))
;    (if (equal v1 "y") "public " "")
;    '(setq v1 (skeleton-read "static? "))
;    (if (equal v1 "y") "static " "")
;    "class "
;    '(setq v1 (skeleton-read "name? "))
;    v1
;    '(setq v1 (skeleton-read "extends? "))
;    (if (eq (length v1) 0) "" (concat " extends " v1))
;    "\n"
;    > "{\n    "
;    '(setq v1 (skeleton-read "main? "))
;    > (if (equal v1 "y") "public static void main (String [] args)\n    {\n        " "")
;    > _
;    > (if (eq (length v1) 0) "\n}" "\n    }\n}"))

(define-skeleton java-class "" "" 
    '(setq v1 (skeleton-read "public? "))
    (if (equal v1 "y") "" "")
    v1)

;(define-skeleton sk_a "" "" 
;    "<a"
;    '(setq v1 (skeleton-read "href? "))
;    (if (eq (length v1) 0) "" (concat " href=\"" v1 "\""))
;    ">" _ "</a>")
;(define-skeleton sk_a "" ""
;    "<a"
;    (let ((empty (setq v1 (skeleton-read "href? "))))) 
;    (if (eq (length v1) 0) "" (concat " href=\"" v1 "\""))
;    ">" _ "</a>")

;(defmacro html_sk (name &rest args)
;   `(define-skeleton ,(make-symbol (concat "sk_" (symbol-name `,name))) "" ""
;       ,(concat "<" (symbol-name name))
;       ,(let (retval)
;           (dolist (element args `value)
;               (setq retval (cons `(interrogate-element element) retval))
;               (reverse retval)))
;       ">" _ ,(concat "</" (symbol-name name) ">")))
;
;(html_sk a "foo")

;; TODO to study
;;http://www.emacswiki.org/emacs/MacroBasics

;    (defmacro latex-skeleton (code)
;      (let ((func (intern (concat "latex-skeleton-" code)))
;            (doc (format "Inserts a %s clause in a LaTeX document." code)))
;        `(define-skeleton ,func ,doc "String: "
;           "\\" ,code  "{" str | "insert text" "}")))

(define-skeleton sk_a "" "" 
    "<a" (interrogate-element "href") ">" _ "</a>")

(defmacro interrogate-element (item)
    (let ((temp (make-symbol "v1")))
       `(let ((,temp ""))
           (setq ,temp (skeleton-read (concat ,item "? "))) ;; I don't want this to print - hence quote
           (if (eq (length ,temp) 0) "" (concat " " ,item "=\"" ,temp "\"")))))
