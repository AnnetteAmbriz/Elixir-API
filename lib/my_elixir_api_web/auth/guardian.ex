defmodule MyElixirApi.MixProject.Auth.Guardian do
  use Guardian, otp_app: :my_elixir_api
  # gives access to the Accounts context file
  alias MyElixirApi.Accounts


  # pass id from json. convert id to string
  def subject_for_token(%{id: id}, _claims) do
    sub = to_string(id)
    {:ok, sub}
  end

  # return error if no id is provided
  def subject_for_token(_,_) do
    {:error, :no_id_provided}
  end

  # use id from token subject to call get_account and return resource (Account) if found.
  def resource_from_claims(%{"sub" => id}) do
    case Accounts.get_account!(id) do
      nil -> {:error, :not_found}
      resource -> {:ok, resource}
    end
  end

  # return error if no id provided
  def resource_from_claims(_claims) do
    {:error, :no_id_provided}
  end
end