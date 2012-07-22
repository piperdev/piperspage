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

  context "authenticated methods" do
    let(:user) { FactoryGirl.create(:user) }

    before do
      sign_in user
      controller.stub(:current_user).and_return(user)
    end

    describe "#new" do
      subject { response }
      before do
        get :new
      end

      it "should assign the article ivar" do
        assigns[:article].should be_new_record
      end
    end

    describe "#create" do
      subject { response }

      before do
        post :create, article: article_params
      end

      context "with valid params" do
        let(:article_params) { {title: "Foo article",
                        body: "So bar it's baz"} }

        it "should assign the article ivar" do
          assigns[:article].should be_persisted
          assigns[:article].user.should == user
        end

        it { should redirect_to article_path(assigns[:article]) }
      end

      context "with invalid params" do
        let(:article_params) { {} }

        it { should render_template("articles/new") }
      end
    end
  end
end
