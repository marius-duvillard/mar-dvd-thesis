;; Machine-dependent configuration - adapt as required for your computer!

;; There are two kinds of settings that might have to be adapted to the
;; specific environment of a computer:
;; 1. Telling Emacs which executables to use for Python and R
;; 2. Telling Emacs to use a Web proxy

;;
;; 1. Telling Emacs which executables to use for Python and R
;;
;; Default setting: Use "python3" under Linux and macOS, but "Python" under Windows.
;; The default for R is "R" for all platforms (predefined by Emacs).
(setq org-babel-python-command
      (if (memq system-type '(windows-nt ms-dos))
          "Python"
        "python3 -q"))

;; If the Python and R executables are on your system's search path,
;; you should not have to modify anything here. If Emacs does not find
;; Python or R, or if it uses a different version of Python or R than you
;; expect, you can uncomment these two lines (one for Python, one for R)
;; and modify them to point to the executables.

;; Python
;; Be careful if the path to your Python installation contains spaces. The path
;; must then be surrounded by backslash-escaped quotation marks, as in
;; (setq org-babel-python-command "\"C:/Program Files/Python/Python37/python.exe\"")

;; R
;; (setq inferior-R-program-name "C:/Program Files/R/R-3.5.1/bin/x64/Rterm.exe")

;;
;; 2. Telling Emacs to use a Web proxy
;;
;; If your local network imposes the use of a Web proxy, you must uncomment and adapt
;; the following lines. Emacs does NOT use system-wide proxy settings. In most
;; cases, only the first two lines (proxy-name and proxy-port) need to be changed,
;; but sometimes the fifth line (no_proxy) also requires modifications. If you are
;; unsure what the right settings are, ask your local network administrator for help.

;; (let* ((proxy-name "proxy.mynetwork.org")
;;        (proxy-port "8080")
;;        (proxy-name-port (concat proxy-name ":" proxy-port))
;;        (proxy-url (concat "http://" proxy-name-port "/")))
;;   (setq url-proxy-services (list (cons "no_proxy" "127.0.0.1")
;;                                  (cons "http"  proxy-name-port)
;;                                  (cons "https"  proxy-name-port)))
;;   (setenv "http_proxy"  proxy-url)
;;   (setenv "https_proxy" proxy-url)
;;   (setenv "JVM_OPTS" (concat "-Dhttp.proxyHost=" proxy-name
;;                              " -Dhttp.proxyPort=" proxy-port)))

(package-initialize)
(add-to-list 'package-archives
		 '("gnu" . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
		 '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
		 '("melpa" . "https://melpa.org/packages/"))
(setq package-archive-priorities '(("melpa-stable" . 100)
                                   ("melpa" . 50)
                                   ("gnu" . 10)))

(require 'cl)
(let* ((required-packages
        '(dash
          htmlize
          ess
          auctex))
       (missing-packages (remove-if #'package-installed-p required-packages)))
  (when missing-packages
    (message "Missing packages: %s" missing-packages)
    (package-refresh-contents)
    (dolist (pkg missing-packages)
      (package-install pkg)
      (message "Package %s has been installed" pkg))))

(require 'org)

(require 'ess-site)

(setq inhibit-splash-screen t)

(setq frame-title-format
  '("Emacs - " (buffer-file-name "%f"
    (dired-directory dired-directory "%b"))))

  (global-font-lock-mode t)
  (custom-set-faces
    '(flyspell-incorrect ((t (:inverse-video t)))))

(line-number-mode 1)
(column-number-mode 1)

(load-library "paren")
(show-paren-mode 1)
(transient-mark-mode t)
(require 'paren)

(defalias 'yes-or-no-p 'y-or-n-p)

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

    (setq
     ns-command-modifier 'meta         ; Apple/Command key is Meta
	 ns-alternate-modifier nil         ; Option is the Mac Option key
	 ns-use-mac-modifier-symbols  nil  ; display standard Emacs (and not standard Mac) modifier symbols
	 )

(cua-mode t)

(global-set-key "\M-g" 'goto-line)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)
;; C-x C-0 restores the default font size

;; Inspired from http://tex.stackexchange.com/questions/166681/changing-language-of-flyspell-emacs-with-a-shortcut
;; (defun spell (choice)
;;    "Switch between language dictionaries."
;;    (interactive "cChoose:  (a) American | (f) Francais")
;;     (cond ((eq choice ?1)
;;            (setq flyspell-default-dictionary "american")
;;            (setq ispell-dictionary "american")
;;            (ispell-kill-ispell))
;;           ((eq choice ?2)
;;            (setq flyspell-default-dictionary "francais")
;;            (setq ispell-dictionary "francais")
;;            (ispell-kill-ispell))
;;           (t (message "No changes have been made."))) )

(define-key global-map (kbd "C-c s a") (lambda () (interactive) (ispell-change-dictionary "american")))
(define-key global-map (kbd "C-c s f") (lambda () (interactive) (ispell-change-dictionary "francais")))
(define-key global-map (kbd "C-c s r") 'flyspell-region)
(define-key global-map (kbd "C-c s b") 'flyspell-buffer)
(define-key global-map (kbd "C-c s s") 'flyspell-mode)

(global-set-key [f5] '(lambda () (interactive) (revert-buffer nil t nil)))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
;; (global-magit-file-mode 1)

(defun auto-fill-mode-on () (TeX-PDF-mode 1))
(add-hook 'tex-mode-hook 'TeX-PDF-mode-on)
(add-hook 'latex-mode-hook 'TeX-PDF-mode-on)
(setq TeX-PDF-mode t)

(defun auto-fill-mode-on () (auto-fill-mode 1))
(add-hook 'text-mode-hook 'auto-fill-mode-on)
(add-hook 'emacs-lisp-mode 'auto-fill-mode-on)
(add-hook 'tex-mode-hook 'auto-fill-mode-on)
(add-hook 'latex-mode-hook 'auto-fill-mode-on)

(setq org-directory "~/org/")

(setq org-hide-leading-stars t)
(setq org-alphabetical-lists t)
(setq org-src-fontify-natively t)  ;; you want this to activate coloring in blocks
(setq org-src-tab-acts-natively t) ;; you want this to have completion in blocks
(setq org-hide-emphasis-markers t) ;; to hide the *,=, or / markers
(setq org-pretty-entities t)       ;; to have \alpha, \to and others display as utf8 http://orgmode.org/manual/Special-symbols.html

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key (kbd "C-c a") 'org-agenda)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-default-notes-file "~/org/notes.org")
     (define-key global-map "\C-cd" 'org-capture)
(setq org-capture-templates (quote (("t" "Todo" entry (file+headline "~/org/liste.org" "Tasks") "* TODO %?
  %i
  %a" :prepend t) ("j" "Journal" entry (file+datetree "~/org/journal.org") "* %?
Entered on %U
  %i
  %a"))))

(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)

(global-set-key (kbd "C-c d") 'insert-date)
(defun insert-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "** %Y-%m-%d")
                   ((equal prefix '(4)) "[%Y-%m-%d]"))))
      (insert (format-time-string format))))

(global-set-key (kbd "C-c t") 'insert-time-date)
(defun insert-time-date (prefix)
    "Insert the current date. With prefix-argument, use ISO format. With
   two prefix arguments, write out the day and month name."
    (interactive "P")
    (let ((format (cond
                   ((not prefix) "[%H:%M:%S; %d.%m.%Y]")
                   ((equal prefix '(4)) "[%H:%M:%S; %Y-%m-%d]"))))
      (insert (format-time-string format))))

(global-set-key (kbd "C-c l") 'org-store-link)

(global-set-key (kbd "C-c <up>") 'outline-up-heading)
(global-set-key (kbd "C-c <left>") 'outline-previous-visible-heading)
(global-set-key (kbd "C-c <right>") 'outline-next-visible-heading)

;; In org-mode 9 you need to have #+PROPERTY: header-args :eval never-export 
;; in the beginning or your document to tell org-mode not to evaluate every 
;; code block every time you export.
(setq org-confirm-babel-evaluate nil) ;; Do not ask for confirmation all the time!!

  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     (emacs-lisp . t)
     (shell . t)
     (python . t)
     (R . t)
     (ruby . t)
     (ocaml . t)
     (ditaa . t)
     (dot . t)
     (octave . t)
     (sqlite . t)
     (perl . t)
     (screen . t)
     (plantuml . t)
     (lilypond . t)
     (org . t)
     (makefile . t)
     ))
  (setq org-src-preserve-indentation t)

(setq rrmooc/new-org-templates (version<= "9.2" (org-version)))
(when  rrmooc/new-org-templates
  (require 'org-tempo))

(require 'subr-x)
(defun rrmooc/add-org-template (old-style-template)
  (add-to-list 'org-structure-template-alist
	       (if rrmooc/new-org-templates
		   (cons
		    (first old-style-template)
		    (string-trim-right (substring (second old-style-template) 8 -9)))
		 old-style-template)))

(unless rrmooc/new-org-templates
  ;; this template is predefined in the new templating system
  (rrmooc/add-org-template
   '("s" "#+begin_src ?\n\n#+end_src" "<src lang=\"?\">\n\n</src>")))

(rrmooc/add-org-template
 '("m" "#+begin_src emacs-lisp\n\n#+end_src" "<src lang=\"emacs-lisp\">\n\n</src>"))

(rrmooc/add-org-template
 '("r" "#+begin_src R :results output :session *R* :exports both\n\n#+end_src" "<src lang=\"R\">\n\n</src>"))

(rrmooc/add-org-template
 '("R" "#+begin_src R :results output graphics :file (org-babel-temp-file \"figure\" \".png\") :exports both :width 600 :height 400 :session *R* \n\n#+end_src" "<src lang=\"R\">\n\n</src>"))

(rrmooc/add-org-template
 '("RR" "#+begin_src R :results output graphics :file  (org-babel-temp-file (concat (file-name-directory (or load-file-name buffer-file-name)) \"figure-\") \".png\") :exports both :width 600 :height 400 :session *R* \n\n#+end_src" "<src lang=\"R\">\n\n</src>"))

(rrmooc/add-org-template
 '("p" "#+begin_src python :results output :exports both\n\n#+end_src" "<src lang=\"python\">\n\n</src>"))

(rrmooc/add-org-template
 '("P" "#+begin_src python :results output :session :exports both\n\n#+end_src" "<src lang=\"python\">\n\n</src>"))

(rrmooc/add-org-template
 '("PP" "#+begin_src python :results file :session :var matplot_lib_filename=(org-babel-temp-file \"figure\" \".png\") :exports both\nimport matplotlib.pyplot as plt\n\nimport numpy\nx=numpy.linspace(-15,15)\nplt.figure(figsize=(10,5))\nplt.plot(x,numpy.cos(x)/x)\nplt.tight_layout()\n\nplt.savefig(matplot_lib_filename)\nmatplot_lib_filename\n#+end_src" "<src lang=\"python\">\n\n</src>"))

(if (memq system-type '(windows-nt ms-dos))
    ;; Non-session shell execution does not seem to work under Windows, so we use
    ;; a named session just like for B.
    (rrmooc/add-org-template
     '("b" "#+begin_src shell :session session :results output :exports both\n\n#+end_src" "<src lang=\"sh\">\n\n</src>"))
  (rrmooc/add-org-template
   '("b" "#+begin_src shell :results output :exports both\n\n#+end_src" "<src lang=\"sh\">\n\n</src>")))

(rrmooc/add-org-template
 '("B" "#+begin_src shell :session *shell* :results output :exports both \n\n#+end_src" "<src lang=\"sh\">\n\n</src>"))

(rrmooc/add-org-template
 '("g" "#+begin_src dot :results output graphics :file \"/tmp/graph.pdf\" :exports both
digraph G {
node [color=black,fillcolor=white,shape=rectangle,style=filled,fontname=\"Helvetica\"];
A[label=\"A\"]
B[label=\"B\"]
A->B
}\n#+end_src" "<src lang=\"dot\">\n\n</src>"))

(global-set-key (kbd "C-c S-t") 'org-babel-execute-subtree)

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images) 
(add-hook 'org-mode-hook 'org-display-inline-images)
(add-hook 'org-mode-hook 'org-babel-result-hide-all)

(setq python-shell-completion-native-enable nil)
