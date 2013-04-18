#!/bin/bash

read -p "Install Clojure syntax highlighting in Gedit? (y/n)? " answer
case $answer in
    N|n|No|NO|no) echo 'Exiting...'
        ;;
    *) echo 'Yes'
        if [ -d "/usr/share/gtksourceview-2.0" ]
        then
          sudo cp clojure.lang /usr/share/gtksourceview-2.0/language-specs/clojure.lang
        elif [ -d "/usr/share/gtksourceview-3.0" ]
        then
          sudo cp clojure.lang /usr/share/gtksourceview-3.0/language-specs/clojure.lang
        else
          echo "Couldn't find /usr/share/gtksourceview folder (only checked for version 2.0 and 3.0)"
        fi

        sudo cp clojure.xml /usr/share/mime/packages/clojure.xml
        cd /usr/share/
        sudo update-mime-database mime

        read -p "Install/update clojure package on your OS (apt-get)? (y/n)? " answer
        case $answer in
            y|Y|Yes|yes|YES)
                echo 'Yes' 
                sudo apt-get install clojure
                ;;
            *) echo 'Exiting...'
                ;;
        esac
        ;;
esac


