defmodule TaskRabbit do
  @moduledoc false

  @doc """
  Task.async links the calling process with the spawned child process. Executing
  this function will cause the calling process to exit.
  """
  def async_boom! do
    Task.async(fn -> Process.exit(self(), :boom) end)
    |> Task.await()
  end

  def async do
    Task.async(fn -> "Look, ma!" end)
    |> Task.await()
  end
end
