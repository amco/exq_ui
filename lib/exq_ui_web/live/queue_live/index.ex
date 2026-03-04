defmodule ExqUIWeb.QueueLive.Index do
  @moduledoc false
  use ExqUIWeb, :live_view
  alias ExqUI.Queue

  @impl true
  def mount(_params, session, socket) do
    case Map.get(session, "config") do
      nil ->
        {:ok, push_redirect(socket, to: "/")}
      config ->
        {:ok,
         assign(socket, :queues, Queue.list_queues(config))
         |> assign(:config, config)}
    end
  end

  @impl true
  def handle_event("delete", %{"name" => name}, socket) do
    config = socket.assigns.config
    :ok = Queue.remove_queue(config, name)
    {:noreply, assign(socket, :queues, Queue.list_queues(config))}
  end
end
