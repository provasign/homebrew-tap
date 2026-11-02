# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.0"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.0/stele-v0.1.0-darwin-amd64"
      sha256 "ab51b0c69a5b85b2c028183cadd34620d97e5e956faae7bfaa22aa2eb0a5ef08"

      define_method(:install) do
        bin.install "stele-v0.1.0-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.0/stele-v0.1.0-darwin-arm64"
      sha256 "0b31155ba6de5334f975200402bbb78dafd8f311f835738f21a92befc397b0bf"

      define_method(:install) do
        bin.install "stele-v0.1.0-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.0/stele-v0.1.0-linux-amd64"
      sha256 "f71530079e98f9d4b959eb734c3b6b3f9a241487dd16bc100d66bc5cdbc08fa4"

      define_method(:install) do
        bin.install "stele-v0.1.0-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.0/stele-v0.1.0-linux-arm64"
      sha256 "55829d11f14e92e42b104782b576ca4a0c6a83ff797900387eb101cbd78f5e45"

      define_method(:install) do
        bin.install "stele-v0.1.0-linux-arm64" => "stele"
      end
    end
  end

  def caveats
    <<~EOS
      Stele: requirements that hold. It checks each new request or spec change
      against every approved requirement, and asks you about any contradiction
      before code is written.

      Next steps:
        1. cd your-repo
        2. stele init       finds your specs (or the requests your agents declare
                            with Shale) and your coding agents; writes their
                            instructions and hooks, and a git pre-commit hook
        3. Commit what it writes
        4. Open your coding agent and work as usual
    EOS
  end

  test do
    assert_match "stele", shell_output("#{bin}/stele version")
  end
end
