
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.15"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a050cf11e1c8c30b103a69059590251c7f160c19b110fdba9ba527a4c20fc577"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "944dbe59f4c2f5d430790b96f4b92c4e3de305db29e7275cb4ead3835cf44dc9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "4106f44d44156ff7b860f243008e7449fb459265f82daf8a2b68a8f049fd9c09"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "aa8d8daec5c1cb4f20391fc13e08fee61be74e3924dcaf3058c9664ddfc4108e"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.15", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
