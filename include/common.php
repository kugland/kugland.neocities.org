<?php

$GLOBALS['body_classes'] = [];
$GLOBALS['page_title'] = '';

function set_title($title) {
    $GLOBALS['page_title'] = $title;
}

function add_body_class($class) {
    $GLOBALS['body_classes'][] = $class;
}

$script_class = $_SERVER['SCRIPT_NAME'];
$script_class = preg_replace('/\.php$/', '', $script_class);
$script_class = preg_replace('/.*content\//', '', $script_class);
$script_class = preg_replace('/\//', '-', $script_class);
add_body_class($script_class);

function emit_header() {
    include __DIR__ . '/_head.php';
}

function emit_footer() {
    include __DIR__ . '/_foot.php';
}
