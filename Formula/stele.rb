# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.10"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.10/stele-v0.1.10-darwin-amd64"
      sha256 "585137ed7e44172318a087f85baa60347b65892d15879dcf395e2a48816c8620"

      define_method(:install) do
        bin.install "stele-v0.1.10-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.10/stele-v0.1.10-darwin-arm64"
      sha256 "68ecd4c60c5aa5058975cf5c6bb623424cd7c5b5efcbfd38b02b6d5d8fcb9543"

      define_method(:install) do
        bin.install "stele-v0.1.10-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.10/stele-v0.1.10-linux-amd64"
      sha256 "38cf2c61e205ca1626488b5b533ac3812623bfe0de51729e5604cffac6ce7455"

      define_method(:install) do
        bin.install "stele-v0.1.10-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.10/stele-v0.1.10-linux-arm64"
      sha256 "078ae36308acda614af241f3e3ec299cbbe9034ad3dfc457d1a9c82db9100ed3"

      define_method(:install) do
        bin.install "stele-v0.1.10-linux-arm64" => "stele"
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
