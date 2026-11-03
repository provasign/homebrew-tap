# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.1.1/prism-v1.1.1-darwin-amd64"
      sha256 "939c49a4bde365bfe8544d6ad14080aadd2574c50ce257fb158d89f6e90fd323"

      define_method(:install) do
        bin.install "prism-v1.1.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.1.1/prism-v1.1.1-darwin-arm64"
      sha256 "180b516b2258c700b61f4806946d0a48ee1fc566b7ba553bbfd8adc19a9b121e"

      define_method(:install) do
        bin.install "prism-v1.1.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.1/prism-v1.1.1-linux-amd64"
      sha256 "863207a015d750d1a2ad96e3e680229fa304d752bda57620d9d8bc27c40b9d5f"

      define_method(:install) do
        bin.install "prism-v1.1.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.1/prism-v1.1.1-linux-arm64"
      sha256 "f29943cc14980ce7156ad7b1f665dd84962729aded2d824d4be00c5cb303a07f"

      define_method(:install) do
        bin.install "prism-v1.1.1-linux-arm64" => "prism"
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
