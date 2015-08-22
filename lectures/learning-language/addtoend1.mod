module addtoend1.
  
  addtoend nil E (E::nil).
  addtoend (X::XS) E (X::LS) :- (addtoend XS E LS).

 
