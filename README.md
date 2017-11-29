
# Cl-Smt - Common Interface to SMT (Satisfiable Module Theories) solvers from Common Lisp

This library provides an interface to State-of-the-Art SMT solvers,
such as the entrants of [SMT-COMP](http://smtcomp.sourceforge.net/2017/).

The input to SMT solvers are already S-expression.
Unfortunately, there is a slight difference between the standard CL convention
and the conventions in SMT-LIBS v2.
We absorb the difference using a custom formatter.

Specification of SMT solver input is described in the [official website](http://smtlib.cs.uiowa.edu/) .

Examples are also available in the [official website](http://smtlib.cs.uiowa.edu/examples.shtml).

List of solvers are in the [official website](http://smtlib.cs.uiowa.edu/solvers.shtml).

The following solvers will be supported, and checkmark means "completed".
Each solver `X` is available from an asdf system `cl-smt.X`.

* [ ] cl-smt.aprove
* [ ] cl-smt.boolector
* [X] cl-smt.cvc3 --- not conforming to smtlib v2
* [X] cl-smt.cvc4
* [ ] cl-smt.mathsat5
* [ ] cl-smt.opensmt2
* [ ] cl-smt.rasmt
* [ ] cl-smt.smtinterpol
* [ ] cl-smt.stp
* [ ] cl-smt.verit
* [ ] cl-smt.yices2
* [X] cl-smt.z3
* [ ] cl-smt.alt-ergo
* [ ] cl-smt.smt-rat

## API

     (defgeneric solve (input solver-designator &key debug))

       INPUT is a list of S-expressions which defines the SMT solver input[1].
       SOLVER-DESIGNATOR is a keyword that specifies the solver.
       ARGS is an optional list of arguments that are passed to the solver, which is implementation-dependent.
     
     [1] http://smtlib.cs.uiowa.edu/papers/smt-lib-reference-v2.6-r2017-07-18.pdf

Sub-libraries should provide the methods for it.

## S-exp -> SMT-LIB

Although SMT-LIB v2 input is also an S-exp, there is a significant difference in the
assumptions made in CL and SMT-LIB. To absorb this difference, we provide a special DSL
for feeding the SMT-LIB input conveniently from Common Lisp.

    function format-smt (s forms)
    
    Print a smt program to a stream.
    Although it may sound intuitive, this is not; For example,
    
    * NIL should be written as () instead
    * Package prefix is not allowed while keywords should be printed with a colon, so princ is NG
    * Type checking (only numbers, symbols, lists)
    * Dotted list is not allowed.
    * Incompatible assumptions in the readtable case between SMT-LIB and Common Lisp.
    
    We achieve the versatile output by NOT making any assumptions to the readtable case, nor the print case.
    
    Normal, non-mixed case symbols are printed in downcase, because most keywords in SMT are defined in downcase.
    Mixed case symbols are printed in vertical bars, as usual.
    
    However, certain symbols need to be printed in ALL UPCASE.
    We mark such symbols by prepending a caret ^ character, i.e. ^QF_LIA .
    
    All symbols except keywords are printed without package prefixes, including uninterned symbols.

## Dependencies
This library is at least tested on implementation listed below:

+ SBCL 1.4.0 on X86-64 Linux 4.10.0-38-generic (author's environment)

Also, it depends on the following libraries:

+ trivia :
    
+ alexandria by *Nikodemus Siivola <nikodemus@sb-studio.net>, and others.* :
    Alexandria is a collection of portable public domain utilities.
+ iterate by ** :
    Jonathan Amsterdam's iterator/gatherer/accumulator facility

## Installation

## Author

* Masataro Asai (guicho2.71828@gmail.com)

## Copyright

Copyright (c) 2017 Masataro Asai (guicho2.71828@gmail.com)

# License

Licensed under the LLGPL License.


