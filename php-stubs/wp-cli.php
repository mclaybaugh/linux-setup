<?php

class WP_CLI {
    public static function log(string $message) {}
    public static function error(string $message) {}
    public static function success(string $message) {}
    public static function add_command($name, $callable, $args = []) {}
}