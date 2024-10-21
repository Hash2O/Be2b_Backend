defmodule Be2b.Repo do
  use Ecto.Repo,
    otp_app: :be2b,
    adapter: Ecto.Adapters.Postgres
end
