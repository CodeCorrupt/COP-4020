module addtoend2.
  
  equals (addtoend nil X) (X::nil).
  equals (addtoend (Y::L) X) (Y::M)
          :- equals (addtoend L X) M.
