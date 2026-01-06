#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "../lib/emoji_logs"

# Create a new logger
logger = EmojiLogs.new

# Basic logging examples
puts "=== Basic Logging ==="
logger.debug("Application starting up...")
logger.info("Configuration loaded from config.yml")
logger.success("Database connection established")
logger.warn("Cache miss for key 'user:123'")
logger.error("Failed to send notification email")
logger.fatal("Critical system error - shutting down")

puts "\n=== Tagged Logs ==="
logger.info("User logged in successfully", tag: "Auth")
logger.success("Payment processed: $99.99", tag: "Payments")
logger.warn("Slow query detected (2.3s)", tag: "Database")
logger.error("Invalid API token", tag: "API")

puts "\n=== Block Syntax ==="
logger.debug { "Expensive computation result: #{Time.now.to_i * 42}" }
logger.info { "Current memory usage: #{rand(100..500)}MB" }

puts "\n=== Different Log Levels ==="
logger_warn = EmojiLogs.new(level: :warn)
logger_warn.debug("This won't show")
logger_warn.info("This won't show either")
logger_warn.warn("This will show!")
logger_warn.error("This will show too!")

puts "\n=== Using 'ok' alias ==="
logger.ok("All systems operational")
logger.ok("Health check passed", tag: "Monitoring")
