defmodule TaskRabbit.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      %{
        id: BadTaskRabbit.Task,
        start: {TaskRabbit.Task, :start_link, [:supervised_boom]}
      },
      %{
        id: GoodTaskRabbit.Task,
        start: {TaskRabbit.Task, :start_link, [:supervised]}
      },
    ]

    opts = [strategy: :one_for_one, name: TaskRabbit.Supervisor, restart: :temporary]
    Supervisor.start_link(children, opts)
  end
end
