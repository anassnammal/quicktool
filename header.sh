#!/bin/bash

GREEN='\033[0;32m'
NC='\033[0m'

CREATED_DATE_TIME_=$(date -r"$(stat -f "%B" "$0")" "+%Y/%m/%d %H:%M:%S")
UPDATED_DATE_TIME_=$(date -r"$(stat -f '%m' "$0")" "+%Y/%m/%d %H:%M:%S")
OWNER_NAME=$(stat -f '%Su' $0)
OWNER_NAME_=`printf "%-12s" $OWNER_NAME`
OWNER__EMAIL_="$OWNER_NAME@student.1337.ma"
OWNER__EMAIL_____________=`printf "%-26s" $OWNER__EMAIL_`
HEADER="\\
# ██████████████████████████████████████████████████████████████████████████████▌\\
# ▌                                                                             ▌\\
# ▌▐██████▌   ▐████████▌ ▐████████▌ ▐████████▌ ▌  header.sh                     ▌\\
# ▌▐█▌  ▐█▌          ▐█▌        ▐█▌ ▐█▌    ▐█▌ ▌                                ▌\\
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌                                ▌\\
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  created by $OWNER_NAME_       ▌\\
# ▌     ▐█▌    ████████▌  ████████▌        ▐█▌ ▌  $OWNER__EMAIL_____________    ▌\\
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  |  $CREATED_DATE_TIME_  |     ▌\\
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌                                ▌\\
# ▌     ▐█▌          ▐█▌        ▐█▌        ▐█▌ ▌  updated by $OWNER_NAME_       ▌\\
# ▌  ████████▌ ████████▌  ████████▌        ▐█▌ ▌  |  $UPDATED_DATE_TIME_  |     ▌\\
# ▌                                                                             ▌\\
# ██████████████████████████████████████████████████████████████████████████████▌\\
"
sed "1i $HEADER" $0 > temp && mv temp $0
