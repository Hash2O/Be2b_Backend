defmodule Be2bWeb.ErrorJSONTest do
  use Be2bWeb.ConnCase, async: true

  test "renders 404" do
    assert Be2bWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert Be2bWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
