#!/bin/bash
rm public/stylesheets/application.css;
lessc -x less/main.less > public/stylesheets/application.css;

