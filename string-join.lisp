; Copyright 2017 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

; (thanks to Shiro Kawai)
; you can also write like this:
; (format nil "~{~a~^, ~}" (list "A" "B" "C")) => "A, B, C"

(defun string-join (separator string-list)
  (let ((s (make-string-output-stream)) (res))
    (write-string (car string-list) s)
    (dolist (str (cdr string-list))
      (write-string separator s)
      (write-string str s))
    (setf res (get-output-stream-string s))
    (close s)
    res))

