#!/bin/bash

sudo cp clojure.lang /usr/share/gtksourceview-2.0/language-specs/clojure.lang
sudo cp clojure.xml /usr/share/mime/packages/clojure.xml
cd /usr/share/
sudo update-mime-database mime
sudo apt-get install clojure



