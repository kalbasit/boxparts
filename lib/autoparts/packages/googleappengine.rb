# Copyright (c) 2013-2014 Irrational Industries Inc. d.b.a. Nitrous.IO
# This software is licensed under the [BSD 2-Clause license](https://raw.github.com/nitrous-io/autoparts/master/LICENSE).

module Autoparts
  module Packages
    class GoogleAppEngine < Package
      name 'googleappengine'
      version '1.9.5'
      description 'Google App Engine for Python/PHP: A CLI for managing Google App Engine cloud services for Python and PHP'
      category Category::DEPLOYMENT

      source_url 'https://storage.googleapis.com/appengine-sdks/featured/google_appengine_1.9.5.zip'
      source_sha1 '070ba616fbeecff4bf6c5f43c00a43c21fbb108e'
      source_filetype 'zip'

      def install
        prefix_path.parent.mkpath
        FileUtils.rm_rf prefix_path
        execute 'mv', extracted_archive_path + 'google_appengine', prefix_path
      end

      def post_install
        FileUtils.rm_rf bin_path
        bin_path.mkpath
        Dir[prefix_path + "*.py"].each do |p|
          basename = File.basename(p)
          execute 'ln', '-fs', prefix_path + basename, bin_path + basename
        end
      end
    end
  end
end
