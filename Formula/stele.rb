# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.4"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.4/stele-v0.1.4-darwin-amd64"
      sha256 "953fe677e9d0aa924ff17a5e3fbf7840a5506c97a451872b455154a91323586e"

      define_method(:install) do
        bin.install "stele-v0.1.4-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.4/stele-v0.1.4-darwin-arm64"
      sha256 "deee0ef2b874502756b6191b4642e09d5869f3858ebfb45ff295518c809460ee"

      define_method(:install) do
        bin.install "stele-v0.1.4-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.4/stele-v0.1.4-linux-amd64"
      sha256 "9d2b956c573148c8971b03f9da82500dbeec86d93a3db9560405419fdd0ee83a"

      define_method(:install) do
        bin.install "stele-v0.1.4-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.4/stele-v0.1.4-linux-arm64"
      sha256 "5993d5de4818e1e95e6b0658532c1aa8b86c2361ff87fc444f815d7d33c5eb94"

      define_method(:install) do
        bin.install "stele-v0.1.4-linux-arm64" => "stele"
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
