defmodule MyElixirApiWeb.DefaultController do
  use MyElixirApiWeb, :controller

  def index(conn, _params) do
    text conn, "Annette is not a pineapplehead -running in #{Mix.env()}"
  end

end
