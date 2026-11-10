# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.13"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.13/stele-v0.1.13-darwin-amd64"
      sha256 "34f19d3a9a94c5ee17697f7dbc64680d145c8b67315e673b300e2f5ddc920d05"

      define_method(:install) do
        bin.install "stele-v0.1.13-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.13/stele-v0.1.13-darwin-arm64"
      sha256 "5e4720b17ea3c8a91d1216ddbdaa89d7a7f14758cd47514152a41d9dc8cae387"

      define_method(:install) do
        bin.install "stele-v0.1.13-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.13/stele-v0.1.13-linux-amd64"
      sha256 "01b37006abf071d6529b5e8fa6700ebd9a124dfb129f713b049b5a9b4e0a7bad"

      define_method(:install) do
        bin.install "stele-v0.1.13-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.13/stele-v0.1.13-linux-arm64"
      sha256 "16a2a0d63794b9579a46f4c9382af0c2fb05d647ff9203c79f211778b23f8895"

      define_method(:install) do
        bin.install "stele-v0.1.13-linux-arm64" => "stele"
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
