# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.3.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.3.3/prism-v1.3.3-darwin-amd64"
      sha256 "bf9b8e932fd78018958ee051b2cccc64d010c1534f8a0fd694f97fd56cb65e96"

      define_method(:install) do
        bin.install "prism-v1.3.3-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.3.3/prism-v1.3.3-darwin-arm64"
      sha256 "3a6ba16993e290f1486a3398f2b75360b491d2a1b505542fd76ab1fc20f5e2e2"

      define_method(:install) do
        bin.install "prism-v1.3.3-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.3/prism-v1.3.3-linux-amd64"
      sha256 "6a2fccdc399253b8f0b87eec4cd3b679c0569450ed83e5f755d508b81c4697d1"

      define_method(:install) do
        bin.install "prism-v1.3.3-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.3.3/prism-v1.3.3-linux-arm64"
      sha256 "dfc4898f93e501a07f83165aefaf0afd0208d53f591f42297e4ac02e7a453444"

      define_method(:install) do
        bin.install "prism-v1.3.3-linux-arm64" => "prism"
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
