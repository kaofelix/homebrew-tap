class Skulls < Formula
  desc "Dead simple skills installer"
  homepage "https://github.com/kaofelix/skulls"
  url "https://github.com/kaofelix/skulls/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "15faa2f919223b8d76f5a3a9771c37d725fa36e781d67f27ed1566d74aa5d514"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w", output: bin/"skulls"), "./cmd/skulls"
  end

  test do
    output = shell_output("#{bin}/skulls --help")
    assert_match "skulls", output
  end
end
