require 'rails_helper'

RSpec.describe 'Users', type: :system, js: true do
  before(:all) do
    @elon = User.create(name: 'Elon Musk', photo: 'https://picsum.photos/200/300',
                        bio: 'Innovation is my passion. CEO of Tesla and SpaceX.')
    @mark = User.create(name: 'Mark Zuckerberg', photo: '/assets/default_user.png',
                        bio: 'Connecting the world. CEO of Facebook (Meta).')

    @post1 = Post.create(title: 'The Future of Space Travel', text: 'Exploring new frontiers of space.',
                         author: @elon)
    @post2 = Post.create(title: 'Creating a Sustainable Future', text: 'Solving the world\'s energy problems.',
                         author: @elon)
    @post3 = Post.create(title: 'Building the Metaverse', text: 'A new era of digital interaction begins.',
                         author: @mark)
    @post4 = Post.create(title: 'Innovations in AI', text: 'Transforming industries with artificial intelligence.',
                         author: @mark)
    @post5 = Post.create(title: 'The Power of Connectivity', text: 'Bringing people closer than ever before.',
                         author: @mark)
  end

  describe 'index page' do
    before(:example) do
      visit users_path
    end

    it 'should render user information' do
      expect(page).to have_content(@elon.name)
      expect(page).to have_content(@mark.name)

      expect(page).to have_css("img[src*='https://picsum.photos/200/300']")
      expect(page).to have_css("img[src*='default_user.png']")

      expect(page).to have_content(@elon.postsCounter)
      expect(page).to have_content(@mark.postsCounter)
    end

    it 'should redirect to the user page when a username is clicked' do
      find('.user_card', text: @elon.name).click
      expect(page).to have_current_path(user_path(@elon))
    end
  end
end
