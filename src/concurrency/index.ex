defmodule Concurrency do
  def long_running_fn(query) do
    Process.sleep(1000)
    "result of #{query}"
  end

  def async(query) do
    spawn(fn -> IO.puts(long_running_fn(query)) end)
  end

  def multiple_async() do
    Enum.each(1..5, &async/1)
  end
end
