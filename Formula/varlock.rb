
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.5.0"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "c33a6df018ded31ff7945b7c7ae8b48e0ad2355a2a7b39e5c5c1236877e22525"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "356258184515bb327e9c5e53febabd3cb26600a5388edb0d95b94f41bb442809"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "a8cd5b0eec0085557316980fbb5e2a39a25eb98a6d531c607a5a911706c9ac3e"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "0be126bd3bbcd3398859e4d3ce604b75c894afd3219e22bd6734934ab2440a5a"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.5.0", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
