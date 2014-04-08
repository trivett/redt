require "spec_helper"

describe Post do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id)}
  it { should validate_numericality_of(:user_id).only_integer }
  it { should validate_uniqueness_of(:link_url) }





end
