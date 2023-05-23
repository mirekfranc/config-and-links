(setq gc-cons-threshold (* 500 1024 1024))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

(setq inhibit-startup-message t)
(menu-bar-mode 0)

(setq whitespace-style '(face indentation::space trailing))
(custom-set-faces
 '(hi-green ((t (:background "green"))))
 '(minibuffer-prompt ((t (:foreground "red"))))
 '(mode-line ((t (:foreground "purple" :background "nil"))))
 '(mode-line-inactive ((t (:foreground "blue" :background "nil"))))
 '(whitespace-indentation ((t (:background "darkblue"))))
 '(whitespace-trailing ((t (:background "darkblue")))))

(defun custom-diff-colors ()
  (set-face-attribute
   'diff-added nil :foreground "green" :background "nil" :weight 'bold)
  (set-face-attribute
   'diff-removed nil :foreground "red" :background "nil" :weight 'bold)
  (set-face-attribute
   'diff-changed nil :foreground "purple" :background "nil" :weight 'bold)
  (set-face-attribute
   'diff-file-header nil :foreground "cyan" :background "black" :weight 'bold))
(eval-after-load "diff-mode" '(custom-diff-colors))

(setq split-height-threshold nil)
(if (< (* 3 (window-total-size)) (window-total-width))
    (setq split-width-threshold 0)
  (setq split-width-threshold 9999))

(setq tab-width 8)
(setq c-default-style "stroustrup" c-basic-offset 8)

(setq linum-format "%4d \u2502 ")
(global-linum-mode 1)
(global-hi-lock-mode 1)

;;; keys
(global-set-key (kbd "C-x 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))
(setq amount 12)
(global-set-key (kbd "<f8>") (lambda () (interactive) (shrink-window-horizontally amount)))
(global-set-key (kbd "<f9>") (lambda () (interactive) (enlarge-window-horizontally amount)))

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-s") 'avy-goto-word-1)

;;; rtags
(setq rtags-display-result-backend 'ivy)                                                                                                                                                   

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(when (require 'rtags nil :noerror)
  (define-key c-mode-base-map (kbd "M-.")
    (function rtags-find-symbol-at-point))
  (define-key c-mode-base-map (kbd "M-,")
    (function rtags-find-references-at-point))
  (define-key c-mode-base-map (kbd "M-]")
    (function rtags-location-stack-back))
  (define-key c-mode-base-map (kbd "C-M-]")
    (function rtags-location-stack-forward))
  (define-key c-mode-base-map (kbd "C-M-[")
    (function rtags-location-stack-back))
  (define-key c-mode-base-map (kbd "C-M-i")
    (function rtags-symbol-info))
  (rtags-enable-standard-keybindings)
  (setq rtags-autostart-diagnostics t)
  (rtags-diagnostics))

(defalias 'rfile 'rtags-find-file)
(defalias 'rstack 'rtags-location-stack-visualize)
(defalias 'rcallees 'rtags-find-functions-called-by-this-function)
(defalias 'rsymbol 'rtags-find-symbol)

(with-eval-after-load "mm-decode"
  (add-to-list 'mm-discouraged-alternatives "text/html"))

;;; keys
(global-set-key (kbd "C-x 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(global-set-key (kbd "C-x 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x C-g") 'magit-log)

(global-set-key (kbd "C-x n") (lambda () (interactive) (other-window -1)))
(put 'magit-clean 'disabled nil)

;;;(setq frame-background-mode 'light)
(global-set-key (kbd "<f5>") 'kill-whole-line)
(global-set-key (kbd "<f6>") 'string-inflection-all-cycle)

(global-set-key (kbd "M-s") 'avy-goto-word-1)
(global-set-key (kbd "M-o") 'ace-window)
