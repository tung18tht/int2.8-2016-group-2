# # Removes uploaded files when all scenarios for the current test process
# # are finished. Ready for parallel_tests, too.

# require 'fileutils'

# at_exit do
#   directory_name = "#{ Rails.env }#{ ENV['TEST_ENV_NUMBER'] }"
#   uploads_path = Rails.root.join('public/system', directory_name)
#   FileUtils.remove_dir(uploads_path) if uploads_path.directory?
# end
