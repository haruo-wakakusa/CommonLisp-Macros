; Copyright 2018 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

; [examples]
; (-> 10
;     (loop for i from i upto $ collect i)
;     (apply #' $))
; 55

(defmacro -> (init &rest forms)
  (let ((forms! (loop for form in forms collect `(setq $ ,form))))
    `(let (($ ,init))
      ,@forms!
      $)))

