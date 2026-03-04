defmodule ExqUIWeb.DashboardLive do
  @moduledoc false
  use ExqUIWeb, :live_view

  @impl true
  def mount(_params, session, socket) do
    case Map.get(session, "config") do
      nil ->
        {:ok, push_redirect(socket, to: "/")}
      config ->
        {:ok, assign(socket, %{config: config})}
    end
  end

  @impl true
  def handle_params(_, _, socket) do
    {:noreply, socket}
  end
end
