# typed: false
# frozen_string_literal: true

# Seed: scripts/refresh-formulae.sh rewrites this from the first stele
# release (version, URLs, checksums); it keeps only the desc line.
class Stele < Formula
  desc "Keeps a project's specs consistent: finds requirements that contradict each other"
  homepage "https://github.com/provasign/stele"
  version "0.0.0"
  license "Apache-2.0"
  depends_on "z3"
end
