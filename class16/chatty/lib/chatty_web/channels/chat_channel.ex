defmodule ChattyWeb.ChattyChannel do

  use Phoenix.Channel

  # name of channel, msg, socket
  def join("chatty:common", _message, socket) do
    { :ok, socket }
  end

  # msg coming in
  def handle_in("keypress", message, socket) do
    broadcast!(socket, "echo", message)
    # the reply will pick up the message while simple broadcast won't
    { :reply, { :ok, message}, socket }
  end

end
