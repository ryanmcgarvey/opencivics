defmodule Opencivics.AcceptanceCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Wallaby.DSL

      alias Opencivics.Repo
      import Ecto
      import Ecto.Changeset
      import Ecto.Query

      import Opencivics.Router.Helpers
      import Opencivics.Factory
      import Opencivics.TestHelpers
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Opencivics.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Opencivics.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Opencivics.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
