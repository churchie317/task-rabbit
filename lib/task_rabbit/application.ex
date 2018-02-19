defmodule TaskRabbit.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Supervisor.child_spec({TaskRabbit.Task, :supervised_boom}, id: BadTaskRabbit.Task),
      %{
        id: GoodTaskRabbit.Task,
        start: {TaskRabbit.Task, :start_link, [:supervised]},
        restart: :transient
      },
    ]

    opts = [strategy: :one_for_one, name: TaskRabbit.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
