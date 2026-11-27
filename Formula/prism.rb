# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.4.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.4.1/prism-v1.4.1-darwin-amd64"
      sha256 "2c8329a6cd215a0fc794adbcb4ccc0dee3be2bb3ae8feb2b508efdd5deb10f98"

      define_method(:install) do
        bin.install "prism-v1.4.1-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.4.1/prism-v1.4.1-darwin-arm64"
      sha256 "d7cdc43c1314242c2262b572931a129bdad83e32f616b5ec0b15b00c5ea502ab"

      define_method(:install) do
        bin.install "prism-v1.4.1-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.4.1/prism-v1.4.1-linux-amd64"
      sha256 "4db6ba9050add6129bee95e2dae9d7dbcc51ca496ead09734fd3472b21ae6a31"

      define_method(:install) do
        bin.install "prism-v1.4.1-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.4.1/prism-v1.4.1-linux-arm64"
      sha256 "872fbce24fa89cb42ffe1f80bf524ef94c471893636b412952729f67e52c28ab"

      define_method(:install) do
        bin.install "prism-v1.4.1-linux-arm64" => "prism"
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
