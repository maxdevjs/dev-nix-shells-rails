# nix-shell for Rails

> WIP

Note:

> must be checked and tested because of some `gems` issues.

## What is it?

A [nix-shell](https://nixos.org/manual/nix/stable/#description-13) template to set a [Ruby on Rails](https://rubyonrails.org/) development environment up with [direnv](https://github.com/direnv/direnv) integration (if installed).

Built gathering inspiration from several [sources](#resources), it makes available:

- [Ruby](https://www.ruby-lang.org/en/)
- [solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph) ([LSP](https://microsoft.github.io/language-server-protocol/))
- environment opinions:
  - several environment variables are set
  - `Gemfile` is created (for [solargraph](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#solargraph) to launch)
  - `gems` are installed locally (in project folder)
  - ...
- [PostgreSQL](https://www.postgresql.org/) setup
  - check the relevant [Phoenix shell](../phoenix/README.md#working-with-a-local-postgresql-instance) section
    - TODO: complete [PostgreSQL](https://www.postgresql.org/) section here

## Resources

### Direnv

- [direnv wiki page about Nix](https://github.com/direnv/direnv/wiki/Nix)
- [Automating development environment set-up with Direnv](http://www.futurile.net/2016/02/03/automating-environment-setup-with-direnv/)
- [More prac­ti­cal direnv](https://rnorth.org/more-practical-direnv/)
  - [rnorth/.direnvrc](https://gist.github.com/rnorth/0fd5048da85957da39c17bd49c4ca922)

### Miscellaneous

- [Packaging/Ruby](https://nixos.wiki/wiki/Packaging/Ruby)
- [Ruby {#sec-language-ruby}](https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/ruby.section.md)
- [Ruby on Whales: Dockerizing Ruby and Rails development](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)
- [The Rails Command Line](https://guides.rubyonrails.org/command_line.html)

### Nix

- [A simple Ruby development environment using nix-shell](https://jamesmead.org/blog/2020-07-26-a-simple-ruby-development-environment-using-nix-shell)
- [Development environment with nix-shell](https://nixos.wiki/wiki/Development_environment_with_nix-shell)
- [Multiple Rails development environments using nix-shell](https://jamesmead.org/blog/2020-11-29-multiple-rails-development-environments-using-nix-shell)
- [Rails on Nix](https://actually.fyi/posts/rails-on-nix/)
- [Using Nix in Elixir projects](https://ejpcmac.net/blog/using-nix-in-elixir-projects/)

## TODO

- must be checked and tested because of some `gems` issues

- [lorri](https://github.com/nix-community/lorri) integration
- [nichecked and tested because of some `gems` issuesv](https://github.com/joefiorini/niv)
- ...
