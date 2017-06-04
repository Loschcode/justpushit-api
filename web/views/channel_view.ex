defmodule JustpushitApi.ChannelView do
  use JustpushitApi.Web, :view

  def render("index.json", %{channels: channels}) do
    %{data: render_many(channels, JustpushitApi.ChannelView, "channel.json")}
  end

  def render("show.json", %{channel: channel}) do
    %{data: render_one(channel, JustpushitApi.ChannelView, "channel.json")}
  end

  def render("channel.json", %{channel: channel}) do
    %{id: channel.id,
      name: channel.name}
  end
end
