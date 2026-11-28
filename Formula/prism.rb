# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.6.0/prism-v1.6.0-darwin-amd64"
      sha256 "afe79a866100c83afa3d28cea352a2c6a174533132c6934b92b8125e34dac838"

      define_method(:install) do
        bin.install "prism-v1.6.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.6.0/prism-v1.6.0-darwin-arm64"
      sha256 "731e375be55301575d6888dfe4a4f1d44810c22929df3d506192c9f8edad0eaf"

      define_method(:install) do
        bin.install "prism-v1.6.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.6.0/prism-v1.6.0-linux-amd64"
      sha256 "120a0f2f4c356fb87eace16d8733c9e975b2a49e90e0c45098adfe49c42a7ff8"

      define_method(:install) do
        bin.install "prism-v1.6.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.6.0/prism-v1.6.0-linux-arm64"
      sha256 "161f61853dfdb6011e51bf90a2a9e198b673ad3d3c053535ba7b051daac99589"

      define_method(:install) do
        bin.install "prism-v1.6.0-linux-arm64" => "prism"
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
