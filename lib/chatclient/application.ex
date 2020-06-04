defmodule Chatclient.Application do
  @moduledoc false
  use Application

  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: Chatclient.TaskSupervisor}
    ]

    opts = [strategy: :one_for_one, name: Chatclient.Supervisor]
    Supervisor.start_link(children, opts)
    Nodes.start_link
  end
end

defmodule Nodes do
  use Agent
  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def contains(sender) do
    Agent.get(__MODULE__, & Enum.member?(&1, sender))
  end
  
  def increment(value) do
    Agent.update(__MODULE__, fn list -> [value|list] end)
  end

  def disconnect(sender) do
    Agent.update(__MODULE__, fn list -> List.delete(list, sender) end)
  end
end
