defmodule Opencivics.Router do
  use Opencivics.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.EnsureAuthenticated, handler: Opencivics.Token
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end
  
  scope "/", Opencivics do
    pipe_through [:browser]

    delete "/sesisons", SessionController, :delete
    resources "/sessions", SessionController 
  end

  scope "/", Opencivics do
    pipe_through [:browser, :browser_auth]

    resources "/contacts", ContactController 
    get "/", ContactController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Opencivics do
  #   pipe_through :api
  # end
end
