; Copyright 2017 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

; [examples]
; (set= (+ a 1)) => (setq a (+ a 1))
; (set= (/ b 2)) => (setq b (/ b 2))
; (set= (cons 3 c)) => (setq c (cons 3 c))
; (set= (cddr lst1) (cdr lst2))
;   => (setq lst1 (cddr lst1)) (setq lst2 (cdr lst2))

(defmacro set= (&rest proc-var-form-list)
  (let ((lst))
    (dolist (pvf proc-var-form-list)
      (let ((proc (first pvf)) (var (second pvf)) (form (third pvf)))
        (when (eq proc 'cons) (psetf var form form var))
        (setf lst (cons pvf (cons var lst)))))
    (setf lst (reverse lst))
    `(setf ,@lst)))

