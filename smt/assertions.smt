; Getting assertions
(set-option :produce-assertions true)
(set-logic QF_UF)
(declare-const p Bool) (declare-const q Bool) 
(push 1)
 (assert (or p q))
 (push 1)
  (assert (not q))
  (get-assertions)
  ; ((or p q)
  ;  (not q)
  ; )
 (pop 1)
  (get-assertions)
 ; ((or p q))
 (pop 1)
 (get-assertions)
 ; ()
(exit)