#!/bin/bash

first_api="https://plugin.hideallvpn.org"
user_agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/103.0.5060.114 Safari/537.36"

function create_user() {
	curl --request POST \
		--url "$first_api/misc/proxylistfree/action" \
		--user-agent "$user_agent" \
		--header "content-type: application/x-www-form-urlencoded" \
		--data "cmd=create&source=chrome"
}

function get_password() {
	# 1 - username: (string): <username>
	curl --request POST \
		--url "$first_api/misc/proxylistfree/action" \
		--user-agent "$user_agent" \
		--header "content-type: application/x-www-form-urlencoded" \
		--data "cmd=recover&user=$1&source=chrome"
}

function login() {
	# 1 - username: (string): <username>
	# 2 - password: (string): <password>
	curl --request POST \
		--url "$first_api/misc/proxylistfree/action" \
		--user-agent "$user_agent" \
		--header "content-type: application/x-www-form-urlencoded" \
		--data "cmd=login&user=$1&pass=$2&md5=&source=chrome"
}
