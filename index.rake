# main task list:
namespace :tar do
  desc "Package files."
  task :pack, [:filename, :files] do |task, args|
    timestamp = Time.now.strftime("%Y%m%d%H%M%S").to_s
    args.with_defaults(
      filename: "dist-#{timestamp}.tar.gz",
      files: "dist",
    )
    sh "tar zcf #{args[:filename]} #{args[:files]}"
  end

  desc "Unpackage files."
  task :unpack, [:filename] do |task, args|
    args.with_defaults(
      filename: "*.tar.gz",
    )
    sh "tar zxf #{args[:filename]}"
  end

  desc "List package files."
  task :list, [:filename] do |task, args|
    args.with_defaults(
      filename: "*.tar.gz",
    )
    sh "tar tvf #{args[:filename]}"
  end

  desc "Delete packages."
  task :del, [:filename] do |task, args|
    args.with_defaults(
      filename: "*.tar.gz",
    )
    sh "rm -rf #{args[:filename]}"
  end
end
