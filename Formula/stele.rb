# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.17"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.17/stele-v0.1.17-darwin-amd64"
      sha256 "9b676f228e966a0322d3bc67f167c9b6e80621b06803e920676a8d570987a467"

      define_method(:install) do
        bin.install "stele-v0.1.17-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.17/stele-v0.1.17-darwin-arm64"
      sha256 "7fe97cdb9339c32c1ca52228537ec1d6662dde1a6468c089719ddd3f8edc69bd"

      define_method(:install) do
        bin.install "stele-v0.1.17-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.17/stele-v0.1.17-linux-amd64"
      sha256 "cb0b3f22b171db0251efc43f67c8d773d0e64dbc78d431723fcddd89f83663d1"

      define_method(:install) do
        bin.install "stele-v0.1.17-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.17/stele-v0.1.17-linux-arm64"
      sha256 "32377f48f06238638f86a39c914a15838f7fea1d08844353fe98ab37408be8e1"

      define_method(:install) do
        bin.install "stele-v0.1.17-linux-arm64" => "stele"
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
