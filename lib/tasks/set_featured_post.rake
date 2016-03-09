desc "Set featured post"
task :set_featured_post => :environment do
  puts "Set featured post"
  FeaturedPost.new.perform
  puts "done."
end