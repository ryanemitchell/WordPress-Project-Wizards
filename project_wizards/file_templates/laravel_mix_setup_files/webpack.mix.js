let mix = require('laravel-mix');

// Script and styles
mix.sass('resources/assets/styles/[pluginSlug]-styles.scss', 'dist/css/[pluginSlug]-styles.css')
mix.js('resources/assets/scripts/[pluginSlug]-scripts.js', 'dist/js/[pluginSlug]-scripts.js');
