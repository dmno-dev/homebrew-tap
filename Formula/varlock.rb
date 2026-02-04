
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.1.6"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "109a9156af915a1bc610a35a683f310f1fb92445b235b9192a00bb35874a63fc"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "f94fe303d48cc76e40494c273c35e002c5e977d7b51ad3d38fe28b9532460ae4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "11972e1af52971dc354bd51b6ac7d049170178ac507df8a49039fd98b530f140"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "e74e27a0e51cc756441beebb112d3de68a0a62a46c63375a9edd23a2f37430ff"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.1.6", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
