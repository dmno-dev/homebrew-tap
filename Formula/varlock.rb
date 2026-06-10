
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "1.6.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "a12ce0b9758dbf0a633f13e797323eba71af3164e19cf74f5b283ad7ef92b93a"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "7b001a73c4e777fe106f4d05490168ce4c6fe7f8415b95fd5d4fde74c0877255"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "96ccca146ebe5b14836c31c0ffde24febea6c11f20e314efa1e3456d35857c8c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "853c3ad9b0236fafa932964e6b7beeb8a26b1828f7fb3047b2725a1c8084ef13"
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
    assert_equal "1.6.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
