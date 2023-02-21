import Config

config :registration, Customer.Repo,
  database: "registration_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
