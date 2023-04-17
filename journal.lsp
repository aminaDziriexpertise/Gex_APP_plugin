    (defun CB_ERR ( Msg)
      (setvar "CLAYER" Calq)
      (setq *error* AncErr)
      (princ "test " Msg)
      (princ)
    )   

 (defun c:CB ( / AncErr Calq)
      (setq
        AncErr *error*
        *error* CB_ERR
        Calq (getvar "CLAYER")
      )
      (setvar "CLAYER" "COTATION")
      (command "_DIMLINEAR" Pause Pause Pause)
      (CB_ERR "")
    ) 

(defun my-function1 (x y)
  (vl-catch-all-error-p
    (lambda ()
      (/ x y))
    (lambda (err)
      (setq error-message (vl-catch-all-error-message err))
      (setq file (open "errors.txt" "a"))
      (write-line error-message file)
      (close file))))
(my-function1 5 0)