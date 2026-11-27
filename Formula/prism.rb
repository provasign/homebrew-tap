# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.5.0/prism-v1.5.0-darwin-amd64"
      sha256 "38db97b14d28643947252ede9c5e2fd937442c94dbc184ce037dc0028418a92a"

      define_method(:install) do
        bin.install "prism-v1.5.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.5.0/prism-v1.5.0-darwin-arm64"
      sha256 "0a31e697b0599d9c1123879fd51c216f8ee0b6eb704128354c28db822b11d0d2"

      define_method(:install) do
        bin.install "prism-v1.5.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.0/prism-v1.5.0-linux-amd64"
      sha256 "c70fa9a6abd626acc65f81cfc25cdece908bf6d18f1c75ae08cc837e58bdf82b"

      define_method(:install) do
        bin.install "prism-v1.5.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.0/prism-v1.5.0-linux-arm64"
      sha256 "3775687ba204f39ebb6cdf881e1862730b3ae983b6277a7610a7965891d3e64f"

      define_method(:install) do
        bin.install "prism-v1.5.0-linux-arm64" => "prism"
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
