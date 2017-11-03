; Copyright 2017 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

(defmacro do-range (param-forms &rest body)
  (let ((var (first param-forms)) (start 0) (end 0) (step 1)
        (len (length param-forms)) (step-val (gensym "STEP-")))
    (cond ((= len 2) (setf end (eval (second param-forms))))
          ((= len 3) (setf start (second param-forms)
                           end (third param-forms)))
          ((= len 4) (setf start (second param-forms)
                           end (third param-forms)
                           step (fourth param-forms))))
    `(let ((,step-val ,step))
      (cond
        ((> ,step-val 0)
          (do ((,var ,start (+ ,var ,step-val))) ((>= ,var ,end)) ,@body))
        ((< ,step-val 0)
          (do ((,var ,start (+ ,var ,step-val))) ((<= ,var ,end)) ,@body))))))
