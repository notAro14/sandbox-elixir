defmodule KeyValueStore do
  use GenServer

  def start do
    GenServer.start(__MODULE__, nil, name: __MODULE__)
  end

  def put(key, value) do
    GenServer.cast(__MODULE__, {:put, key, value})
  end

  def get(key) do
    GenServer.call(__MODULE__, {:get, key})
  end

  @impl GenServer
  def init(_) do
    {:ok, %{}}
  end

  @impl GenServer
  def handle_cast({:put, key, value}, previous) do
    {:noreply, Map.put(previous, key, value)}
  end

  @impl GenServer
  def handle_call({:get, key}, _, previous) do
    {:reply, Map.get(previous, key), previous}
  end
end
