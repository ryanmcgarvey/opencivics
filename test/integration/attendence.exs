defmodule Opencivics.AttendenceTest do
  use Opencivics.IntegrationCase

  setup do
    contact = insert(:contact, %{first_name: "ryan", last_name: "mcgarvey", email: "ryan@example.com"})

    navigate_to("/contacts")

    {:ok, contact: contact}
  end

  defp contact_rows do
    find_element(:tag, "tbody")
    |> find_all_within_element(:tag, "tr")
  end

  defp contact_on_list(list, contact) do
    list
    |> visible_text
    |> String.contains?(contact.email)
  end

  test "ensure contacts", %{contact: contact} do
    items = contact_rows
    assert length(items) == 1
    assert contact_on_list(items, contact)
  end

end
