# geteilte-Folien
This directory contains files hardlinked to shared files.

This did not work:

Alle Folien, die in mehreren anderen Foliensätzen vorkommen. Diese werden über submodule eingebunden.

git submodule add git@github.com:stefan11/geteilte-Folien.git


In den anderen Projekten kann man die submodule aktualisieren, nach dem hier aktualisiert wurde.

git submodule foreach git pull