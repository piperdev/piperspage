Article.destroy_all
6.times do
  FactoryGirl.create(:article)
end

3.times do
  FactoryGirl.create(:article, :featured)
end
