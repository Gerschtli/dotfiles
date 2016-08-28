if available php; then
    alias composer="bin/composer.phar --prefer-source"
    alias getcomposer='mkdir -p bin; curl -sS https://getcomposer.org/installer | php -- --install-dir=bin'
    alias ut='./bin/phpunit'
fi
