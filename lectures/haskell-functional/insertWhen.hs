module InsertWhen where

insertWhen p toAdd [] = []
insertWhen p toAdd (a:as) =
    if (p a)
    then toAdd:a:(insertWhen p toAdd as)
    else a:(insertWhen p toAdd as)
