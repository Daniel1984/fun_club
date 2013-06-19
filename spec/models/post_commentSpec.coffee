describe 'Post comment  model', ->
  
  beforeEach ->
    @postComment = require "#{process.cwd()}/app/models/post_comment"

  it 'should not save empty comment', (done) ->
    #  @postComment.create {}, (post, err) ->
      #      expect(post).toEqual(null)
      done()

  it 'should not save post with invalid email', (done) ->
    done()
