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
  version  "1.0.8"

  on_macos do
    url    "https://github.com/fred-corp/eeprom-sign/releases/download/v1.0.8/eeprom-sign-macos-arm64"
    sha256 "d9948336525141ca14951080c4410c552d2f72a125a576e74c172830e274a351"
  end
  on_linux do
    if Hardware::CPU.arm?
      url    "https://github.com/fred-corp/eeprom-sign/releases/download/v1.0.6/eeprom-sign-linux-aarch64"
      sha256 "3acf2426b3d60655f51d59daa62f3290e8cc567bd5be02f6070f5af4bc6aad16"
    else
      url    "https://github.com/fred-corp/eeprom-sign/releases/download/v1.0.6/eeprom-sign-linux-x86_64"
      sha256 "3acf2426b3d60655f51d59daa62f3290e8cc567bd5be02f6070f5af4bc6aad16"
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
