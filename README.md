# Church Goals API

[![CircleCI](https://circleci.com/gh/ChurchGoals/ChurchGoals-API.svg?style=svg&circle-token=7292c8dea69e10a92d3f5029890659f82291bf50)](https://circleci.com/gh/ChurchGoals/ChurchGoals-API)

## Installing elixir language
https://elixircasts.io/installing-elixir-with-asdf

Install peer dependencies of erlang.
```
brew install coreutils automake autoconf openssl libyaml libtool wxmac
```

[Install ASDF package management tool](https://asdf-vm.com/#/core-manage-asdf-vm)
```
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.5
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo -e '\n. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

[Install erlang with ASDF](https://github.com/asdf-vm/asdf-erlang)
```
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
ERLANG_OPENSSL_PATH="/usr/local/opt/openssl" asdf install erlang 22.1.4
asdf global erlang 22.1.4
```

[Install elixir]()
```
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf install elixir 1.9.1-otp-22
asdf global elixir 1.9.1-otp-22
```

## Install and run
To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Copy sample config files with `scripts/setup.sh` then change your config settings for your environment.
  * Create and migrate your database with `MIX_ENV=test mix ecto.setup`
  * Start Phoenix endpoint with `iex -S mix phx.server`

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more about the phoenix framework

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix

## Generate docs

Docs are generated off of function/module docs.

```
mix docs
open doc/index.html
```
