#!/bin/bash

cd /tmp

echo "Importing Pre Dumps into /tmp"
git clone https://github.com/nZEDb/nZEDbPre_Dumps.git

echo "Uncompressing GZIPs"
find /tmp/nZEDbPre_Dumps/dumps/ -name "*.csv.gz" -exec gunzip "{}" \;

cd /tmp

echo "Generating Import Script"
for f in /tmp/nZEDbPre_Dumps/dumps/*/*csv; do
        [ -e "$f" ] || continue
        echo "php /var/www/nZEDb/cli/data/predb_import.php local $f" >> /tmp/import.sh
done

echo "Importing"
#bash /tmp/import.sh
