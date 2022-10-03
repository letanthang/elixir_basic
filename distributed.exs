pid =
  Node.spawn_link(:"foo@computer-name", fn ->
    receive do
      {:ping, client} -> send(client, :pong)
    end
  end)

send(pid, {:ping, self()})

flush()
