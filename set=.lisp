; Copyright 2017 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

(defmacro set= (&rest proc-var-form-list)
  (let ((lst))
    (dolist (pvf proc-var-form-list)
      (let ((proc (first pvf)) (var (second pvf)) (form (third pvf)))
        (when (eq proc 'cons) (psetf var form form var))
        (setf lst (cons pvf (cons var lst)))))
    (setf lst (reverse lst))
    `(setf ,@lst)))

