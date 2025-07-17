
class Varlock < Formula
  desc "varlock is a tool to load and validate .env files"
  homepage "https://varlock.dev"
  # ! the version number in this file is fetched and used by our install.sh script
  version "@varlock/nextjs-integration@0.0.3"

  on_macos do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-x64.tar.gz"
      sha256 "c110e8b7e0e1ee761385cd1919ad827482021b07c376be6832401c80d211126d"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-macos-arm64.tar.gz"
      sha256 "5a03b836a9a18bfdc0bd48e1b57fa40f1bdb6052ecdf5a08d94fc4e42c51c2c2"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-x64.tar.gz"
      sha256 "a2ad6bd397161bb22c530b5016ffb5e289ac3a21c301a893a04f407ee767dd37"
    end

    on_arm do
      url "https://github.com/dmno-dev/varlock/releases/download/varlock@#{version}/varlock-linux-arm64.tar.gz"
      sha256 "66c22bd72fbc5264721b3baa91d8b9540b6095a88a75ba20635d23a2cdede611"
    end
  end

  def install
    bin.install "varlock"
  end

  test do
    system bin/"varlock", "--post-install", "brew"
  end
end
