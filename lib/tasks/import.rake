namespace 'import' do
  desc 'create import directory'
  task :create_dir => :environment do
    path = File.join Rails.root, FileImport::DIR
    FileUtils.mkdir path
  end
end
