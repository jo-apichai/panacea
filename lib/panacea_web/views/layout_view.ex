defmodule PanaceaWeb.LayoutView do
  use PanaceaWeb, :view

  def callout_class(type) do
    case type do
      "info" -> "success"
      "error" -> "alert"
    end
  end
end
