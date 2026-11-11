# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.16"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.16/stele-v0.1.16-darwin-amd64"
      sha256 "9b0b32d9c9a2193234791de489abdbad04d435a65b1347dfd39910ef39fe94f6"

      define_method(:install) do
        bin.install "stele-v0.1.16-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.16/stele-v0.1.16-darwin-arm64"
      sha256 "9dc2c85b02f849a08b0fc2b4561e2aa443dc6b9953ec7412dbec79feadb99f0f"

      define_method(:install) do
        bin.install "stele-v0.1.16-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.16/stele-v0.1.16-linux-amd64"
      sha256 "7f2233d0610d11f9f0261021697ee93cf2a9842109d9bcea87cc83465220c221"

      define_method(:install) do
        bin.install "stele-v0.1.16-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.16/stele-v0.1.16-linux-arm64"
      sha256 "7c0d3d18132099cbaf9080cbf1e8c67f34fa17de9853848ac78b63208c1f8430"

      define_method(:install) do
        bin.install "stele-v0.1.16-linux-arm64" => "stele"
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
