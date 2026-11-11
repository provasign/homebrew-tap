# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.19"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.19/stele-v0.1.19-darwin-amd64"
      sha256 "cfd6da944709495e23d51755d4c49bc838dc2ff9fd3c2b3742adc7bf33faaf02"

      define_method(:install) do
        bin.install "stele-v0.1.19-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.19/stele-v0.1.19-darwin-arm64"
      sha256 "364759c9367958832391625fc0850b4c40347a09bd61c2432f61d3060352ae73"

      define_method(:install) do
        bin.install "stele-v0.1.19-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.19/stele-v0.1.19-linux-amd64"
      sha256 "fe47991d9d74b94b6ff01a69d34b84ffc2ff2069e51253b19cb080150b968f12"

      define_method(:install) do
        bin.install "stele-v0.1.19-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.19/stele-v0.1.19-linux-arm64"
      sha256 "c844d6a3b54fc33241414ab8309a6affa02342b4a6076b32515c4e32fc699124"

      define_method(:install) do
        bin.install "stele-v0.1.19-linux-arm64" => "stele"
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
