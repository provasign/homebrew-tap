# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.2.0/prism-v1.2.0-darwin-amd64"
      sha256 "2a9dffc380e31040f00d70968501f405bd47cf3c31a9bf87f01be02dda3d3f6b"

      define_method(:install) do
        bin.install "prism-v1.2.0-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.2.0/prism-v1.2.0-darwin-arm64"
      sha256 "f582118f5cd7347db8cb7cfe3bff5639e8368f5d1e45fcbf481586a5d893a6c8"

      define_method(:install) do
        bin.install "prism-v1.2.0-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.2.0/prism-v1.2.0-linux-amd64"
      sha256 "f382836d66062c7f495a2599dea760ae39ba71a2fa52751ec8a9bdf9d1975896"

      define_method(:install) do
        bin.install "prism-v1.2.0-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.2.0/prism-v1.2.0-linux-arm64"
      sha256 "1424382865a1d2f36d52af715fe8cd8a3aadda06781bc3d2c1695eeef14a55e8"

      define_method(:install) do
        bin.install "prism-v1.2.0-linux-arm64" => "prism"
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
