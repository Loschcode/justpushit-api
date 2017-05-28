defmodule JustpushitApi.Channel do
  use JustpushitApi.Web, :model
  use Ecto.Schema

  schema "channels" do
    field :name, :string
    timestamps()
  end

  # @required_fields ~w(name)
  # @optional_fields ~w()

  # def sort_by_publication(query) do
  # from link in query,
  #   order_by: [desc: link.published_at]
  # end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end
end
