{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  inherit (lib) optional optionals;

  postgresql = unstable.postgresql_14;

  # libev = unstable.libev;
  #nio4r = unstable.rubyPackages.nio4r;
  rails = unstable.rubyPackages_3_0.rails;
  ruby = unstable.ruby_3_0;
  solargraph = unstable.rubyPackages.solargraph;
  
in

mkShell {
  buildInputs = [rails ruby solargraph];
    # Live Reloading. As we change our views or assets,
    # it automatically reloads the page in the browser
    ++ optional stdenv.isLinux libnotify # For ExUnit Notifier on Linux
    ++ optional stdenv.isLinux inotify-tools # For file_system on Linux
    ++ optional stdenv.isDarwin terminal-notifier # For ExUnit Notifier on macOS
    ++ optionals stdenv.isDarwin (with darwin.apple_sdk.frameworks; [
      # For file_system on macOS
      CoreFoundation
      CoreServices
    ]);

  shellHook = ''
    #alias c="iex -S mix"

    # https://ghedam.at/15443/a-nix-shell-for-developing-elixir
    # this allows gems to work in the local directory
    #mkdir -p .gems

    # https://github.com/neovim/nvim-lspconfig/issues/387#issuecomment-756660757
    # "For solargraph to launch, you have to trigger the root pattern,
    # which means your file has to be in a directory or subdirectory
    # of a file containing either .git or Gemfile"
    touch Gemfile

    # https://www.thoughtco.com/using-environment-variables-2908194
    # https://www.rubyguides.com/2019/01/ruby-environment-variables/
    # https://www.rubyguides.com/2018/09/ruby-gems-gemfiles-bundler/
    # Packaging a Gem as a Nix derivation https://www.youtube.com/watch?v=61RCi_5IgEY
    # https://manveru.dev/blog/Ruby%20-%20Nix.html
    #export GEM_HOME=$PWD/.gems
    #export GEM_PATH=$GEM_HOME
    #export RUBYOPT=$PWD
    #export RUBYPATH=$PWD
    #export RUBYLIB=$PWD
    #export PATH=$GEM_HOME/bin:$PATH

    # https://ejpcmac.net/blog/using-nix-in-elixir-projects/
    # Put the PostgreSQL databases in the project diretory.
    export PGDATA="$PWD/db"

    export LANG=en_US.UTF-8
  '';
}
