let mix = require('laravel-mix');


//Page Template scripts
mix.sass('page-templates/src/basic-template/basic-template.scss', 'page-templates/dist/css/basic-template.css')
mix.js('page-templates/src/basic-template/basic-template.js', 'page-templates/dist/js/basic-template.js');


