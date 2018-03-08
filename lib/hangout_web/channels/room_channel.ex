defmodule HangoutWeb.RoomChannel do
  use HangoutWeb, :channel
  alias HangoutWeb.Presence

  def join("room:lobby", _, socket) do
    send(self(), :after_join)
    {:ok, socket}
  end

  def handle_info(:after_join, socket) do
    Presence.track(socket, socket.assigns.user, %{
      online_at: :os.system_time(:milli_seconds)
    })

    push(socket, "presence_state", Presence.list(socket))
    {:noreply, socket}
  end

  def handle_in("message:new", message, socket) do
    broadcast!(socket, "message:new", %{
      user: socket.assigns.user,
      body: message,
      timestamp: :os.system_time(:milli_seconds)
    })

    {:noreply, socket}
  end

  def handle_in("video_blob:new", data, socket) do
    IO.inspect data
    #broadcast!(socket, "video_blob:new", data)

    {:noreply, socket}
  end
end
