# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.7"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.7/stele-v0.1.7-darwin-amd64"
      sha256 "4c6bc818d6a1ea752029e0a33292df701bd00a5fa03ce92bb840c915cab647e7"

      define_method(:install) do
        bin.install "stele-v0.1.7-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.7/stele-v0.1.7-darwin-arm64"
      sha256 "954859ca7d719e846ec0a8a4aa35245f8e1b41478f317de1ee23fc51bb9fd65c"

      define_method(:install) do
        bin.install "stele-v0.1.7-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.7/stele-v0.1.7-linux-amd64"
      sha256 "23daf905e1723a8f415609bd50ae2df35519d9948283711279e20cb2dec01273"

      define_method(:install) do
        bin.install "stele-v0.1.7-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.7/stele-v0.1.7-linux-arm64"
      sha256 "c6044c66fae1405415f034085bc8fb154e68b7d93869c64e10b496fb2f5dfbf0"

      define_method(:install) do
        bin.install "stele-v0.1.7-linux-arm64" => "stele"
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
