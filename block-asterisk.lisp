; Copyright 2018 Haruo Wakakusa (haruowakakusa@gmail.com)
; 1. Everyone can use, copy and modify the following code.
; 2. Everyone can erase this copyright notice and licence terms.

; [Example]
; (defun fib (i)
;   (block*
;     (var a 1 b 1)
;     (fun req (i) (unless (zerop i) (psetq a b b (+ a b)) (req (1- i))))
;     (req i)
;     a))
; (loop for i below 10 collect (fib i)) => (1 1 2 3 5 8 13 21 34 55)

(defmacro block* (&rest forms)
  (let ((vars nil) (funs nil))
    (dolist (form forms)
      (cond
        ((null form))
        ((atom form))
        ((eq (first form) 'var)
         (do ((rest (rest form) (cddr rest)))
             ((null rest))
           (setq vars (cons (first rest) vars))))
        ((eq (first form) 'fun)
         (setq funs (cons (rest form) funs)))))
    (let ((forms (remove-if (lambda (form) (and (not (atom form))
                                                (eq (first form) 'fun)))
                            forms)))
      (let ((forms (mapcar (lambda (form) (cond ((atom form) form)
                                                ((eq (first form) 'var)
                                                 `(setq ,@(rest form)))
                                                (t form)))
                           forms)))
        `((lambda ()
           (let (,@(mapcar #'list (reverse vars)))
             (labels (,@funs)
               ,@forms))))))))

