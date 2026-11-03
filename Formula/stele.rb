# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.3"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.3/stele-v0.1.3-darwin-amd64"
      sha256 "acc503ac9be3d44d32e31a04c4eadd903dbfffec9237b37143768f6f19fd4f20"

      define_method(:install) do
        bin.install "stele-v0.1.3-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.3/stele-v0.1.3-darwin-arm64"
      sha256 "805536637c0a9cbd25f779ab62b6b086f45d83d4a863342584caafa4fc0eb386"

      define_method(:install) do
        bin.install "stele-v0.1.3-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.3/stele-v0.1.3-linux-amd64"
      sha256 "af91dd58cba76d3470446fbad4650f28699cfd645f153604359da599cbdb36d4"

      define_method(:install) do
        bin.install "stele-v0.1.3-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.3/stele-v0.1.3-linux-arm64"
      sha256 "18e7f8885271eb9d91b6bf9e415e5e7142b6ebf1994def27586904e9558fe9d8"

      define_method(:install) do
        bin.install "stele-v0.1.3-linux-arm64" => "stele"
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
