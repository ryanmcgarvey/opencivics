defmodule Opencivics.AttendenceTest do
  use Opencivics.AcceptanceCase, async: true

  setup %{session: session} do
    contact = insert(:contact)

    session
    |> visit("/contacts")

    {:ok, contact: contact}
  end

  defp contact_rows(session) do
    session
    |> provides("contact_list")
    |> all("tr")
  end

  defp contact_on_list(items, contact) do
    items 
    |> List.last
    |> text
    |> String.contains?(contact.email)
  end

  test "listing contacts", %{session: session, contact: contact} do
    items = contact_rows(session)
    assert length(items) == 1
    assert contact_on_list(items, contact)
  end

  test "new contacts", %{session: session} do
    use Wallaby.DSL
    new_contact = build(:contact)

    provides(session, "new_contact_button")
    |> click

    form = find(session, "form")

    form
    |> fill_in("contact_first_name", with: new_contact.first_name)
    |> fill_in("contact_last_name", with: new_contact.last_name)
    |> fill_in("contact_email", with: new_contact.email)
    |> provides("save_contact_button")
    |> click

    session
    |> provides("back_to_contacts")
    |> click



    items = contact_rows(session)
    assert length(items) == 2
    assert contact_on_list(items, new_contact)
  end

end
