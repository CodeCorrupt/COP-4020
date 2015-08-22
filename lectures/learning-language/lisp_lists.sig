sig lisp_lists.
  
  kind lisp_list        type -> type.
    
  type the_empty_list   (lisp_list T).
  type cons             T -> (lisp_list T) -> (lisp_list T).
    
  type to_list          (lisp_list T) -> (list T) -> o.

 end
