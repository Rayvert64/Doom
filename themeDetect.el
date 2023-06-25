;;; This is a file to detect the theme based on https://www.tomica.net/blog/2022/08/detect-system-theme-in-emacs/
(defun system-dark-mode-enabled-p ()
  "Check if dark mode is currently enabled."
  (pcase system-type
    ('darwin
     ;; Have to use osascript here as defaults returns inconsistent results
     ;; - AppleInterfaceStyleSwitchesAutomatically == 1 ;; exists only if the theme is set to auto
     ;; - AppleInterfaceStyle == Dark ;; exists only if the theme is set to dark
     ;; How to determine if theme is light or dark when Automatic Theme switching is in place?
     ;; Luckily, osascript can provide that detail
     (if (string= (shell-command-to-string "printf %s \"$( osascript -e \'tell application \"System Events\" to tell appearance preferences to return dark mode\' )\"") "true") t))
    ('gnu/linux
     ;; prefer-dark and default are possible options
     (if (string= (shell-command-to-string "gsettings get org.gnome.desktop.interface color-scheme") "\'prefer-dark\'\n") t))))

(defun load-proper-theme ()
  "Load dark/light variant depending on the system theme"
  (interactive)
  (if (system-dark-mode-enabled-p)
      (load-theme 'doom-nord)
    (load-theme 'doom-nord-light)))
