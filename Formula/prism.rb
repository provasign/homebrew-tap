# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.5/prism-v1.3.5-darwin-amd64"
      sha256 "84278f3db427700b917e985e45f6f74d6c7ade79c035064869329dd595b2f447"

      define_method(:install) do
        bin.install "prism-v1.3.5-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.5/prism-v1.3.5-darwin-arm64"
      sha256 "2104df28c732f78e35dc9ef568feeeab8321e74f61a845e433da2768467d802d"

      define_method(:install) do
        bin.install "prism-v1.3.5-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.5/prism-v1.3.5-linux-amd64"
      sha256 "8c4b2fbed158b31df09c4b7897d3631421b8374f1db513d73e893d41e353ecc2"

      define_method(:install) do
        bin.install "prism-v1.3.5-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.5/prism-v1.3.5-linux-arm64"
      sha256 "c2a388287196b377f193e7422ee68aa5503c3ea7d67ffa9d84f6cb2e6e6de754"

      define_method(:install) do
        bin.install "prism-v1.3.5-linux-arm64" => "prism"
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
