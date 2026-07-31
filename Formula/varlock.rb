
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.15.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "eb05d87e47a65b923ccfd004b84fb16cb5c71a6cc6be843e6da1a08e87389c34"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "8e031fe87065bba0f2e82d2a6dc8771761b710961297f5088ecff119a0cfc86f"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "6e6982a0fa552a93489c1c08c7a229c20f2cb02fcca75f3512aa7f47086898db"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "c5a986f37c0ee1ad41c1d3646b636d3d1f3f5730901a19579cacdbe17c2e9c5f"
    end
  end

  def install
    bin.install "varlock"

    on_macos do
      libexec.install "VarlockEnclave.app"
    end

    on_linux do
      libexec.install "varlock-local-encrypt"
    end
  end

  test do
    assert_equal "1.15.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
