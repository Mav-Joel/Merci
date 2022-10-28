docker-compose build
docker-compose up -d tm-db
shopt -s expand_aliases
alias mix="docker-compose run --rm tm-phoenix mix"
cd elixir/ 
mix deps.get --force
sleep 20
mix ecto.migrate
docker-compose up -d tm-phoenix
docker-compose down -d tm-phoenix
mix ecto.migrate
docker-compose up -d tm-phoenix
docker-compose up -d tm-node

