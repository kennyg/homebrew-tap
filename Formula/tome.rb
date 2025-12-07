class Tome < Formula
  desc "AI Agent Skill Manager - Your spellbook for AI agent capabilities"
  homepage "https://github.com/kennyg/tome"
  url "https://github.com/kennyg/tome/archive/refs/tags/v0.5.2.tar.gz"
  sha256 "df17b58f3e9ca88e08f3a0591442182dfd0bc24520409a9cb47bfe5469076dc8"
  license "MIT"
  head "https://github.com/kennyg/tome.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/kennyg/tome/cmd.Version=#{version}
    ]
    system "go", "build", *std_go_args(ldflags:)
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tome edition")
  end
end
