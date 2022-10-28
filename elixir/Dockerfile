FROM elixir:latest

RUN apt-get update && \
    apt-get install -y curl \ 
    postgresql-client \
    inotify-tools \
    nodejs && \
    curl -L https://npmjs.org/install.sh | sh && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

WORKDIR /app

CMD ["mix", "phx.server"]

