Article.destroy_all
User.destroy_all
6.times do
  FactoryGirl.create(:article)
end

3.times do
  FactoryGirl.create(:article, :featured)
end

User.create({name: "admin",
             email: "admin@piperspage.com",
             password: "password",
             admin: true})
