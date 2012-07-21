require 'spec_helper'

describe Article do
  describe "columns" do
    let!(:featured_articles) { [
      FactoryGirl.create(:article, :featured),
      FactoryGirl.create(:article, :featured)
    ] }
    let!(:side_articles) { [
      FactoryGirl.create(:article),
      FactoryGirl.create(:article),
      FactoryGirl.create(:article),
      FactoryGirl.create(:article)
    ] }

    describe ".left_column" do
      subject { Article.left_column.map(&:title) }

      it { should == side_articles.values_at(0,2).map(&:title) }
    end

    describe ".main_column" do
      subject { Article.main_column.map(&:title) }

      it { should == featured_articles.map(&:title) }
    end

    describe ".right_column" do
      subject { Article.right_column.map(&:title) }

      it { should == side_articles.values_at(1,3).map(&:title) }
    end
  end

  describe "#stub" do
    subject { article.stub }
    let(:article) { FactoryGirl.build(:article, body: body, featured: featured) }

    context "when the body is short" do
      let(:body) { "This article is super short" }
      let(:featured) { false }

      it { should == body }
    end

    context "when the body is long" do
      let(:body) { Faker::Lorem.paragraphs(20).join("\n") }

      before do
        while body.length < 326
          body << body
        end
      end

      context "when the article is featured" do
        let(:featured) { true }

        it { should == body.slice(0..300) + "..." }
      end

      context "when the article is not featured" do
        let(:featured) { false }

        it { should == body.slice(0..150) + "..." }
      end
    end
  end
end
