; Copyright (c) Paul R. Tagliamonte <tag@pault.ag>, 2013 under the terms of
; hy.

(require hy.contrib.meth)
(import [flask [Flask render-template]])

(setv app (Flask "__main__"))  ; long story, needed hack

(route repl "/" [] (render-template "index.html"))
