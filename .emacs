;; ------------------- PACKAGES ------------------------------------------------
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(require 'package)
(package-initialize)
;; ------------------- PACKAGES ------------------------------------------------

;; ------------------- LOAD PATHS ------------------------------------------------
(add-to-list 'load-path "~/.emacs.d/evil-evil")
(add-to-list 'load-path "~/.emacs.d/custom")
(load "~/.emacs.d/custom/abv-functions.el")
(load "~/.emacs.d/custom/abv-skeletons.el")
(read-abbrev-file "~/.emacs.d/custom/abbrevs.el")
;; ------------------- LOAD PATHS ------------------------------------------------ 

;; ------------------- IMPORTS -----------------------------------------------
(require 'evil)
(evil-mode 1)
(require 'util-functions)
;; ------------------- IMPORTS -----------------------------------------------


;; ------------------- COLOUR SCHEME -------------------------------------------
(set-face-foreground 'minibuffer-prompt "white")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-function-name-face ((t (:foreground "white"))))
 '(font-lock-string-face ((t (:foreground "brightblue")))))
;; ------------------- COLOUR SCHEME -------------------------------------------

;; ------------------- JAVA FUNCTIONS -----------------------------------------------
(defun jcompile ()
 (interactive) 
 (shell-command (concat "javac " (buffer-name (current-buffer)))))

(defun jrun ()
 (interactive)
 (shell-command (concat "java " (car (split-string (buffer-name (current-buffer)) ".java")))))
;; ------------------- JAVA FUNCTIONS -----------------------------------------------

;; ------------------- KEY BINDINGS -----------------------------------------------
;(defun evil-insert-j ()
;  (interactive)
;  (insert "j")
;  (let ((event (read-event nil)))
;    (cond ((= event ?k)
;           (progn
;             (backward-delete-char 1)
;             (evil-normal-state)))
;          ((= event ?f)
;           (progn
;             (backward-delete-char 1)
;             (insert-char 36 2) ; 32 is decimal ascii code for '$'
;             (backward-char)))
;          ((= event ?o)
;           (progn
;             (backward-delete-char 1)
;             (forward-char 1)))
;          (t
;            (push event unread-command-events)))
;          )))

(defun evil-insert-j ()
  (interactive)
  (let ((event (read-event nil)))
    (cond ((= event ?k)
           (progn
             (forward-char 1)
             (evil-normal-state)))
          ((= event ?f)
           (progn
             (insert-char 36 2) ; 32 is decimal ascii code for '$'
             (backward-char)))
          ;((= event ?j)
          ; (progn
          ;   (forward-char 1)))
          (t
            (insert "j")
            (push event unread-command-events)))
          ))

(defun evil-insert-comma ()
  (interactive)
  (let ((event (read-event nil)))
    (cond ((= event ?,)
           (progn
             (forward-char 1)))
          (t
            (insert ",")
            (push event unread-command-events)))
          ))

(define-key evil-insert-state-map "j" 'evil-insert-j)
(define-key evil-insert-state-map "," 'evil-insert-comma)
;; ------------------- KEY BINDINGS -----------------------------------------------

(defun load-emacsrc () (interactive) (load-file "~/.emacs"))
(evil-ex-define-cmd "em[acsrc]" 'load-emacsrc)

(evil-ex-define-cmd "jc[ompile]" 'jcompile)
(evil-ex-define-cmd "jr[un]" 'jrun)

(define-key evil-normal-state-map [left] 'previous-buffer)

(define-key evil-normal-state-map [right] 'next-buffer)

 

(define-key evil-normal-state-map "-" 'shrink-window-horizontally)
(define-key evil-normal-state-map "_" 'enlarge-window-horizontally)
(define-key evil-normal-state-map "=" 'shrink-window)
(define-key evil-normal-state-map "+" 'enlarge-window)
(define-key evil-normal-state-map (kbd "C-j") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-b") 'switch-to-buffer)
(define-key evil-normal-state-map (kbd ",") 'other-window)
(define-key evil-normal-state-map (kbd "?") 'rgrep)
(define-key evil-normal-state-map (kbd "C-_") 'occur-all)
(define-key evil-normal-state-map " " 'next-buffer)
(evil-ex-define-cmd "ls" 'ibuffer)
(evil-ex-define-cmd "mk" 'compile)

;(evil-ex-define-cmd "\?" 'rgrep)

(evil-ex-define-cmd "erc" 'erc)
(evil-ex-define-cmd "lerc" (lambda () (interactive) (load-file "~/.emacs")))
(evil-ex-define-cmd "go" 'std-layout)
(evil-ex-define-cmd "imp" 'ff-find-other-file)
(evil-ex-define-cmd "hea" 'ff-find-other-file)
(evil-ex-define-cmd "narrow" 'narrow-to-region)
(evil-ex-define-cmd "widen" 'widen)
(evil-ex-define-cmd "abs" (lambda () (interactive) (find-file "~/.emacs.d/abbrevs.el")))
(evil-ex-define-cmd "rev" 'revert-buffer)
(evil-ex-define-cmd "cider" 'cider-jack-in)

;; ------------------- KEY BINDINGS -----------------------------------------------


;; ------------------- SETTINGS -----------------------------------------------
(setq c-basic-offset 4)
(setq c-default-style "bsd" c-basic-offset 4)
(setq-default indent-tabs-mode nil)
(setq scroll-step 1)
;; ------------------- SETTINGS -----------------------------------------------


;; ------------------- I-BUFFER -----------------------------------------------
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("c++"  (or (mode . c++-mode)
                           (mode . c-mode)))
               ("java" (mode . java-mode))
               ("tcl"  (mode . tcl-mode))

               ("python" (or (mode . python-mode) (name . "^\\.py$")))
               ("javascript" (or (mode . js-mode) (name . ".*\\.js$")))
               ("css" (or (mode . css-mode) (name . ".*\\.css$")))
               ("html" (or (mode . html-mode) (name . "^\\.html$")))

               ("emacs" (or
                         (name . "^\\*GNU Emacs\\*$")
                         (name . "^\\*Completions\\*$")
                         (name . "^\\*shell\\*$")
                         (name . "^\\.emacs$")
                         (name . "^\\*scratch\\*$")
                         (name . "^\\*Messages\\*$")))))))

(setq ibuffer-formats
      '((mark modified read-only " "
              (name 18 18 :left :elide)
              " "
              (mode 16 16 :left :elide)
              " "
              filename-and-process)))

(add-hook 'ibuffer-mode-hook
                    (lambda () (ibuffer-switch-to-saved-filter-groups "default")))
;; ------------------- I-BUFFER -----------------------------------------------


(setq evil-emacs-state-modes (delq 'ibuffer-mode evil-emacs-state-modes))



























(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (clojure-mode-extra-font-locking cider spinner seq queue pkg-info evil clojure-mode))))
