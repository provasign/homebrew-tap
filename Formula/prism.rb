# typed: false
# frozen_string_literal: true

class Prism < Formula
  desc "Graph-ranked code context for AI coding agents — Grove engine embedded"
  homepage "https://github.com/provasign/prism"
  version "1.1.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/prism/releases/download/v1.1.2/prism-v1.1.2-darwin-amd64"
      sha256 "ad426def6622c2ee3213c7e29e2c9f1e9608bf09ef4b98d38f4c0b8fc2ce46e4"

      define_method(:install) do
        bin.install "prism-v1.1.2-darwin-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/prism/releases/download/v1.1.2/prism-v1.1.2-darwin-arm64"
      sha256 "842330f6c8cd8be9c8fa7c3d0dc053b2f6341e5b532c7acfe88dd37aebdf5418"

      define_method(:install) do
        bin.install "prism-v1.1.2-darwin-arm64" => "prism"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.2/prism-v1.1.2-linux-amd64"
      sha256 "1dac0bca391446e9ae8aa4e4c45e0fe11d006186c7a73b492ec3da71f1881ff5"

      define_method(:install) do
        bin.install "prism-v1.1.2-linux-amd64" => "prism"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/prism/releases/download/v1.1.2/prism-v1.1.2-linux-arm64"
      sha256 "5b620fea8070a932061b0ad79768c8ad8abdac9d265647fa7d5fbdc0bdf0db47"

      define_method(:install) do
        bin.install "prism-v1.1.2-linux-arm64" => "prism"
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
