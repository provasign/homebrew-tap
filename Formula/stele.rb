# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.20"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.20/stele-v0.1.20-darwin-amd64"
      sha256 "18992f9914b5a62b6207e4ceb9bd3e45eb3466eb90cf3382fcec6dd40f809252"

      define_method(:install) do
        bin.install "stele-v0.1.20-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.20/stele-v0.1.20-darwin-arm64"
      sha256 "4202cc8bc847c18ecff9866d278428053cba5d5af882fa5cb3612b9d0861825a"

      define_method(:install) do
        bin.install "stele-v0.1.20-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.20/stele-v0.1.20-linux-amd64"
      sha256 "6431b6a0d9acb9cbd6b417d2757246137a18699cea7b0a9605dcc852bce3fe62"

      define_method(:install) do
        bin.install "stele-v0.1.20-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.20/stele-v0.1.20-linux-arm64"
      sha256 "c68399fdc85de99463bcd719927042ccab00154b392b8074afbf8f411254aa0f"

      define_method(:install) do
        bin.install "stele-v0.1.20-linux-arm64" => "stele"
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
