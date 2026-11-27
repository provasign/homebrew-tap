# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.5.1/prism-v1.5.1-darwin-amd64"
      sha256 "d3bdbd4ace5000628f8ad3bf4bcb19ec33f2e30feba7bb08c931d6a64e25a91a"

      define_method(:install) do
        bin.install "prism-v1.5.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.5.1/prism-v1.5.1-darwin-arm64"
      sha256 "38d9ac151ed26168a95c6e3c59d95193f47261b17119c2dd50b8b738db796ef1"

      define_method(:install) do
        bin.install "prism-v1.5.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.1/prism-v1.5.1-linux-amd64"
      sha256 "2d4faa340d1996b54ae9a147900609ad6395feebbeb904ef528464c711c4bac6"

      define_method(:install) do
        bin.install "prism-v1.5.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.1/prism-v1.5.1-linux-arm64"
      sha256 "935347258114a811a532337aa859f5d88cd09622b2e4db535fdc67ca18f4d574"

      define_method(:install) do
        bin.install "prism-v1.5.1-linux-arm64" => "prism"
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
