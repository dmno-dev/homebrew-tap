
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.5.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "95dcdfe5ba9d29ac926c11c941d6329c5abb953e700d1f44e8c15f94a89e2c19"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "8de45ea71549a21ca5033958dc97806d65bd1e61d46709d982e3ff0c06beb1c1"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "c9c2a74a2a2b0ec8eb138ab58e73685714435d7beb0bce74e74bf6ab057719ae"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "f2b2df19b90c292548a8a19c556e13f3c38358e5ceb93b4986ad7662c8d6d87a"
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
    assert_equal "1.5.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
