defmodule JustpushitApi.Channel do
  use JustpushitApi.Web, :model

  schema "channels" do
    field :name, :string
    field :slug, :string
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
    |> generate_slug(params[:name])
  end

  # will generate a slug from the name
  # before insert / update the database
  def generate_slug(struct, name) do
    slug = Slugger.slugify_downcase(name)
    put_change(struct, :slug, slug)
  end

end
