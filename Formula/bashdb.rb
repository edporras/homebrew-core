class Bashdb < Formula
  desc "Bash shell debugger"
  homepage "https://bashdb.sourceforge.io"
  url "https://downloads.sourceforge.net/project/bashdb/bashdb/5.0-1.1.2/bashdb-5.0-1.1.2.tar.bz2"
  version "5.0-1.1.2"
  sha256 "30176d2ad28c5b00b2e2d21c5ea1aef8fbaf40a8f9d9f723c67c60531f3b7330"

  bottle do
    cellar :any_skip_relocation
    sha256 "0ab6de48ce871bc7b6abc582154b425350a70b7f2ecadd3b303c7a91dafc3c41" => :catalina
    sha256 "0ab6de48ce871bc7b6abc582154b425350a70b7f2ecadd3b303c7a91dafc3c41" => :mojave
    sha256 "0ab6de48ce871bc7b6abc582154b425350a70b7f2ecadd3b303c7a91dafc3c41" => :high_sierra
  end

  depends_on "bash"

  def install
    system "./configure", "--with-bash=#{HOMEBREW_PREFIX}/bin/bash",
                          "--disable-debug",
                          "--disable-dependency-tracking",
                          "--prefix=#{prefix}"

    system "make", "install"
  end

  test do
    assert_match version.to_s, pipe_output("#{bin}/bashdb --version 2>&1")
  end
end
