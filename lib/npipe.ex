defmodule NPIPE do
  use Application
  require Logger

  @moduledoc """
  Documentation for `NPIPE`.
  """

  @doc """
  Hello world.

  ## Examples

  iex> NPIPE.hello()
  :world

  """
  def hello do
    :world
  end

  def start(_type, _args) do
    Logger.info "Starting npipe"
    port = String.to_integer(System.get_env("PORT") || "4040")

    children = [
      {Task.Supervisor, name: CreatePipe.TaskSupervisor},
      Supervisor.child_spec({Task, fn -> CreatePipe.accept(port) end}, restart: :permanent)
    ]

    opts = [strategy: :one_for_one, name: CreatePipe.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
