class Todo < Formula
  desc "Project-embedded interactive todo system for developers"
  homepage "https://github.com/bagadi-alnour/todo-cli"
  url "https://github.com/bagadi-alnour/todo-cli/archive/refs/tags/v0.1.3.tar.gz"
  sha256 "613c9aa4d6169713ad7aa53991fa7da9f27ffdc5cbc15043b301b8ba5b26e12c"
  license "MIT"
  head "https://github.com/bagadi-alnour/todo-cli.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w -X github.com/bagadi-alnour/todo-cli/internal/cmd.Version=#{version}"), "./cmd/todo"
  end

  test do
    assert_match "Project-embedded interactive todo system", shell_output("#{bin}/todo --help")
    
    # Test init command
    system "#{bin}/todo", "init"
    assert_predicate testpath/".todos/todos.json", :exist?
  end
end
