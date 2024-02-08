defmodule LivebookWeb.SessionLive.SnippetsListComponent do
  use LivebookWeb, :live_component

  import LivebookWeb.NotebookComponents

  alias Livebook.Notebook.Cell
  alias Livebook.Session

  @impl true
  def render(assigns) do
    ~H"""
    <div class="flex flex-col grow">
      <div class="flex justify-between items-center">
        <h3 class="uppercase text-sm font-semibold text-gray-500">
          Snippets
        </h3>
      </div>
      <span class="text-sm text-gray-500">Available only for SmartCells</span>
      <div class="mt-4">
        <span class="text-sm text-gray-500">
          <%= if @snippets == [] do %>
            You haven't saved any SmartCell as a snippet yet. Once you do, they'll appear here.
          <% else %>
            <%= for _snippet <- @snippets do %>
              <div class="flex flex-col bg-gray-100 rounded-lg p-2 my-4">
                <span class="flex items-baseline my-2">
                  <.cell_icon cell_type={:smart} language={:elixir} />
                  <p class="ml-1 text-sm text-gray-700 self-center">
                    <span class="font-semibold">My first snippet</span> - <span>Mapcell</span>
                  </p>
                </span>
                <div class="pt-2">
                  <button
                    class="button-base button-gray whitespace-nowrap py-1 px-2"
                    aria-label="restore"
                  >
                    <.remix_icon icon="arrow-go-back-line" class="align-middle mr-1 text-xs" />
                    <span class="font-normal text-xs">Reuse</span>
                  </button>
                  <button
                    class="button-base button-gray whitespace-nowrap py-1 px-2"
                    aria-label="copy source"
                  >
                    <.remix_icon icon="clipboard-line" class="align-middle mr-1 text-xs" />
                    <span class="font-normal text-xs">Edit</span>
                  </button>

                  <button
                    class="button-base button-gray whitespace-nowrap py-1 px-2"
                    aria-label="copy source"
                  >
                    <.remix_icon icon="delete-bin-6-line" class="align-middle mr-1 text-xs" />
                    <span class="font-normal text-xs">Delete</span>
                  </button>
                </div>
              </div>
            <% end %>
          <% end %>
        </span>
      </div>
    </div>
    """
  end
end
