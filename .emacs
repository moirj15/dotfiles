(tool-bar-mode -1)
(menu-bar-mode -1)
;(add-to-list 'default-frame-alist '(fullscreen . maximized))
;(split-window-right)
;(set-face-attribute 'default nil :height 110 :family "Monaco")
(setq ring-bell-function 'ignore)
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))


(evil-mode t)

(add-hook 'prog-mode-hook 'highlight-numbers-mode)

; load and configure packages
;(use-package gruvbox-theme
;	     :ensure t)
(use-package jbeans-theme
	     :ensure t)
;(use-package jbeans-theme
;	     :ensure t)
;(use-package jazz-theme
;	     :ensure t)
(use-package fill-column-indicator
  :ensure t)

(use-package projectile
             :ensure t
             :config
             (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
             (projectile-mode +1))


(use-package clang-format
             :ensure t)

;(add-hook 'c-mode-common-hook
;          (function (lambda ()
;                      add-hook 'before-save-hook
;                                'clang-format-buffer)))


;(defun clang-format-buffer-smart ()
;  "Reformat buffer if .clang-format exists in the projectile root."
;  (when (f-exists? (expand-file-name ".clang-format" (projectile-project-root)))
;    (clang-format-buffer)))
;
;(add-hook 'before-save-hook
;          'clang-format-buffer-smart)

(add-hook 'before-save-hook
  (lambda ()
    (when (member major-mode '(c-mode c++-mode glsl-mode))
      (progn
        (when (locate-dominating-file "." ".clang-format")
          (clang-format-buffer))
        ;; Return nil, to continue saving.
        nil))))


(use-package modern-cpp-font-lock
             :ensure t)
(modern-c++-font-lock-global-mode t)


(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t)
  (setq flycheck-check-syntax-automatically '(save mode-enable))
  (setq flycheck-gcc-language-standard "c++17")
  (setq flycheck-gcc-args "-std=c++17"))

(use-package autopair
  :ensure t
  :init (autopair-global-mode))
;;(use-package smartparens
;;  :ensure t
;;  :init (show-smartparens-global-mode +1)
;;  		(smartparens-global-mode 1))
(setq-default c-basic-offset 2
	      tab-width 2
	      indent-tabs-mode-nil)
(c-set-offset 'innamespace 0)
(setq fci-rule-column 80)
(add-hook 'after-change-major-mode-hook 'fci-mode)
(require 'evil)
;(require 'column-marker)
(global-linum-mode t)
(set-default 'truncate-lines t)
;; set keys
(global-set-key (kbd "TAB") 'self-insert-command)
(scroll-bar-mode -1)

(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

;; syntax highlight for methods
;;(font-lock-add-keywords 'c++-mode
;; `((,(concat
;;   "\\<[_a-zA-Z][_a-zA-Z0-9]*\\>"       ; Object identifier
;;   "\\s *"                              ; Optional white space
;;   "\\(?:\\.\\|->\\)"                   ; Member access
;;   "\\s *"                              ; Optional white space
;;   "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
;;   "\\s *"                              ; Optional white space
;;   "(")                                 ; Paren for method invocation
;;   1 'font-lock-function-name-face t)))

;; syntax highlight for functions
;;(font-lock-add-keywords 'c++-mode
;; `((,(concat
;;   "\\s *"                              ; Optional white space
;;   "\\<\\([_a-zA-Z][_a-zA-Z0-9]*\\)\\>" ; Member identifier
;;   "\\s *"                              ; Optional white space
;;   "(")                                 ; Paren for method invocation
;;   1 'font-lock-function-name-face t)))

(setq c-block-comment-prefix "* ")

(global-set-key (kbd "<f5>") (lambda ()
							   (interactive)
							   (setq-local compilation-read-command nil)
							   (call-interactively 'compile)))
(setq auto-mode-alist
      (append
       '(("\\.cpp$"    . c++-mode)
         ("\\.hin$"    . c++-mode)
         ("\\.cin$"    . c++-mode)
         ("\\.inl$"    . c++-mode)
         ("\\.rdc$"    . c++-mode)
         ("\\.h$"    . c++-mode)
         ("\\.c$"   . c++-mode)
         ("\\.cc$"   . c++-mode)
         ("\\.c8$"   . c++-mode)
         ("\\.txt$" . indented-text-mode)
         ("\\.emacs$" . emacs-lisp-mode)
         ("\\.gen$" . gen-mode)
         ("\\.ms$" . fundamental-mode)
         ("\\.m$" . objc-mode)
         ("\\.mm$" . objc-mode)
         ) auto-mode-alist))

;(add-to-list 'default-frame-alist '(font . "Fira Mono-15.5"))
;(set-face-attribute 'default t :font "Fira Mono-15.5")
;;(add-to-list 'default-frame-alist '(font . "Menlo-14"))
;;
;;(set-foreground-color "burlywood3")
;;(set-background-color "#161616")
;;(set-cursor-color "#40FF40")
;;(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
;;(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
;;(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
;;(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
;;(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
;;(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
;;(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
;;(set-face-attribute 'font-lock-type-face nil :foreground "DarkGoldenrod3")
;;(set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")
(setq fixme-modes '(c++-mode c-mode emacs-lisp-mode))
 (make-face 'font-lock-fixme-face)
 (make-face 'font-lock-study-face)
 (make-face 'font-lock-important-face)
 (make-face 'font-lock-improve-face)
 (make-face 'font-lock-note-face)
 (mapc (lambda (mode)
	 (font-lock-add-keywords
	  mode
	  '(("\\<\\(TODO\\)" 1 'font-lock-fixme-face t)
	    ("\\<\\(STUDY\\)" 1 'font-lock-study-face t)
		("\\<\\(IMPROVE\\)" 1 'font-lock-improve-face t)
	    ("\\<\\(IMPORTANT\\)" 1 'font-lock-important-face t)
            ("\\<\\(NOTE\\)" 1 'font-lock-note-face t))))
	fixme-modes)
 (modify-face 'font-lock-fixme-face "Red" nil nil t nil t nil nil)
 (modify-face 'font-lock-study-face "Yellow" nil nil t nil t nil nil)
 (modify-face 'font-lock-improve-face "Red" nil nil t nil t nil nil)
 (modify-face 'font-lock-important-face "Yellow" nil nil t nil t nil nil)
 (modify-face 'font-lock-note-face "Dark Green" nil nil t nil t nil nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-selected-packages
	 (quote
		(highlight-numbers smartparens ## ujelly-theme autopair flycheck fill-column-indicator column-marker use-package gruvbox-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
