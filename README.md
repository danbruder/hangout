# 👯 Hangout

A simple example of Phoenix presence. It includes a real time chat and user list.

![screenshot](https://github.com/danbruder/hangout/raw/master/img/screenshot.png)

## Installation

```
git clone https://github.com/danbruder/hangout
cd hangout
mix deps.get
mix ecto.create
mix ecto.migrate
```

## Run

```
mix phx.server
```

Or if you have `nanobox` setup

```
nanobox run mix phx.server
```

