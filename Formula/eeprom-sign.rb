# Formula for the Homebrew tap: fred-corp/tap
# Repo: https://github.com/fred-corp/homebrew-tap
#
# Installation:
#   brew tap fred-corp/tap
#   brew install eeprom-sign
#
# After each release, update `url`, `sha256`, and `version` below.
# The SHA256 is printed by the GitHub Actions release workflow.

class EepromSign < Formula
  desc     "RSA-PSS sign, verify, and batch-flash Raspberry Pi HAT+ EEPROMs"
  homepage "https://github.com/fred-corp/eeprom-sign"
  version  "1.0.4"

  on_macos do
    if Hardware::CPU.arm?
      url    "https://github.com/fred-corp/eeprom-sign/releases/download/v1.0.4/eeprom-sign-macos-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    else
      url    "https://github.com/fred-corp/eeprom-sign/releases/download/v1.0.4/eeprom-sign-macos-x86_64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    # The binary name varies by arch; install whichever was downloaded
    bin.install Dir["eeprom-sign-macos-*"].first => "eeprom-sign"
  end

  test do
    assert_match "usage", shell_output("#{bin}/eeprom-sign --help")
  end
end