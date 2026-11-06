# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.6"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.6/stele-v0.1.6-darwin-amd64"
      sha256 "dc04864464bbeafb5cc8fdbb8d852511b417e54551dde92edcbfe19e1b59b359"

      define_method(:install) do
        bin.install "stele-v0.1.6-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.6/stele-v0.1.6-darwin-arm64"
      sha256 "98200ca205768599ac0f8851e5ecd4f2200003a268d40dd5ea81f16f678d48d2"

      define_method(:install) do
        bin.install "stele-v0.1.6-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.6/stele-v0.1.6-linux-amd64"
      sha256 "87cf6acb949522da8661cefa63275f5ab7a167a59e62a7832f30343a7a846c34"

      define_method(:install) do
        bin.install "stele-v0.1.6-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.6/stele-v0.1.6-linux-arm64"
      sha256 "091b736eda5b907d5248957af1f259fad71c674fa8f99615cf65e79e385209fd"

      define_method(:install) do
        bin.install "stele-v0.1.6-linux-arm64" => "stele"
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
