defmodule Opencivics.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import Opencivics.Factory
      import Opencivics.Router.Helpers

      alias Opencivics.Repo

      # The default endpoint for testing
      @endpoint Opencivics.Endpoint

      hound_session()
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Opencivics.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Opencivics.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end

end
