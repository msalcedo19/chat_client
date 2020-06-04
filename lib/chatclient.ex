defmodule Chatclient do

  def disconnect_nodes() do
    Enum.each(Node.list(), fn node -> 
      if !Nodes.contains(node), do: Task.async(fn -> Node.disconnect(node) end)
    end)
  end

  def receive_message(sender, message) do
    if Nodes.contains(sender) do
      IO.puts "<#{sender}>: #{message}"
      :ok
    else
      disconnect_nodes()
      "No Time"
    end
  end

  def receive_message(sender, :connect, duration) do
    Nodes.increment(sender)
    Task.async(fn -> :timer.sleep(duration); Nodes.disconnect(sender); Node.disconnect(sender)end)
    :ok
  end

  def send_message(recipient, message) do
    spawn_task(__MODULE__, :receive_message, recipient, [node(), message])
  end

  def send_message2(recipient, message, duration) do
    spawn_task(__MODULE__, :receive_message, recipient, [node(), message, duration])
  end

  def spawn_task(module, fun, recipient, args) do
    var = Node.ping(recipient)
    if var == :pong do
      try do
        recipient
          |> remote_supervisor()
          |> Task.Supervisor.async(module, fun, args)
          |> Task.await()
      catch
        _, _ -> "Impossible Connection"
      end
    else
      "Impossible Connection"
    end
  end

  defp remote_supervisor(recipient) do
    {Chatclient.TaskSupervisor, recipient}
  end


end
