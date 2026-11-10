# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.11"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.11/stele-v0.1.11-darwin-amd64"
      sha256 "18f56689d270065eb67c635ef14dafdf09e4b245499e9ff58efc485b322ed099"

      define_method(:install) do
        bin.install "stele-v0.1.11-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.11/stele-v0.1.11-darwin-arm64"
      sha256 "e97eaff49a0554513a33373d81059cd64c8b6f57c6e9cd789ae0255e700d8613"

      define_method(:install) do
        bin.install "stele-v0.1.11-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.11/stele-v0.1.11-linux-amd64"
      sha256 "d4d9213b82d696d5e6f366eeb6b0f11be67985c5752014131377c91da415043d"

      define_method(:install) do
        bin.install "stele-v0.1.11-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.11/stele-v0.1.11-linux-arm64"
      sha256 "10153587d94463217ba4817156dfac40738732c536b6b32a915ad638da03867f"

      define_method(:install) do
        bin.install "stele-v0.1.11-linux-arm64" => "stele"
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
