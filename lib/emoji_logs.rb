# frozen_string_literal: true

require_relative "emoji_logs/version"

class EmojiLogs
  LEVELS = {
    debug: { emoji: "🔍", name: "DEBUG" },
    info: { emoji: "ℹ️", name: "INFO" },
    success: { emoji: "✅", name: "SUCCESS" },
    warn: { emoji: "⚠️", name: "WARN" },
    error: { emoji: "❌", name: "ERROR" },
    fatal: { emoji: "💥", name: "FATAL" }
  }.freeze

  attr_accessor :level, :output

  def initialize(output = $stdout, level: :debug)
    @output = output
    @level = level
  end

  # Log methods for each level
  def debug(message = nil, tag: nil, &block)
    log(:debug, message, tag: tag, &block)
  end

  def info(message = nil, tag: nil, &block)
    log(:info, message, tag: tag, &block)
  end

  def success(message = nil, tag: nil, &block)
    log(:success, message, tag: tag, &block)
  end

  def warn(message = nil, tag: nil, &block)
    log(:warn, message, tag: tag, &block)
  end

  def error(message = nil, tag: nil, &block)
    log(:error, message, tag: tag, &block)
  end

  def fatal(message = nil, tag: nil, &block)
    log(:fatal, message, tag: tag, &block)
  end

  # Alias for success
  def ok(message = nil, tag: nil, &block)
    success(message, tag: tag, &block)
  end

  private

  def log(severity, message = nil, tag: nil)
    return if severity_level(severity) < severity_level(@level)

    message = yield if block_given?
    return unless message

    level_info = LEVELS[severity]
    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S")
    tag_str = tag ? " [#{tag}]" : ""
    
    formatted = "#{level_info[:emoji]}  #{timestamp} #{level_info[:name]}#{tag_str}: #{message}\n"
    @output.write(formatted)
    @output.flush if @output.respond_to?(:flush)
  end

  def severity_level(level)
    LEVELS.keys.index(level) || 0
  end
end
