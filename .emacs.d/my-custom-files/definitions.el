(defun
    byte-recompile () (interactive)
    (byte-recompile-directory "~/.emacs.d/my-custom-files" 0)
    (byte-compile-file "~/.emacs.d/init.el" 0))

;; Usage: emacs -diff file1 file2
(defun
    command-line-diff (switch)
  (let
      ((file1 (pop command-line-args-left))
       (file2 (pop command-line-args-left)))
    (ediff file1 file2)))

(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

;; A function definition can have up to 5 parts
;; 1) the name of the function
;; 2) the arguments that you pass to the function. If none, then ()
;; 3) documentation describing the function.
;; 4) make the function interactive aka. ce can use it.
;; 5) the body of the function

(defun tab-whole-buffer ()
  "This function marks the whole buffer and tabs"
  (interactive)
  (defvar position-of-point (point)
    "The current position of point")
  (mark-whole-buffer)
  (indent-for-tab-command)
  (goto-char position-of-point))

;; Interactive "p" tells emacs to pass the prefix argument to the function.
;; aka from a C-u call.
(defun viper-cut-line ()
  "this function goes to the end of the previous line then returns"
  (interactive)
  (move-beginning-of-line ())
  (set-mark-command ())
  (move-end-of-line ())
  (kill-line)
  (newline))

;;useful for keybindings
(defun viper-newline ()
  "this function goes to the end of the previous line then returns"
  (interactive)
  (forward-line -1)
  (move-end-of-line ())
  (indent-for-tab-command)
  (viper-insert ())
  (newline)
  (indent-for-tab-command))

(defun viper-Newline ()
  "this function goes to the end of the previous line then returns"
  (interactive)
  (forward-line)
  (move-beginning-of-line ())
  (newline-and-indent)
  (forward-line -1)
  (indent-for-tab-command)
  (viper-insert ()))

;; the following is trying to calculate % differance
;;5.0 10.0
(defun percent-difference ()
  "blah blah"
  (interactive)
  (let (number1 number2 number3 number4 val1 val2)
    (setq number1 (point))
    (forward-word)
    (forward-word)
    (setq number2 (point))
    (kill-ring-save number1 number2)
    (setq val1 (string-to-number (car kill-ring)))
    (print (car kill-ring))
    (print val1)
    (forward-word)
    (backward-word)
    (setq number3 (point))
    (forward-word)
    (forward-word)
    (setq number4 (point))
    (kill-ring-save number3 number4)
    (setq val2 (string-to-number (car kill-ring)))
    (print val2)
    (print (* (/ (- val1 val2) val2) 100))))

(defun viper-org-cycle ()
  "this function goes to the end of the previous line then returns"
  (interactive)
  (move-beginning-of-line ())
  (org-cycle))


(defun viper-copy-this-html-element ()
  "this function goes to the end of the line then returns"
  (interactive)
  (move-end-of-line ())
  (indent-for-tab-command)
  (viper-insert ())
  (newline))

(defun join-bottom-line ()
  (interactive)
  (join-line -1))

(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines 1))
    (forward-line)
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))
    (save-excursion
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)))

(defun my-org-time-stamp ()
  (interactive)
  (end-of-line)
  (newline-and-indent)
  (org-time-stamp))

;;this function creates a hot-key M-x gtd that will open my gtd file
(defun gtd ()
  "This command opens ~/things_to_do.org"
  (interactive)
  (find-file "~/documents/things_to_do.org"))

;; this function will open my init file for me
(defun init-file ()
  "init-file opens ~/.emacs"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun vim ()
  "loads my viper initialization file"
  (interactive)
  (load "~/.emacs.d/viper")
  (find-file "~/.emacs.d/viper"))

;; This file will open rc.lua
(defun rc.lua ()
  "This command opens ~/.config/awesome/rc.lua"
  (interactive)
  (find-file "~/.config/awesome/rc.lua"))

;; This file will open emacs.texi
(defun emacs.texi ()
  "This command opens ~/manuals/cheatsheats/emacs.texi"
  (interactive)
  (find-file "~/manuals/cheatsheats/emacs.texi"))

;; This file will open gawk.texi
(defun gawk.texi ()
  "This command opens ~/manuals/cheatsheats/gawk.texi"
  (interactive)
  (find-file "~/manuals/cheatsheats/gawk.texi"))

;; this function will open macros.el
(defun macros ()
  "init-file opens ~/.emacs.d/"
  (interactive)
  (find-file "~/.emacs.d/my-custom-files/macros.el"))

;; This file will open definitions.el
(defun definitions ()
  "This command opens ~/.emacs.d/definitions.el"
  (interactive)
  (find-file "~/.emacs.d/my-custom-files/definitions.el"))

(defun hooks ()
  "This command opens ~/.emacs.d/hooks.el"
  (interactive)
  (find-file "~/.emacs.d/my-custom-files/hooks.el"))

(defun abbrev ()
  "This command opens ~/.emacs.d/abbrev_defs"
  (interactive)
  (find-file "~/.emacs.d/my-custom-files/abbrev_defs"))

(defun skeletons ()
  "This command opens ~/.emacs.d/skeletons.el"
  (interactive)
  (find-file "~/.emacs.d/my-custom-files/skeletons.el"))

;;(defun setq ()
;;  "This command opens ~/.emacs.d/setq.el"
;;  (interactive)
;;  (find-file "~/.emacs.d/my-custom-files/setq.el"))

(defun systemd.texi ()
  "This command opens ~/manuals/systemd.texi"
  (interactive)
  (find-file "~/manuals/systemd.texi"))

;;test awesome
(defun test-awesome ()
  "this run /home/joshua/programming/bash/test-awesome.bash"
  (interactive)
  (start-process "testing-awesome" "test-of-awesome" "test-awesome.bash"))
;; you can use start-process like this:
;; (start-process NAME BUFFER PROGRAM &rest PROGRAM-ARGS))
