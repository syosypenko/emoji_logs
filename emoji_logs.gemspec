# frozen_string_literal: true

require_relative "lib/emoji_logs/version"

Gem::Specification.new do |spec|
  spec.name = "emoji_logs"
  spec.version = EmojiLogs::VERSION
  spec.authors = ["Serhiy Yosypenko"]
  spec.email = ["serhiy.yosipenko@gmail.com"]

  spec.summary = "A tiny Ruby logger that makes logs easier (and more fun) to read by adding expressive emojis."
  spec.description = "EmojiLogs is a simple, zero-dependency Ruby logger that uses emojis to make log levels instantly recognizable. Perfect for development, debugging, and making logs more enjoyable to read."
  spec.homepage = "https://github.com/yourusername/emoji_logs"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/syosypenko/emoji_logger"
  spec.metadata["changelog_uri"] = "https://github.com/syosypenko/emoji_logger/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE.txt CHANGELOG.md]
  spec.require_paths = ["lib"]

  # No runtime dependencies - keep it simple!
  
  # Development dependencies
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
