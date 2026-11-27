# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.4.0/prism-v1.4.0-darwin-amd64"
      sha256 "37399d171015b54de706afd7aba520354958f8123bb5bef3ccf3ad9e61941293"

      define_method(:install) do
        bin.install "prism-v1.4.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.4.0/prism-v1.4.0-darwin-arm64"
      sha256 "c92be2201794394e0c91932a888b1e474e87e7cb4e2f6367c5954b5277d93c2d"

      define_method(:install) do
        bin.install "prism-v1.4.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.4.0/prism-v1.4.0-linux-amd64"
      sha256 "61085b22fbb8ed9ee015dd441ff2e98910cdb9592940b16962b25f4a41848508"

      define_method(:install) do
        bin.install "prism-v1.4.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.4.0/prism-v1.4.0-linux-arm64"
      sha256 "252d9364f723281ad3d729dda6eb1d56ee1f452f8bd38ca1818e772d082b314c"

      define_method(:install) do
        bin.install "prism-v1.4.0-linux-arm64" => "prism"
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
