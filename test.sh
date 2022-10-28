docker-compose build
docker-compose up -d tm-db
cd elixir/ 
docker-compose run --rm tm-phoenix mix deps.get --force
sleep 20
docker-compose run --rm tm-phoenix mix ecto.migrate
docker-compose up -d tm-phoenix
docker-compose down -d tm-phoenix
docker-compose run --rm tm-phoenix mix ecto.migrate
docker-compose up -d tm-phoenix
docker-compose up -d tm-node

