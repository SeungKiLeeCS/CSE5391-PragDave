defmodule ChatServer do

  @moduledoc """
  This code implements a simple console-based chat server. Any number of
  clients connect to it, and their users enter messages which are sends
  to this server. Each message received is then broadcast to every other
  conected client.
  Your mission is to write the client code.
  ### Overall Structure of the Client
  Your client will need to be doing two things at once:
  1. Waiting for you to type messages for it to send to this server.
     In this descxription we'll call this the _sender_ process.
  2. Waiting for messages from the server to display to you. This is
     thew _receiver_ process.
  You'll therefore need to run two processes. One of these can be the
  default process your code starts in, and the other will be a process
  you create.
  When you communicate with the server, part of the message you sent it
  will be the pid of your _receiver_ process.
  ### Running Your Code
  I will give you the node name of this server. It'll be something like
      :"server@10.a.b.c"
  You'll start your client code in iex using:
      iex --cookie monster --name your_last_name@10.x.y.z' client.exs
  where `10.x.y.z` is the IP address of your machine (use ifconfig to
  find it)
  where
  ### Testing connection to this server.
  Inside iex, try
      iex>  Node.connect(:"server@192.168.x.y")
      iex>  Node.list
  Registering with the server:
      iex> server = { ChatServer, :"server@192.168.x.y" }
      iex> send(server, { self(), :connect, "your name" }
      (you should see a message on my screen)
  Sending a message
      iex> send server, { self(), :say, "some message" }
      (you should see the message displayed)
  Receiving a message
      Ask me to send you a message, then type
      iex>  flush
  ### Time to code
  Wrap all that in some code. You'll need to create a receiver process.
  That's the process whose ID you'll pass to the server in the :connect
  and :say messages.
  You'll then loop in the original process, prompting for input (use
  `IO.gets`)
  When you get a message, use
      send(server, { receiver_pid, :say, message }
  to broadcast it to everyone else
  In the receiver process, loop waiting for messages of the form
      { :msg, message }
  and use `IO.puts` to write the message to the console.
  """

  @me __MODULE__    # The name we register for clients to connect to'


  def start do
    Process.register(self(), @me)
    IO.puts "Server running. Connect to { #{@me}, :#{node()} }\n"
    message_loop(%{ clients: %{} })
  end

  def message_loop(state) do
    state = receive do
      msg -> handle(msg, state)
    end
    message_loop(state)
  end


  defp handle({ from, :connect, name }, state) do
    Process.monitor(from)
    state
    |> add_new_client(from, name)
    |> announce(from, "joined the chat")
  end

  defp handle({ from, :disconnect }, state) do
    state
    |> announce(from, "left the chat")
    |> remove_client(from)
  end

  defp handle({ from, :say, message }, state) do
    state
    |> announce(from, message)
  end

  # These next two are messages send because we are monitoring the
  # client
  defp handle({:DOWN, _ref, :process, _pid, :normal}, state) do
    state
  end

  defp handle({ :DOWN, _ref, :process, pid, reason }, state) do
    state
    |> announce(pid, "unwillingly left the chat: #{inspect reason}")
    |> remove_client(pid)
  end

  # report any other messages we receive

  defp handle(other, state) do
    IO.puts "\n---------------- unknown message ignored --------------------"
    IO.inspect other
    maybe_show_node(other)
    IO.puts "-------------------------------------------------------------\n"
    state
  end

  defp maybe_show_node(other) when is_tuple(other) do
    other
    |> elem(0)
    |> node()
    |> (&"(received from #{&1})").()
    |> IO.puts
  end

  defp maybe_show_node(_) do
    nil
  end


  # helpers

  def add_new_client(state, from, name) do
    put_in state, [:clients, from], name
  end

  def remove_client(state, from) do
    update_in(state.clients, &(Map.drop(&1, [from])))
  end

  def announce(state, from, message) do
    announce_with_name(state, from, state.clients[from], message)
  end

  def announce_with_name(state, from, nil, _message) do
    IO.puts "Ignoring message from #{inspect from}"
    state
  end

  def announce_with_name(state, from, name, message) do
    msg = "#{name}: #{message}"
    IO.puts msg

    state.clients
    |> Enum.reject(fn {pid, _name} -> pid == from           end)
    |> Enum.each(  fn {pid, _name} -> send pid, {:msg, msg} end)
    state
  end

end


ChatServer.start
