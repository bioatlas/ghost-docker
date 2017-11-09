# ghost-docker

This is a composition of services that provides a front-end web portal centered around https://ghost.org.

Using this composition, you can switch between a set of themes for the `ghost` portal and also use it as a test-bed for developing custom themes.

## Usage

To make a backup of existing content in a running `ghost` instance, use `cd content && zip -r ../content.zip .` from the `ghost` base directory.

Put your "star-certificate" cert files (these can be self-signed certs) in the certs directory, migrate existing content into `ghost/content` with `make content`, then download themes with `make theme-dl` and finally issue `make up`.

## Links

Docs for how to use static content:

https://www.ghostforbeginners.com/have-a-static-home-page-with-ghost/

There is also docs for how to create a sidebar:

https://www.ghostforbeginners.com/add-a-fixed-sidebar-to-your-ghost-blog/
