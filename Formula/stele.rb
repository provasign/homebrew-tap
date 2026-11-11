# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.18"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.18/stele-v0.1.18-darwin-amd64"
      sha256 "15ab13aa24084de696e5907bde1709826aaa1a97e072211381c3c91403feb4ab"

      define_method(:install) do
        bin.install "stele-v0.1.18-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.18/stele-v0.1.18-darwin-arm64"
      sha256 "4ef097337eb4516cf443d279bbabc2e2be183e73fadb6e9b6074a0309628db0f"

      define_method(:install) do
        bin.install "stele-v0.1.18-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.18/stele-v0.1.18-linux-amd64"
      sha256 "852bf62fedc990015e4d26dd1aaf5868f9901f0e781bba0c599ecf1b9e340d15"

      define_method(:install) do
        bin.install "stele-v0.1.18-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.18/stele-v0.1.18-linux-arm64"
      sha256 "c31e4db4aa0bfe712ae2eb39fdddac266d2669a533acd23b3a43e27737c46a42"

      define_method(:install) do
        bin.install "stele-v0.1.18-linux-arm64" => "stele"
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
