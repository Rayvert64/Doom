;;; keymaps.el -*- lexical-binding: t; -*-
;; This is where I am putting my keybindings.

;;; Movement in all modes
(map! :nvi "C-h" #'evil-backward-WORD-begin)
(map! :nvi "C-l" #'evil-forward-WORD-end)
;; Movement for both normal in visual mode
(map! :nv "C-j" #'evil-forward-paragraph)
(map! :nv "C-k" #'evil-backward-paragraph)
;; Movement for normal mode only
(map! :n "C-M-l" #'evil-window-right)
(map! :n "C-M-h" #'evil-window-left)
(map! :n "C-M-j" #'evil-window-down)
(map! :n "C-M-k" #'evil-window-up)
;; Movement for insert mode
(map! :i "C-j" #'evil-next-line)
(map! :i "C-k" #'evil-previous-line)
