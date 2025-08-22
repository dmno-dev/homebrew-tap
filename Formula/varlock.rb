
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.11"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "eee6619510dce37f5b88d667cc1f2f9441e7bb6b450c96d5161222edd4ba8552"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "fa153d248e77016c5a9454bd07777edc06ca1dcb52cc4ea266e85b180952a3df"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "e226901808d1957776e8b7fdb15dea1fe7b0f956bbe964ea3cf9f4468ebd9f6c"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "f0661a9277d56064fc23ea33fe184444a9ba0e005cc6e6fe2629a4683762c213"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.11", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
