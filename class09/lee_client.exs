# send {ip, name}
# Type message, and return -> send the message {ip, :say, msg}
# receive {:msg, msg}

# wait for console input && wait for msg from server
# possibly a process that spawns other process
# have console input in main process, and server connection be done in other



# _continue = true

defmodule ChatClient do

  def run(:send) do
    # Connect to the server
    Node.connect :"chat@54.174.114.99"
    # Register
    send {:ChatServer, :"chat@54.174.114.99"}, {self(), :connect, "MonsterPeach"}
    # run
    send_msg()
  end

  def send_msg() do
    IO.puts "You"
    # once an enter is hit
    msg = IO.gets "\n"
    # ip, :say, msg
    send {:ChatServer, :"chat@54.174.114.99"}, {self(), :say, msg}
    # tail recursion to stay on server
    send_msg()
  end

  def run(:receive) do
    # Connect to the server
    Node.connect :"chat@54.174.114.99"
    # Actually let's write a function for it.
    receive_msg()
  end

  def receive_msg() do
    receive do
      {:msg, msg} ->
        IO.puts msg
    end
  end

end


