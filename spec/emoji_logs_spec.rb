# frozen_string_literal: true

RSpec.describe EmojiLogs do
  let(:output) { StringIO.new }
  let(:logger) { described_class.new(output) }

  describe "#info" do
    it "logs info messages with emoji" do
      logger.info("test message")
      expect(output.string).to include("ℹ️")
      expect(output.string).to include("INFO")
      expect(output.string).to include("test message")
    end

    it "supports tagged logs" do
      logger.info("test message", tag: "TestTag")
      expect(output.string).to include("[TestTag]")
    end
  end

  describe "#success" do
    it "logs success messages" do
      logger.success("operation completed")
      expect(output.string).to include("✅")
      expect(output.string).to include("SUCCESS")
    end
  end

  describe "#error" do
    it "logs error messages" do
      logger.error("something went wrong")
      expect(output.string).to include("❌")
      expect(output.string).to include("ERROR")
    end
  end

  describe "log levels" do
    it "respects log level settings" do
      logger.level = :error
      
      logger.debug("debug message")
      logger.info("info message")
      logger.error("error message")
      
      expect(output.string).not_to include("debug message")
      expect(output.string).not_to include("info message")
      expect(output.string).to include("error message")
    end
  end

  describe "block syntax" do
    it "evaluates blocks lazily" do
      logger.level = :error
      
      block_called = false
      logger.debug { block_called = true; "message" }
      
      expect(block_called).to be false
    end

    it "evaluates blocks when level matches" do
      block_called = false
      logger.info { block_called = true; "message" }
      
      expect(block_called).to be true
      expect(output.string).to include("message")
    end
  end
end
