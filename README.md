# 🎨 EmojiLogger

A tiny Ruby logger that makes logs easier (and more fun) to read by adding expressive emojis.

Because logs don't have to be boring.

---

## ✨ Features

- Simple, intuitive API
- Emoji-based log levels
- Optional tagged logs
- No dependencies
- Works anywhere Ruby runs

## 📦 Installation

Add this line to your application's Gemfile:

```ruby
gem 'emoji_logger'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install emoji_logger
```

## 🚀 Usage

### Basic Logging

```ruby
require 'emoji_logger'

logger = EmojiLogger.new

logger.debug("Starting application")
logger.info("Server listening on port 3000")
logger.success("User authentication successful")
logger.warn("API rate limit approaching")
logger.error("Failed to connect to database")
logger.fatal("System out of memory")
```

Output:
```
🔍  2026-01-06 10:30:15 DEBUG: Starting application
ℹ️  2026-01-06 10:30:16 INFO: Server listening on port 3000
✅  2026-01-06 10:30:17 SUCCESS: User authentication successful
⚠️  2026-01-06 10:30:18 WARN: API rate limit approaching
❌  2026-01-06 10:30:19 ERROR: Failed to connect to database
💥  2026-01-06 10:30:20 FATAL: System out of memory
```

### Tagged Logs

Add context to your logs with tags:

```ruby
logger.info("Processing payment", tag: "Payment")
logger.success("Email sent", tag: "Notifications")
logger.error("Invalid request", tag: "API")
```

Output:
```
ℹ️  2026-01-06 10:30:15 INFO [Payment]: Processing payment
✅  2026-01-06 10:30:16 SUCCESS [Notifications]: Email sent
❌  2026-01-06 10:30:17 ERROR [API]: Invalid request
```

### Block Syntax

Use blocks for lazy evaluation:

```ruby
logger.debug { "Expensive computation: #{expensive_operation}" }
```

The block is only evaluated if the log level is enabled.

### Log Levels

Set the minimum log level:

```ruby
logger = EmojiLogger.new(level: :info)

logger.debug("This won't be logged")
logger.info("This will be logged")
```

Available levels (in order):
- `:debug` 🔍
- `:info` ℹ️
- `:success` ✅ (also available as `logger.ok`)
- `:warn` ⚠️
- `:error` ❌
- `:fatal` 💥

### Custom Output

Log to a file or any IO object:

```ruby
# Log to a file
File.open("app.log", "a") do |file|
  logger = EmojiLogger.new(file)
  logger.info("Logging to file")
end

# Log to StringIO (useful for testing)
require 'stringio'
output = StringIO.new
logger = EmojiLogger.new(output)
logger.info("Test message")
puts output.string
```

## 🎯 Why EmojiLogger?

Traditional logs can be hard to scan, especially when debugging or monitoring applications. Emojis provide instant visual cues that make it easier to:

- 👀 Quickly spot errors and warnings in long log files
- 🎨 Differentiate between log levels at a glance
- 😊 Make development more enjoyable
- 🚀 Stay compatible with all Ruby environments (no external dependencies)

## 🧪 Development

After checking out the repo, run:

```bash
bundle install
rake spec
```

To install this gem onto your local machine:

```bash
rake install
```

To release a new version:

1. Update the version number in `lib/emoji_logger/version.rb`
2. Run `bundle exec rake release` to create a git tag and push to RubyGems

## 🤝 Contributing

Bug reports and pull requests are welcome on GitHub. This project is intended to be a safe, welcoming space for collaboration.

## 📄 License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## 🙏 Acknowledgments

Inspired by the need for more readable logs and the universal language of emojis.
