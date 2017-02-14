Application.put_env(:wallaby, :base_url, Opencivics.Endpoint.url)
{:ok, _} = Application.ensure_all_started(:ex_machina)
{:ok, _} = Application.ensure_all_started(:wallaby)
ExUnit.start
Ecto.Adapters.SQL.Sandbox.mode(Opencivics.Repo, :manual)

