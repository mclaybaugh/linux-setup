<?php

function get_field(string $selector, $post_id = null, bool $format_value = true): string|array|object {}

function the_field(string $selector, $post_id = null, bool $format_value = true) {}

function get_sub_field(string $selector, bool $format_value = true): string|array|object {}

function acf_add_options_page(array $settings = null) {}

function acf_add_options_sub_page(array $settings = null) {}

function get_fields($post_id = null, bool $format_value = null): array|false {}

function acf_add_local_field_group(array $field_group) {}

function have_rows(string $selector, int $post_id = false): bool {}

function the_row() {}

function add_row(string $selector, $values, $post_id = null) {}

function get_field_object(string $selector): array {}

function update_field(string $selector, $value, $post_id = null): bool {}

function update_sub_field(string $selector, $value, $post_id = null): bool {}
