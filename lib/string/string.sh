if ndef __STRING_SH; then
define  __STRING_SH

## @file string.sh
## @brief Functions for string manipulations.

## @fn separateChars (string)
separateChars() {
	local i l=${#1}
	for ((i=0; i<l; i++)); do
		echo -n "${1:$i:1} "
	done
	echo
}

## @fn void getLineString (string)
## @brief Output the B<TEXT> field of a string like LINE:TEXT
## @param $1 String like LINE:TEXT
getLineString() {
	echo "${1#*:}"
}
## @fn void getLineNumber (string)
## @brief Output the B<LINE> field of a string like LINE:TEXT
## @param $1 String like LINE:TEXT
getLineNumber() {
	echo "${1%%:*}"
}

## @fn void reverseString (string)
## @brief Output a string in reverse
## @param $1 String to reverse
reverseString() {
	local i l=${#1}
	for ((i=$((l-1)); i>=0; i--)); do
		echo -n "${1:$i:1}"
	done
	echo
}

fi # __STRING_SH
