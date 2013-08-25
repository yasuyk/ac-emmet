;;; ac-emmet.el --- auto-complete sources for emmet-mode's snippets

;; Copyright (C) 2013 yasuyk

;; Author: Yasuyuki Oka <yasuyk@gmail.com>
;; Version: DEV
;; URL: https://github.com/yasuyk/ac-emmet
;; Package-Requires: ((emmet-mode "1.0.2") (auto-complete "1.4"))
;; Keywords: completion, convenience, emmet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides an auto-complete source for emmet-mode.

;;; Usage:

;;     (require 'ac-emmet)
;;     (add-hook 'emmet-mode-hook 'ac-emmet-setup)
;;     (eval-after-load "auto-complete"
;;       '(add-to-list 'ac-modes 'emmet-mode))

;;; Code:

(require 'auto-complete)
(require 'emmet-mode)

;;;###autoload
(defface ac-emmet-candidate-face
  '((t (:inherit ac-candidate-face)))
  "Face for emmet candidates."
  :group 'auto-complete)

;;;###autoload
(defface ac-emmet-selection-face
  '((t (:inherit ac-selection-face)))
  "Face for the emmet selected candidate."
  :group 'auto-complete)

(defvar ac-emmet-html-snippets-hash
  (gethash "snippets" (gethash "html" emmet-snippets)))

(defvar ac-emmet-html-snippets-keys
  (loop for k being hash-key in ac-emmet-html-snippets-hash collect k))

(defvar ac-emmet-html-aliases-hash
  (gethash "aliases" (gethash "html" emmet-snippets)))

(defvar ac-emmet-html-aliases-keys
  (loop for k being hash-key in ac-emmet-html-aliases-hash collect k))

(defvar ac-emmet-css-snippets-hash
  (gethash "snippets" (gethash "css" emmet-snippets)))

(defvar ac-emmet-css-snippets-keys
  (loop for k being hash-key in ac-emmet-css-snippets-hash collect k))

;;;###autoload
(defconst ac-emmet-source-defaults
  '((candidate-face . ac-emmet-candidate-face)
    (selection-face . ac-emmet-selection-face)
    (symbol . "a")
    (requires . 1)
    (action . (lambda () (call-interactively 'emmet-expand-line))))
  "Defaults common to the various completion sources.")

;;;###autoload
(defvar ac-source-emmet-html-snippets
  (append
   '((candidates . ac-emmet-html-snippets-keys)
     (document . (lambda (s) (gethash s ac-emmet-html-snippets-hash))))
   ac-emmet-source-defaults)
  "Auto-complete source for emmet-mode' html snippet completion.")

;;;###autoload
(defvar ac-source-emmet-html-aliases
  (append
   '((candidates . ac-emmet-html-aliases-keys)
     (document . (lambda (s) (gethash s ac-emmet-html-aliases-hash))))
   ac-emmet-source-defaults)
  "Auto-complete source for emmet-mode' html alias completion.")

;;;###autoload
(defvar ac-source-emmet-css-snippets
  (append
   '((candidates . ac-emmet-css-snippets-keys)
     (document . (lambda (s) (gethash s ac-emmet-css-snippets-hash))))
   ac-emmet-source-defaults)
  "Auto-complete source for emmet-mode' css snippet completion.")

;;;###autoload
(defun ac-emmet-setup ()
  "Add the emmet completion source to the front of `ac-sources'.
This affects only the current buffer."
  (interactive)
  (add-to-list 'ac-sources 'ac-source-emmet-html-snippets)
  (add-to-list 'ac-sources 'ac-source-emmet-html-aliases)
  (add-to-list 'ac-sources 'ac-source-emmet-css-snippets))

(provide 'ac-emmet)

;; Local Variables:
;; coding: utf-8
;; End:

;;; ac-emmet.el ends here