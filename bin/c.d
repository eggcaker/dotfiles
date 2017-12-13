#!/usr/bin/env emacs --script

;;; Commentary:

;;; Code:
(load "~/.emacs.config" t t)


(defvar el/tt (string-to-number (car argv)))

(if (or (= 0 (length argv)) (<= el/tt 0))
    (message (number-to-string (float-time)))
  (let ((seconds (if (> el/tt 6489546000 ) el/tt (/ el/tt 1000))))
    (message (format-time-string
              "%Y-%m-%d %H:%M:%S"
              (seconds-to-time (* seconds 1000))))))
