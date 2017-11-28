
; Getting assignments
(set-option :produce-assignments true)
(set-logic QF_UF)
(declare-const p Bool) (declare-const q Bool) (declare-const r Bool)
(assert (not (=(! (and (! p :named P) q) :named PQ) (! r :named R))))
(check-sat)
; sat
(get-assignment)
; ((P true) (R false) (PQ true))
(exit)