require 'rails_helper'
​
RSpec.describe 'User posts', type: :system, js: true do
  before(:all) do
    @elon = User.create(name: 'Elon', photo: 'https://picsum.photos/200/300',
                        bio: 'Innovation is my passion. CEO of Tesla and SpaceX.')
​
    @mark = User.create(name: 'Mark', photo: '/assets/default_user.png',
                        bio: 'Connecting the world. CEO of Facebook (Meta).')
​
    @elon_post1 = Post.create(title: 'Revolutionizing Transportation', text: 'Electric cars are the future!',
                              author: @elon)
​
    @elon_post2 = Post.create(title: 'Mars Colonization', text: 'We will be a multi-planetary species.',
                              author: @elon)
​
    @mark_post1 = Post.create(title: 'The Future of Social Media', text: 'Connecting people globally.',
                              author: @mark)
​
    @mark_post2 = Post.create(title: 'Metaverse Vision', text: 'A new era of digital interaction.',
                              author: @mark)
​
    @comment1 = Comment.create(text: 'True visionary!', author: @mark, post: @mark_post1)
    @comment2 = Comment.create(text: 'You inspire us all, Mark!', author: @elon, post: @mark_post1)
    @comment3 = Comment.create(text: 'Can\'t wait for the next breakthrough!', author: @mark, post: @mark_post1)
    @comment4 = Comment.create(text: 'I\'m excited about the future of Facebook!', author: @elon, post: @mark_post1)
    @comment5 = Comment.create(text: 'You\'re changing the world, Mark!', author: @mark, post: @mark_post1)
    @comment6 = Comment.create(text: 'Keep pushing boundaries!', author: @elon, post: @mark_post1)
    @comment7 = Comment.create(text: 'We believe in your vision!', author: @mark, post: @mark_post1)
  end
​
  describe 'index page' do
    before(:example) do
      visit user_posts_path(@mark)
    end
​
    it 'should render posts author information' do
      expect(page).to have_css("img[src*='/assets/default_user.png']")
      expect(page).to have_content(@mark.name)
      expect(page).to have_content("Posts: #{@mark.postsCounter}")
    end
​
    it 'should render user posts information' do
      @mark.posts.each do |post|
        expect(page).to have_content(post.title.capitalize)
        expect(page).to have_content(post.text.truncate(100))
        expect(page).to_not have_content("Comments: #{post.comments_counter} | Likes: #{post.likes_counter}")
      end
​
      @mark_post1.most_recent_five_comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
​
    it 'should redirect to post show page when clicking on post title' do
      click_link @mark_post1.title.capitalize
      expect(page).to have_current_path(user_post_path(@mark, @mark_post1))
    end
  end
end