defmodule Storage.Widgets do
  alias Storage.{Repo, Widgets.Widget}

  def all do
    Repo.all(Widget)
  end
end
