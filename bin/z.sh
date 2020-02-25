ZLUA_SCRIPT="/Users/eggcaker/.dotfiles/bin/z.lua"
ZLUA_LUAEXE="/usr/local/Cellar/lua/5.3.5_1/bin/lua"

_zlua() {
	local arg_mode=""
	local arg_type=""
	local arg_subdir=""
	local arg_loop="1"
	local arg_inter=""
	local arg_strip=""
	if [ "$1" = "--add" ]; then
		shift
		_ZL_RANDOM="$RANDOM" "$ZLUA_LUAEXE" "$ZLUA_SCRIPT" --add "$@"
		return
	elif [ "$1" = "--complete" ]; then
		shift
		"$ZLUA_LUAEXE" "$ZLUA_SCRIPT" --complete "$@"
		return
	fi
	while [ "$1" ]; do
		case "$1" in
		-l) local arg_mode="-l" ;;
		-e) local arg_mode="-e" ;;
		-x) local arg_mode="-x" ;;
		-t) local arg_type="-t" ;;
		-r) local arg_type="-r" ;;
		-c) local arg_subdir="-c" ;;
		-s) local arg_strip="-s" ;;
		-i) local arg_inter="-i" ;;
		-h | --help) local arg_mode="-h" ;;
		*) break ;;
		esac
		shift
	done
	if [ "$arg_mode" = "-h" ]; then
		"$ZLUA_LUAEXE" "$ZLUA_SCRIPT" -h
	elif [ "$arg_mode" = "-l" ] || [ "$#" -eq 0 ]; then
		"$ZLUA_LUAEXE" "$ZLUA_SCRIPT" -l $arg_subdir $arg_type $arg_strip "$@"
	elif [ -n "$arg_mode" ]; then
		"$ZLUA_LUAEXE" "$ZLUA_SCRIPT" $arg_mode $arg_subdir $arg_type $arg_inter "$@"
	else
		local dest=$("$ZLUA_LUAEXE" "$ZLUA_SCRIPT" --cd $arg_type $arg_subdir $arg_inter "$@")
		if [ -n "$dest" ] && [ -d "$dest" ]; then
			if [ -z "$_ZL_CD" ]; then
				builtin cd "$dest"
			else
				$_ZL_CD "$dest"
			fi
			if [ -n "$_ZL_ECHO" ]; then
				pwd
			fi
		fi
	fi
}
# alias ${_ZL_CMD:-z}='_zlua 2>&1'
alias ${_ZL_CMD:-z}='_zlua'

case "$PROMPT_COMMAND" in
*_zlua?--add*) ;;
*) PROMPT_COMMAND="(_zlua --add \"\$(command pwd 2>/dev/null)\" &);$PROMPT_COMMAND" ;;
esac

if [ -n "$BASH_VERSION" ]; then
	complete -o filenames -C '_zlua --complete "$COMP_LINE"' ${_ZL_CMD:-z}
fi
