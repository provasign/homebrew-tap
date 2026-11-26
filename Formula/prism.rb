# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.4/prism-v1.3.4-darwin-amd64"
      sha256 "3f6d87323f83a233497e62d827bbc662313c89c6e4f2ecfbaecd8deb65af795c"

      define_method(:install) do
        bin.install "prism-v1.3.4-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.4/prism-v1.3.4-darwin-arm64"
      sha256 "ca6b8e39331897202edc9362f6ece8a50ce83b067612d0d70360795f4730182a"

      define_method(:install) do
        bin.install "prism-v1.3.4-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.4/prism-v1.3.4-linux-amd64"
      sha256 "a76ea28c3c2c55f821f30fa42aab1f2df88ff9e2fc5a2b4589cabceb4ca7ae81"

      define_method(:install) do
        bin.install "prism-v1.3.4-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.4/prism-v1.3.4-linux-arm64"
      sha256 "489aec6c801015f8b0eacebb24a82821042a5317786ba9e8b4a80c5564526923"

      define_method(:install) do
        bin.install "prism-v1.3.4-linux-arm64" => "prism"
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
