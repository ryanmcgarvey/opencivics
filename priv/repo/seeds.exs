# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Opencivics.Repo.insert!(%Opencivics.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Opencivics.Repo
alias Opencivics.User

ryan = User.registration_changeset(%User{email: "mcgarvey.ryan@gmail.com", password: "fucktrump" })
emily = User.registration_changeset(%User{ email: "etboyd@gmail.com", password: "fucktrump" })
Repo.insert! ryan
Repo.insert! emily

