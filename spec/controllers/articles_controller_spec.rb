require 'spec_helper'

describe ArticlesController do
  describe "#index" do
    subject { response }
    let(:left_column) { double("left column") }
    let(:main_column) { double("main column") }
    let(:right_column) { double("right column") }

    before do
      Article.stub(:left_column).and_return(left_column)
      Article.stub(:main_column).and_return(main_column)
      Article.stub(:right_column).and_return(right_column)
      get :index
    end

    it "should set the left, main, and right column ivars" do
      assigns[:left_column].should == left_column
      assigns[:main_column].should == main_column
      assigns[:right_column].should == right_column
    end
  end

  describe "#show" do
    subject { response }
    let(:article) { double(Article) }

    before do
      Article.stub(:find).and_return(article)
      get :show, id: 1
    end

    it "should assign the article ivar" do
      assigns[:article].should == article
    end
  end
end
