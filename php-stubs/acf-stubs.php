<?php

function get_field(string $selector, $post_id = null, bool $format_value = true): string|array|object {}

function get_sub_field(string $selector, bool $format_value = true): string|array|object {}

function acf_add_options_page(array $settings) {}

function get_fields($post_id = null, bool $format_value = null): array|false {}

function acf_add_local_field_group(array $field_group) {}

function have_rows(string $selector, int $post_id = false): bool {}

function the_row() {}
