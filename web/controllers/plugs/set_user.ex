defmodule Discuss.Plugs.SetUser do
  import Plug.Conn
  import Phoenix.Controller

  alias Discuss.Repo
  alias Discuss.User

  def init(_params) do

  end

  def call(conn, _params) do
    user_id = get_session(conn, :user_id)

    cond do
      # if user_id exists and Repo.get success, assign user to conn object.
      user = user_id && Repo.get(User, user_id) ->
        assign(conn, :user, user)

      # if user_id is not exist or anything failed, assign nil to conn object.
      true -> assign(conn, :user, nil)
    end
  end
end