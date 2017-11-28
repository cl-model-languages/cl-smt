; Using scopes to explore multiple problems
(set-option :print-success false)
(set-logic QF_LIA)
(declare-const x Int) (declare-const y Int)
(assert (= (+ x (* 2 y)) 20))
(push 1)
  (assert (= (- x y) 2))
  (check-sat)
  ; sat
(pop 1)
(push 1)
  (assert (= (- x y) 3))
  (check-sat)
  ; unsat
(pop 1)
(exit)