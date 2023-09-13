defmodule MyElixirApi.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "accounts" do
    field :email, :string
    field :hash_password, :string
    # allows creating a User object by passing in only the Account
    has_one :user, MyElixirApi.Users.User

    timestamps()
  end

  # called before object is created in the database. Useful function to validate input data before storing in DB.
  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :hash_password])
    |> validate_required([:email, :hash_password])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "Invalid email format. Must have @ sign and no spaces." )
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email, message: "That email is already taken. Use a unique email.")
  end
end
