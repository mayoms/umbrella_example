defmodule Storage.Widgets.Widget do
  use Ecto.Schema

  @derive {Jason.Encoder, except: [:__meta__]}

  schema "widgets" do
    field(:name, :string)
    field(:type, :string)
  end
end
