require 'rails_helper'
​
RSpec.describe 'Users', type: :system, js: true do
  before(:all) do
    @albert = User.create(name: 'Albert Einstein', photo: 'https://picsum.photos/200/300',
                          bio: 'Imagination is more important than knowledge. - AE')
    @cristiano = User.create(name: 'Cristiano Ronaldo', photo: '/assets/default_user.png',
                             bio: 'I am ubleivable inside the pitch.')
​
    @post1 = Post.create(title: 'The Theory of Relativity', text: 'E=mc² changed the world.', author: @albert)
    @post2 = Post.create(title: 'The Power of Imagination', text: 'Exploring the universe within our minds.',
                         author: @albert)
    @post3 = Post.create(title: 'I will never give up', text: 'I will never give up. I will never surrender.',
                         author: @albert)
    @post4 = Post.create(title: 'No one can beat me', text: 'No one can beat me. I am the best.', author: @albert)
    @post5 = Post.create(title: 'Like it or not', text: 'Like it or not, I am the best.', author: @albert)
  end
​
  describe 'show page' do
    before(:example) do
      visit user_path(@albert)
    end
​
    it 'shows the user profile information' do
      expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
      expect(page).to have_content(@albert.name)
      expect(page).to have_content(@albert.bio)
​
      @albert.most_recent_three_posts.each do |post|
        expect(page).to have_content(post.title.capitalize)
        expect(page).to have_content(post.text)
      end
​
      expect(page).to have_link('See all posts', href: user_posts_path(@albert))
    end
​
    it 'redirects to post show page when clicking on a post title' do
      click_link @post5.title.capitalize
      expect(page).to have_current_path(user_post_path(@albert, @post5))
    end
​
    it 'redirects to user posts index page when clicking on view all posts button' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(@albert))
    end
  end
end