# Umgebung aufsetzen

- Orginal "vimfiles"-Verzeichnis in "C:\Program Files (x86)\Vim" umbenennen
oder löschen.
- Neues Verzeichnis "vimfiles" an beliebiger Stelle erzeugen, z: D:\usr\var\vimfiles
und \_vimrc-Datei dorthin verschieben.

# Symlinks erstellen

Im Verzeichnis "C:\Program Files (x86)\Vim\"

```
mklink /D vimfiles D:\usr\var\vimfiles
mklink \_vimrc D:\usr\var\vimfiles\_vimrc
mklink \_vimrc~ D:\usr\var\vimfiles\_vimrc~
```

# vimfiles Verzeichnis mit Git verwalten

```
cd D:\usr\var\vimfiles
git init
git add .
gitcommit -m "Initial commit"
```

# Neues Plugin hinzufügen

```
git submodule add http://github.com/tpope/vim-fugitive.git bundle/fugitive
git add .
git commit -m "Install Fugitive.vim bundle as a submodule."
```

# Umgebung auf anderem Rechner installieren

Schritte aus "Umgebung aufsetzen" und "Symlinks erstellen" durchführen

```
cd D:\usr\var\vimfiles
git clone https://github.com/ghid/vimfiles .
git submodule update --init
```

# Einzelnes Submodul aktualisieren

```
cd D:\usr\var\vimfiles\bundle\fugitive
git pull origin master
```

# Alle Submodule aktualisieren

```
cd D:\usr\var\vimfiles\bundle
git submodule foreach git pull origin master
```
