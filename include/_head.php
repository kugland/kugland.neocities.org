<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <title>
            <?= htmlentities($GLOBALS['page_title'], ENT_HTML5, "UTF-8") ?>
            | André Kugland’s Home Page
        </title>
        <link rel="stylesheet" href="/css/style.css" />
        <script src="/js/contact.min.js" defer></script>
    </head>
    <body class="page-<?= implode(" ", $GLOBALS['body_classes']) ?>">
        <header>
            <nav>
                <ul>
                    <li><a href="/index.html">Home</a></li>
                    <li><a href="/about.html">About</a></li>
                    <li><a href="/contact.html">Contact</a></li>
                </ul>
            </nav>
        </header><?php
