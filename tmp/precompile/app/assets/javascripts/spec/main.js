describe("Test", function() {
  require(['views/join_event/index_view'], function(View) {
    return console.log(View);
  });
  return it("should return true", function() {
    return expect(2 + 2).toEqual(5);
  });
});
