defmodule TaskRabbit.Task do
  @moduledoc """
  The functions in this module will be started when their supervisors are
  started, in this case when the application's top-level supervisor is started.
  """

  use Task, restart: :temporary

  def start_link(arg) do
    Task.start_link(__MODULE__, :run, [arg])
  end

  @doc """
  Started by the application's top-level supervisor, invoked by
  {TaskRabbit.Task [:supervised_boom]}
  """
  def run(:supervised_boom) do
    IO.puts("Calling supervised_boom")
    Process.exit(self(), :boom)
    IO.puts("Should never print this line.")
  end

  @doc """
  Started by the application's top-level supervisor, invoked by
  {TaskRabbit.Task [:supervised]}
  """
  def run(:supervised) do
    IO.puts("Calling supervised")
    "Look, ma!"
  end
end
