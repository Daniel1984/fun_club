describe "Test", ->
  require(['views/join_event/index_view'], (View) ->
    console.log View
  )
  it "should return true", ->
    expect(2 + 2).toEqual(5)
