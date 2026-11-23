# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.1/prism-v1.3.1-darwin-amd64"
      sha256 "44278715ea6e59ccf505da595eb4188dbe56c1ac34a4bb26db5efeda1bd91f03"

      define_method(:install) do
        bin.install "prism-v1.3.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.1/prism-v1.3.1-darwin-arm64"
      sha256 "bd4563ab0fa0aefaad7fe9b3fc6a93d37bb405f86837a0a260a3f2ce2a2d8e00"

      define_method(:install) do
        bin.install "prism-v1.3.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.1/prism-v1.3.1-linux-amd64"
      sha256 "e86657da288ad4b2fcd2645beadcfbedfbd8f505efa836f422fc9932eea1c582"

      define_method(:install) do
        bin.install "prism-v1.3.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.1/prism-v1.3.1-linux-arm64"
      sha256 "0f0ec6acab7cd2a652ae13599e01bd7987b2ed033b4d3fec6a322ba9f930c6a1"

      define_method(:install) do
        bin.install "prism-v1.3.1-linux-arm64" => "prism"
      end
    end
  end

  def caveats
    <<~EOS
      Prism: context before the edit. It gives your coding agent every caller,
      implementation and test a change affects, resolved by the compiler, not grep.

      Next steps:
        1. cd your-repo
        2. prism init       choose your coding agents and how they reach Prism (MCP or CLI)
        3. prism index      build the code graph
        4. Restart or reload your coding agent; in Claude Code, approve the
           .mcp.json servers if asked, then check: claude mcp list
        5. Commit what init writes

      Run `prism init` again in each project after upgrading.
    EOS
  end

  test do
    assert_match "prism", shell_output("#{bin}/prism version")
  end
end
