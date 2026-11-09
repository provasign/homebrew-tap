# typed: false
# frozen_string_literal: true

class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.1.9"
  license "Apache-2.0"

  depends_on "z3"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/provasign/stele/releases/download/v0.1.9/stele-v0.1.9-darwin-amd64"
      sha256 "bd96dd07d57c9e461a306b3345cda7b42da42365e581868be61c0c4786dd8fde"

      define_method(:install) do
        bin.install "stele-v0.1.9-darwin-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/provasign/stele/releases/download/v0.1.9/stele-v0.1.9-darwin-arm64"
      sha256 "5e8ec3eefee5c88024184ba81ac777f4885c44b18bc57f4012a6465e620f8298"

      define_method(:install) do
        bin.install "stele-v0.1.9-darwin-arm64" => "stele"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.9/stele-v0.1.9-linux-amd64"
      sha256 "4342f39bceea889878689f29b375f85be2bcd67063a51f42979d15ebaf083771"

      define_method(:install) do
        bin.install "stele-v0.1.9-linux-amd64" => "stele"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/provasign/stele/releases/download/v0.1.9/stele-v0.1.9-linux-arm64"
      sha256 "4b2437033841e3c646c9d44e5c0110b95c5f2dc38237355988e2f80b685a48b3"

      define_method(:install) do
        bin.install "stele-v0.1.9-linux-arm64" => "stele"
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
