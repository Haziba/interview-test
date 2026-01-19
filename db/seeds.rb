# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

COVERS_PATH = Rails.root.join("db/fixtures/book_covers")
PROFILES_PATH = Rails.root.join("db/fixtures/profile_pictures")

def attach_cover(book, filename)
  path = COVERS_PATH.join(filename)
  return unless File.exist?(path)
  return if book.cover_image.attached?

  book.cover_image.attach(
    io: File.open(path),
    filename: filename
  )
end

def attach_profile(user, filename)
  path = PROFILES_PATH.join(filename)
  return unless File.exist?(path)
  return if user.profile_image.attached?

  user.profile_image.attach(
    io: File.open(path),
    filename: filename
  )
end

# Authors
george_eliot = Author.find_or_create_by!(name: "George Eliot")
robert_louis_stevenson = Author.find_or_create_by!(name: "Robert Louis Stevenson")
louisa_may_alcott = Author.find_or_create_by!(name: "Louisa May Alcott")

# Books - George Eliot
middlemarch = Book.find_or_create_by!(title: "Middlemarch") do |book|
  book.author = george_eliot
end
attach_cover(middlemarch, "Middlemarch.png")

felix_holt = Book.find_or_create_by!(title: "Felix Holt, The Radical") do |book|
  book.author = george_eliot
end
attach_cover(felix_holt, "Felix Holt, The Radical.jpg")

best_known_eliot = Book.find_or_create_by!(title: "The Best-Known Novels of George Eliot") do |book|
  book.author = george_eliot
end
attach_cover(best_known_eliot, "The Best-Known Novels of George Eliot.jpg")

# Books - Robert Louis Stevenson
jekyll_hyde = Book.find_or_create_by!(title: "The Strange Case of Dr Jekyll and Mr Hyde") do |book|
  book.author = robert_louis_stevenson
end
attach_cover(jekyll_hyde, "The Strange Case of Dr Jekyll and Mr Hyde.png")

treasure_island = Book.find_or_create_by!(title: "Treasure Island") do |book|
  book.author = robert_louis_stevenson
end
attach_cover(treasure_island, "Treasure Island.jpg")

supernatural_tales = Book.find_or_create_by!(title: "Supernatural Tales") do |book|
  book.author = robert_louis_stevenson
end
attach_cover(supernatural_tales, "Supernatural Tales.jpg")

# Books - Louisa May Alcott
little_women = Book.find_or_create_by!(title: "Little Women") do |book|
  book.author = louisa_may_alcott
end
attach_cover(little_women, "Little Women.png")

little_men = Book.find_or_create_by!(title: "Little Men") do |book|
  book.author = louisa_may_alcott
end
attach_cover(little_men, "Little Men.webp")

complete_alcott = Book.find_or_create_by!(title: "The Complete Works of Louisa May Alcott") do |book|
  book.author = louisa_may_alcott
end
attach_cover(complete_alcott, "The Complete Works of Louisa May Alcott.jpg")

# Users
harry = User.find_or_create_by!(email: "harry@example.com") do |user|
  user.name = "Harry"
end
attach_profile(harry, "Harry.png")

interviewee = User.find_or_create_by!(email: "interviewee@example.com") do |user|
  user.name = "Interviewee"
end
attach_profile(interviewee, "Interviewee.webp")
