# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.1"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.1/stele-v0.1.1-darwin-amd64"
      sha256 "06c5b40a8fa6065b2cc4604ab53bbcdf268d6727a3f3a671a6afa4a0a507ce0f"

      define_method(:install) do
        bin.install "stele-v0.1.1-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.1/stele-v0.1.1-darwin-arm64"
      sha256 "b22276375bc398ccc98a73418dc7ddf3e7c528290e74afabb31604ab305fce55"

      define_method(:install) do
        bin.install "stele-v0.1.1-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.1/stele-v0.1.1-linux-amd64"
      sha256 "455bf48ec1be9aaf8b40e76feffe9babe5449ddc020ea38de23912743fdb7b35"

      define_method(:install) do
        bin.install "stele-v0.1.1-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.1/stele-v0.1.1-linux-arm64"
      sha256 "ad62e248edb58c95aa698b682a28cb7a01a65e024dcda939df5ff7faf3c3651e"

      define_method(:install) do
        bin.install "stele-v0.1.1-linux-arm64" => "stele"
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
