defmodule OA do

  # API (run in the caller's process)

  def new() do
    spawn(__MODULE__,
          :handle_message,
          [
            %{ location_of: %{} }
          ])
  end

  def enter_building(oa, name) do
    send_and_get_response(oa, [ :enter_building, name ])
  end

  def who_is_where(oa) do
    send_and_get_response(oa, [ :who_is_where ])
  end


  # helpers (run in the caller's process)

  defp send_and_get_response(oa, params) do
    ref = make_ref()
    tuple = [ ref, self() | params ] |> List.to_tuple
    send(oa, tuple)
    get_response(ref)
  end

  defp get_response(ref) do
    receive do
      { ^ref, response } ->
        response
    end
  end

  # Implementation (separate process)

  def handle_message(state) do

    receive do

    { ref, requester, :enter_building, person } ->
      { state, response } = record_entry(state, person)
      send(requester, { ref, response })
      handle_message(state)

    { ref, requester, :who_is_where } ->
      send(requester, { ref, state.location_of })
      handle_message(state)

    end
  end

  defp record_entry(state, person) do
    current_place = state.location_of[person]
    maybe_enter(current_place, state, person)
  end

  defp maybe_enter(:in_building, state, person) do
    { state,  { :in_building_twice, person } }
  end

  defp maybe_enter(_, state, person) do
    state = put_in(state, [:location_of, person], :in_building)
    { state, { :ok, person } }
  end
end
