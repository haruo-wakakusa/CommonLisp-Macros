; Copyright 2017 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

(defmacro make-named-list-constant (name start end list)
  (let ((symbol nil)
        (body (loop for i from start to end collect
                (progn
                  (setq symbol
                    (read-from-string (format nil "+~A~d+" name i)))
                  (list 'defconstant symbol (list 'copy-list list))))))
    (cons 'progn body)))

