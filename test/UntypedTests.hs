{- Because untyped is supported by more than one implementation (e.g.,
   both untyped and fulluntyped, we extract eval tests into a common module
 -}

module UntypedTests where


-- Each element in list contains: (label, expected, input)
untypedEvalTests
    = [("binder", "x ", "x/;"),
       ("binder + usage", "x \nx", "x/;x;"),
       ("multi-binder", "x \nx\ny \ny\nx", "x/;x;y/;y;x;"),
       ("app", "x \nx x", "x/;x x;"),
       ("λ", "(λ x. x)", "λ x. x;"),
       ("λ + app", "(λ x. x x)", "λ x. x x;"),
       ("binder + λ", "x \n(λ x'. x')", "x/; λ x. x;"),
       ("apply λ", "(λ y. y)", "(λ x. x) (λ y. y);"),
       ("binder + apply λ", "z \n(λ y. y)", "z/;(λ x. x) (λ y. y);"),
       ("abs + app", "(λ x. x x)", "(λ x. x) (λ x. x x);"),
                                                                             -- test the full sample file from the original untyped impl
       ("full test.f", "x \nx\n(λ x'. x')\n(λ x'. x' x')",
        "/* Examples for testing */\n\nx/;\nx;\n\nλ x. x;\n(λ x. x) (λ x. x x);\n"),
       ("nested lambdas", "(λ b. b)", "(λ x. (λ y. x y x)) (λ z. (λ a. z)) (λ b. b);")
      ]


