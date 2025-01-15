<?php
include __DIR__ . '/../include/common.php';
set_title('Contact');
emit_header(); ?>

<main lang="en">
    <p>
        Contact me through the following email address:
        <a href="mailto:" class="email-link">???????@gmail.com</a>.
        <noscript>(You’re seeing ???????@gmail.com because you have JavaScript disabled!)</noscript>
    </p>
    <p>
        If you want to encrypt your message, you can use my GPG key, which you can download by clicking <a href="/my-pub-key.asc">here</a>, or copy from the following box:
    </p>
    <?php
        $key = file_get_contents(__DIR__ . '/../static/my-pub-key.asc');
        echo '<pre>';
        echo htmlentities($key, ENT_HTML5, "UTF-8");
        echo '</pre>';
    ?>
</main>
<script src="/js/contact.min.js"></script>

<?php emit_footer(); ?>
