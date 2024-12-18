;;;; init.el --- My configuration for GNU Emacs -*- lexical-binding: t -*-

;;;
;;; Package management
;;;

;; straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;;;
;;; User Interface
;;;

;; Set font
(set-face-attribute 'default nil
		    :family "JetBrains Mono"
		    :height 110)

;; Set theme
(use-package lab-themes
  :config
  (lab-themes-load-style 'light))
