# main task list:
namespace :tar do
  desc "Package files."
  task :pack, [:source, :filename, :separator, :suffix] do |task, args|
    timestamp = Time.now.strftime("%Y%m%d%H%M%S").to_s
    args.with_defaults(
      source: "dist",
      filename: "dist",
      separator: "-",
      suffix: timestamp,
    )

    filename = args[:filename] + args[:separator] + args[:suffix] + ".tar.gz"
    sh "tar zcf #{filename} #{args[:source]}"
  end

  desc "Unpackage files."
  task :unpack, [:filename] do |task, args|
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
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
  task :delete, [:filename] do
    args.with_defaults(
      filename: "*.tar.gz",
    )
    sh "rm -rf #{args[:filename]}"
  end
end
