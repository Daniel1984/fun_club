describe 'Post model', ->
  
  beforeEach ->
    @post = require "#{process.cwd()}/app/models/post"

  it 'should notvsave empty post', (done) -> 
    @post.create {}, (post, err) ->
      expect(post).toEqual(null)
      expect(err).not.toBe(null)
      done()

  it 'should not save post with invalid email', (done) ->
    @post.create {email: 'invalid'}, (post, err) ->
      expect(post).toEqual(null)
      expect(err).not.toBe(null)
      done()
