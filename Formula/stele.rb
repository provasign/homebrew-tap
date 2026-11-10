# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.12"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.12/stele-v0.1.12-darwin-amd64"
      sha256 "3ee2a348a2a11f290d747c53c2a5304e95377f02f8567dfa1a82bab5097b2988"

      define_method(:install) do
        bin.install "stele-v0.1.12-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.12/stele-v0.1.12-darwin-arm64"
      sha256 "847004de23819c5bac628a69f5bc6befd9835e34032e46e5b94cfb13e84861b5"

      define_method(:install) do
        bin.install "stele-v0.1.12-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.12/stele-v0.1.12-linux-amd64"
      sha256 "6aa4dd37cb3a6be5d23b48ff7f88a8b82d572398cf85a888caf3f27b53208d3f"

      define_method(:install) do
        bin.install "stele-v0.1.12-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.12/stele-v0.1.12-linux-arm64"
      sha256 "788304eaa2ef578d5cc4a3605b7e2591331a256d0fe2e2d16d66f6b71cdbebca"

      define_method(:install) do
        bin.install "stele-v0.1.12-linux-arm64" => "stele"
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
