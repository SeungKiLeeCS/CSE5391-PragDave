defmodule ChatClient do

  def new(node_name) do
    %{server_node: node_name}
  end

  def connect(state, my_name) do
    Node.connect :"chat@54.174.114.99"
    # Node.connect state.server_ip
    server = {ChatServer, :"chat@54.174.114.99"}
    send server, {self(), :connect, my_name}
  end

  def disconnect(state) do
    Node.disconnect(state)
  end

  def say(state, msg) do
    server = {ChatServer, :"chat@54.174.114.99"}
    send server, {self(), :say, msg}
  end

  def receive(state, msg) do
    receive do
      {^state, msg} ->
        IO.puts msg
    end
  end


end

defmodule ChatCli do

  def run(server_node, my_name) do
    Node.connect(server_node)
    ChatClient.new(server_node)      # returns initial state
    |> ChatClient.connect(my_name)   # connects to server, returns state
    |> console_loop()
  end

  def console_loop(nil) do
    IO.puts "Bye!"
  end

  def console_loop(client) do
    msg = IO.gets "You: "
    handle_input(client, msg) |> console_loop()
  end

  def handle_input(client, "quit\n") do
    ChatClient.disconnect(client)
    nil
  end

  def handle_input(client, msg) do
    ChatClient.say(client, msg)
  end
end
