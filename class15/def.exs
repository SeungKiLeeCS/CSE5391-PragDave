
# mix phx.gen.html <context> <module> <db> schema

# dep
# {:earmark, ">= 0.0.0."} -> for md support

# templates -> note -> show.html
# -> <%= markdown_to_html(@note.body) %>

# View Directory
# Addsupport code in note_view.ex

# ! returns just the str

# def markdown_to_html(markdown) do
#   markdown
#   |> Earmark.as_html!()
#   |> raw()
# end
