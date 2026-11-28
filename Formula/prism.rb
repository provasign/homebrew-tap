# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.5.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.5.2/prism-v1.5.2-darwin-amd64"
      sha256 "bce7c04076d6017f96976e07d054a3785e29ca6b935580bee23470e81564d9d1"

      define_method(:install) do
        bin.install "prism-v1.5.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.5.2/prism-v1.5.2-darwin-arm64"
      sha256 "66df0f2485a8bbac14d6ec51e01ee32c71317e245a8d31c3bf6003cd8ac7b3e2"

      define_method(:install) do
        bin.install "prism-v1.5.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.2/prism-v1.5.2-linux-amd64"
      sha256 "efaff4d75c88e91752237d7393e24e7d2fbbaa5a716a142e27f2e6daae49222e"

      define_method(:install) do
        bin.install "prism-v1.5.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.5.2/prism-v1.5.2-linux-arm64"
      sha256 "5ccc5bb72e3e050f4d0b2055aa34fbc5cb307aea3254f946d381950b86c52ffd"

      define_method(:install) do
        bin.install "prism-v1.5.2-linux-arm64" => "prism"
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
