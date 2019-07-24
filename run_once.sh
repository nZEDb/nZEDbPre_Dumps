#!/bin/bash

cd /tmp

echo "Importing PreDB into /tmp"
git clone https://github.com/nZEDb/nZEDbPre_Dumps.git

echo "Generating Import Script"
for f in /tmp/nZEDbPre_Dumps/dumps/*/*csv.gz; do
        [ -e "$f" ] || continue
        echo "php /var/www/nZEDb/cli/data/predb_import.php local $f" >> /tmp/import.sh
done

echo "Importing All PreDB"
bash /tmp/import.sh
