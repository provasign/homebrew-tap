# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.2/prism-v1.3.2-darwin-amd64"
      sha256 "6bb536e595603c768632cbcaf69625fa856e69308e596d7dedcb11eeb21cfe93"

      define_method(:install) do
        bin.install "prism-v1.3.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.2/prism-v1.3.2-darwin-arm64"
      sha256 "9a6fe58f771468ea53935f5384380378c81b9df7d72502d48c089dae4b40caaa"

      define_method(:install) do
        bin.install "prism-v1.3.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.2/prism-v1.3.2-linux-amd64"
      sha256 "f2f5aab0ac479ba974bbbc779cd76b73a5a6d66033eb715fe4e35058dae34c8a"

      define_method(:install) do
        bin.install "prism-v1.3.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.2/prism-v1.3.2-linux-arm64"
      sha256 "25eaf298fd2e79ad6fe4a4ee2c866735c2586aefc05a873c8fa871a9a8cd737d"

      define_method(:install) do
        bin.install "prism-v1.3.2-linux-arm64" => "prism"
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
