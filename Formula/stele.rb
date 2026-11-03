# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.2"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.2/stele-v0.1.2-darwin-amd64"
      sha256 "3d761cdb01304a6d56f4cc95811cc57ed22b1cc136ccd89ddd30b9201f1a960c"

      define_method(:install) do
        bin.install "stele-v0.1.2-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.2/stele-v0.1.2-darwin-arm64"
      sha256 "7eb1737406d70c483862625ce0acc8014674a518169b82a73cc7d55fb7901259"

      define_method(:install) do
        bin.install "stele-v0.1.2-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.2/stele-v0.1.2-linux-amd64"
      sha256 "1b2c9912bd13655ac6a2d1a4fa267a5a4b6edd621be05727d9f040c45c1f3f2a"

      define_method(:install) do
        bin.install "stele-v0.1.2-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.2/stele-v0.1.2-linux-arm64"
      sha256 "e13e886e9087398a937502cd393ded0641074467b5779ac6b15644cfc3552fdb"

      define_method(:install) do
        bin.install "stele-v0.1.2-linux-arm64" => "stele"
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
