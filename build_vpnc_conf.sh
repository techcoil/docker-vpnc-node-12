#!/usr/bin/env bash

config=/etc/vpnc/default.conf

function build_conf() {
	if [ ! -f "$1" ]; then
		echo "$1 is not a valid file"
		exit 1;
	fi

	source="$1"

	lines=$(cat $source)

	while IFS= read -r line; do
		value=""
		var=$(echo $line | perl -pe 's/^[^<]+(<(.*)>)?$/\U$2/g' | tr '-' '_')
		if [ ! -z "$var" ]; then
			value=`printenv "VPNC_${var}"`
			if [ ! -z "$value" ]; then
				echo -n $line | perl -pe 's/^#?(.*)<.+>$/$1/'
				echo $value
			fi
		fi

		[ -z "$value" ] && echo "$line"
	done <<< "$lines"
}

build_conf $config
