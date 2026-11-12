# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.21"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.21/stele-v0.1.21-darwin-amd64"
      sha256 "5c43cd12b2ae80984256db580ef0b4193c81720ab195b45d32b1279f79ac119d"

      define_method(:install) do
        bin.install "stele-v0.1.21-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.21/stele-v0.1.21-darwin-arm64"
      sha256 "6742add5385f1b4ace82adc371896dbb05fe1b37586e4175263a2e9955507cf3"

      define_method(:install) do
        bin.install "stele-v0.1.21-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.21/stele-v0.1.21-linux-amd64"
      sha256 "9b9765b54b93410680a3a42bf2c36969ae7f6c0ab3993cf8b8a5116873e388b4"

      define_method(:install) do
        bin.install "stele-v0.1.21-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.21/stele-v0.1.21-linux-arm64"
      sha256 "6f615bd6b33fbf94912cae8eb5d0e5327fc97f1c3f83ca54e071cd044524d477"

      define_method(:install) do
        bin.install "stele-v0.1.21-linux-arm64" => "stele"
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
