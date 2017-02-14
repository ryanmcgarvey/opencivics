defmodule Opencivics.TestHelpers do
  use Wallaby.DSL

  def provides(session, string) do
    session |> find("[provides='#{string}']")
  end
end
