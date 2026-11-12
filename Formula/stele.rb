# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.22"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.22/stele-v0.1.22-darwin-amd64"
      sha256 "a43e173257e59011e27a835dc810659f93f1121ea783dbdbc53888bff2695d12"

      define_method(:install) do
        bin.install "stele-v0.1.22-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.22/stele-v0.1.22-darwin-arm64"
      sha256 "960e46bce968f714847b95559eff71567fc1cba6e40c4a1502a9e9aa024a1790"

      define_method(:install) do
        bin.install "stele-v0.1.22-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.22/stele-v0.1.22-linux-amd64"
      sha256 "2340d39daf52f76b5e1e00743891cddead11de2e0ea4f1c1893df1f3779bd473"

      define_method(:install) do
        bin.install "stele-v0.1.22-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.22/stele-v0.1.22-linux-arm64"
      sha256 "4cc3971e6d22c610a53bf39876c431dd918c543d27422712a9b78656b4fa3e0b"

      define_method(:install) do
        bin.install "stele-v0.1.22-linux-arm64" => "stele"
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
