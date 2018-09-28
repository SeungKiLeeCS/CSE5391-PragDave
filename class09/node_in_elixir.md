To make a node visible, you have to give it a name.

Knowing name & ip address allows you to look it up anywhere.

Step 1. find your ip address
-> ipconfig -> 10.8.117.16

Step2. get on iex
iex --name name@ip

Step3. Connect to Node (not working initially)
Node.connect :"wombat@10.8.126.91"

need to share cookie if you wanna communicate
-> cookie in elixir is ASCII string sent in clear text.

need to kill firewall

Never put a node on open port in public network

Step4. 

iex --name MonsterPeach@10.8.117.16 --cookie monster chat_client exs