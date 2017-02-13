defmodule Opencivics.Factory do
  # with Ecto
  use ExMachina.Ecto, repo: Opencivics.Repo

  alias Opencivics.Contact

  def contact_factory do
    %Contact{
      first_name: "Jane",
      last_name: "Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
    }
  end

end
