defmodule JustpushitApi.ChannelView do
  use JustpushitApi.Web, :view

  def render("index.json", %{channels: channels}) do
    %{channels: render_many(channels, JustpushitApi.ChannelView, "channel.json")}
  end

  def render("show.json", %{channel: channel}) do
    %{channel: render_one(channel, JustpushitApi.ChannelView, "channel.json")}
  end

  def render("channel.json", %{channel: channel}) do
    %{id: channel.id,
      name: channel.name,
      inserted_at: channel.inserted_at,
      updated_at: channel.updated_at}
  end

  def render("channel.json", %{}) do
    %{}
  end

end
