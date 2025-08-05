#!/bin/sh

HERE=`dirname $0`
cd "${HERE}"

if [ ! -d gosh_blst ]; then
    trap '[ -h gosh_blst ] && rm -f gosh_blst' 0 2
    ln -s ../.. gosh_blst
fi

# --allow-dirty because the temporary blst symbolic link is not committed
cargo +stable publish --allow-dirty "$@"
