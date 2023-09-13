defmodule MyElixirApi.Repo do
  use Ecto.Repo,
    otp_app: :my_elixir_api,
    adapter: Ecto.Adapters.Postgres
end
