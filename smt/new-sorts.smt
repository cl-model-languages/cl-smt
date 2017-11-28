
; Defining and using new sorts
(set-option :print-success false)
(set-logic QF_UF)
(declare-sort A 0)
(declare-const a A) (declare-const b A) (declare-const c A)
(declare-const d A) (declare-const e A)
(assert (or (= c a)(= c b)))
(assert (or (= d a)(= d b)))
(assert (or (= e a)(= e b)))
(push 1)
  (assert (distinct c d))
  (check-sat)
  ; sat
(pop 1)
(push 1)
  (assert (distinct c d e))
  (check-sat)
  ; unsat
(pop 1)
(exit)