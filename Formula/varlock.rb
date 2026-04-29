
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.0.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "2e8ba91edeb6f10ec6603541100c579a8d9d52184a0b3e5b145014cf57011706"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "a656ac2bfca447edf94c7a6b21c1aca6f8980196a85950d460d2cfa657db6459"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "402598d4c43321f5f4da3bf78e89de284b7defd79473bf9dc2dde1d6729ff293"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "c2580307f586adcdbd5eb6e0c70a50e6b69fe70e4971ae95cfa3304a8633c449"
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
    assert_equal "1.0.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
