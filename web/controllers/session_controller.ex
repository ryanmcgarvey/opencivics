defmodule Opencivics.SessionController do
  use Opencivics.Web, :controller

  alias Opencivics.User
  alias Opencivics.UserQuery

  # plug :scrub_params, "user" when action in [:create]
  plug :action


  def new(conn, _) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => %{"email" => user, "password" => pass}}) do
    case Opencivics.Auth.login_by_email_and_pass(conn, user, pass, repo: Repo) do
      {:ok, conn} ->
        logged_in_user = Guardian.Plug.current_resource(conn)

        conn
        |> put_flash(:info, "Logged In")
        |> redirect(to: contact_path(conn, :index))

      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Wrong username/password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> Guardian.Plug.sign_out
    |> redirect(to: "/")
  end
end
