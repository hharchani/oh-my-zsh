# Laravel5 basic command completion
_laravel5_get_command_list () {
	/home/harshit/.apps/bin/artisan --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_laravel5 () {
    compadd `_laravel5_get_command_list`
}

compdef _laravel5 artisan
