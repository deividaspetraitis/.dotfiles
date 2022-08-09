
# Cache GPG password.
# Usage: gpg_cache ID
# Possible alternatives so we no need to request 1password each time is to check does cache exists and extract value:
# gpg-connect-agent 'keyinfo <keygrip>' /bye | awk '{print $7}
gpg_cache () {
	ITEM_ID=$1

	if [ -z "$ITEM_ID" ]; then
		echo "no GPG ID given."
		return
	fi

	ITEM=$(op item get "$ITEM_ID" --format json)

	ID=$(echo "$ITEM" | /opt/homebrew/bin/jq -r '.fields | .[] | select(.purpose=="USERNAME") | .value')
	PASSWORD=$(echo "$ITEM" | /opt/homebrew/bin/jq -r '.fields | .[] | select(.purpose=="PASSWORD") | .value')

	if [ -z "$ID" ]; then
		echo "no GPG item found based on provided ID."
		return
	fi

	gpg-connect-agent /bye &> /dev/null

	echo "$PASSWORD" | "$(gpgconf --list-dirs libexecdir)"/gpg-preset-passphrase --preset "$ID"
}
