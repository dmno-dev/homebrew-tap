
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.14.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "5641423a4ec9e87353d3c34deb663cea73784eecfc2bfb5ff53a8bae0c9fc570"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "d6c9cae4a578d35db21c45d66168dfc5c164b53f6f3530036cb529f1bdd3d036"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "83bd6e601a494bff2c56eafa2abd09683495239c92957cf6d8fd352c3a2314e8"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "ef9930ff6a87be3e2fb82b9c7166e878ee37dd4b5ad41fc87430677186c83978"
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
    assert_equal "1.14.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
