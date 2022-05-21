;;; shenshou-tests.el ---  unit tests for shenshou -*- coding: utf-8 -*-

;; Author: Chen Bin <chenbin DOT sh AT gmail DOT com>

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;;; Code:
;;

(require 'ert)
(require 'shenshou)

(setq shenshou-debug t)
(ert-deftest shenshou-test-sort-subtitles ()
  (let* ((video "movie")
         (subtitles '(("whatever" . (:moviereleasename "whatever"))
                      ("s99" . (:moviereleasename "movie99"))
                      ("s1" . (:moviereleasename "movie1"))))
         sorted-subtitles)
    (setq sorted-subtitles (shenshou-sort-subtitles subtitles video))
    (should (equal (car (nth 0 sorted-subtitles)) "s1"))
    (should (equal (car (nth 1 sorted-subtitles)) "s99"))
    (should (equal (car (nth 2 sorted-subtitles)) "whatever"))))

(ert-run-tests-batch-and-exit)
;;; shenshou-tests.el ends here
