# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.1.0/prism-v1.1.0-darwin-amd64"
      sha256 "f5c65504e813f37cbe0ef8109ef4d922b1a7afd5866eee13dc2d74a2b53a99f7"

      define_method(:install) do
        bin.install "prism-v1.1.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.1.0/prism-v1.1.0-darwin-arm64"
      sha256 "16398ff37814955df2b11663c9c87af4278b580f6f4a409b7e92b7ae368bca25"

      define_method(:install) do
        bin.install "prism-v1.1.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.0/prism-v1.1.0-linux-amd64"
      sha256 "391d1008ca00465eceba8a2b85ab0ac0906c28774a6ae279334b87c296ce8623"

      define_method(:install) do
        bin.install "prism-v1.1.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.0/prism-v1.1.0-linux-arm64"
      sha256 "af0a597b9a596b8264bd0b3a32a274cf639467bcdc3737c1ddc48f3e34032a07"

      define_method(:install) do
        bin.install "prism-v1.1.0-linux-arm64" => "prism"
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
