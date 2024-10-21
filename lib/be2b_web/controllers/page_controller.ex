defmodule Be2bWeb.PageController do
  use Be2bWeb, :controller

  plug Be2bWeb.Plugs.Locale, "en" when action in [:index]

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end
end
