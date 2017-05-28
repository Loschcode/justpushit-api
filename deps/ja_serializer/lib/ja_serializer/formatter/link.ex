defimpl JaSerializer.Formatter, for: JaSerializer.Builder.Channel do
  alias JaSerializer.Formatter.Utils

  def format(link) do
    {Utils.format_key(link.type), link.href}
  end
end
