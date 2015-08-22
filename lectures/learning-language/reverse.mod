module reverse.
  reverse nil nil.
  reverse (X::Xs) Zs :- reverse Xs Ls,
                        append Ls (X::nil) Zs.
	

  local append (list T) -> (list T) -> (list T) -> o.
  append nil Ys Ys.
  append (X::Xs) Ys (X::Zs) :- append Xs Ys Zs.
