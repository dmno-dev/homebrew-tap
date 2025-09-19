
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "0.0.13"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "f7ffce30942513aee5fdb2ab703f485cf18a4319db7e7018cff25736ffacbb82"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "79db24652bcc1a2188ae4202e7d25d1cc6dd044f4cd3eed9e3442c832b4af91b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "0251684c8a4f272ccad377ca3073576db60cfc34f591db36a3d412972adbe352"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "834442f45125a40a4d48a40b1383c4dbdf0d0d30be6b0d51940a03b9e3c0c309"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    assert_equal "0.0.13", shell_output("#{bin}/varlock --post-install brew").strip
  end
end
