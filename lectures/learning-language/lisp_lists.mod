module lisp_lists.

  % an inductive definition
  to_list the_empty_list nil.
  to_list (cons Head Tail) (Head::PL)
        :- to_list Tail PL.

end
