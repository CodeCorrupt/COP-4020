sig semantic_net.
  
  kind event type.
  kind person type.
  kind thing type.
  kind verb type.
  
  type event1	event.
  type paper	thing.
  type sue	person.
  type ron	person.
  type gave 	verb.
  type event2	event.
  type football	thing.
  type swen	person.
  
  type object	event -> thing -> o.
  type recipient event -> person -> o.
  type actor	event -> person -> o.
  type action 	event -> verb -> o.
