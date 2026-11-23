# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.0/prism-v1.3.0-darwin-amd64"
      sha256 "7dad9ade227fb44fd594c85e6dc3592481767083c68c782eef3a9d2054e44b2c"

      define_method(:install) do
        bin.install "prism-v1.3.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.0/prism-v1.3.0-darwin-arm64"
      sha256 "462a3e9d63b0cabd26cd47057462031f2f7b9a3e5aabd822ac658ce2b40ded34"

      define_method(:install) do
        bin.install "prism-v1.3.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.0/prism-v1.3.0-linux-amd64"
      sha256 "e4961b15878e0721790acbbcbd260c27edcda6ae70c10477a52bd80508324fed"

      define_method(:install) do
        bin.install "prism-v1.3.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.0/prism-v1.3.0-linux-arm64"
      sha256 "c65f2626614f4c5b3ef267610483bd75a2f085014abfcaaf1bd282f91a75b1ae"

      define_method(:install) do
        bin.install "prism-v1.3.0-linux-arm64" => "prism"
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
