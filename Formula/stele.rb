# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.5"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.5/stele-v0.1.5-darwin-amd64"
      sha256 "425b7194c4019418017e9fddf832e8b31671573eec0fc85a05d6d0c0395a087f"

      define_method(:install) do
        bin.install "stele-v0.1.5-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.5/stele-v0.1.5-darwin-arm64"
      sha256 "d5a0cc27133dafc29058e3a9b2b4c14c894a6fffd2d7a0917a5e04d529d0d9f8"

      define_method(:install) do
        bin.install "stele-v0.1.5-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.5/stele-v0.1.5-linux-amd64"
      sha256 "b318c750304a8887121fc117e3ceb620e906b8102de3ed2f1861b3a39c69f412"

      define_method(:install) do
        bin.install "stele-v0.1.5-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.5/stele-v0.1.5-linux-arm64"
      sha256 "29d760cc3f7874e751d05526dc6b778b03997ca886c5acb85b54794b55482bc3"

      define_method(:install) do
        bin.install "stele-v0.1.5-linux-arm64" => "stele"
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
