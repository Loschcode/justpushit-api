# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JustpushitApi.Repo.insert!(%JustpushitApi.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

defmodule Fixtures do
  def channel do
    channel_params = %{
      name: FakerElixir.App.name
    }
    JustpushitApi.Repo.insert JustpushitApi.Channel.changeset(%JustpushitApi.Channel{}, channel_params)
  end

  def clear do
    JustpushitApi.Repo.delete_all JustpushitApi.Channel
  end
end

# Fixtures.clear
channels = Stream.repeatedly(fn -> Fixtures.channel end)
channels |> Enum.take(20)
