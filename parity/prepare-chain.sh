#!/bin/bash

if [ "$PARITY" = "" ]; then
	PARITY=`which parity`
	if [ "$PARITY" = "" ]; then
        PARITY=/opt/parity/parity
    fi
fi

if [ ! -x "${PARITY}" ]; then
	echo No executable for Parity client found.
	exit 1
fi

pass="C1@55ic"
if [ "$1" == "" ]; then
	echo No password provided. Default password \"C1@55ic\" will be used.
	echo 
else
	pass=$1
fi

CONFIG=simple_poa.toml
GENESIS=simple_poa.json

echo ${pass} > tmp.pwd

account=`${PARITY} account new --config ${CONFIG} 2>/dev/null | tail -1`

echo "New block issuer: ${account}"

sed -i "s/0xcafecafecafecafecafecafecafecafecafecafe/${account}/g" ${CONFIG}
sed -i "s/0xcafecafecafecafecafecafecafecafecafecafe/${account}/g" ${GENESIS}

echo
echo Modify ${GENESIS} to extend the list of prefunded accounts.
echo Then run the node with the command \"${PARITY} --config ${CONFIG}\".
