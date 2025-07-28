
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.6"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "33ab97d337b13cdbc6afd668ef67d1de91696b9f2cee0f372aea6b9c49e6fcb6"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "649845d34ac9a06c4fca970946f8d4a7d82a9ee96bebd63771a63048ba26846a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0952147924edc0427e19b34f86179afbf1a93329358c7ee9e975da42501d226f"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "fb9551dc6ccddb7b7a8c3a3fdd0db604d9c39df81c39e2cb0329dc661a37bec2"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.6", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
