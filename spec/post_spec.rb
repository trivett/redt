require "spec_helper"

describe Post do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id)}
  it { should validate_numericality_of(:user_id).only_integer }
  it { should validate_uniqueness_of(:link_url) }

  subject(:post){Post.new({
    user_id: 1,
    link_url: "http://google.com",
    votes: 1
  })}

  describe "#upvote" do
    it "should increase by one after upvote" do
      post.upvote
      expect(post.votes).to eq(2)
    end
  end

  describe "#downvote" do
    it "should decrease by one after downvote" do
      post.downvote
      expect(post.votes).to eq(0)
    end
  end


end
