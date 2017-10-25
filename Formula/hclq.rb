class Hclq < Formula
  desc 'Small tool for querying and modifying HCL files, similar to jq'
  homepage 'https://github.com/mattolenik/hclq'
  url 'https://github.com/mattolenik/hclq.git', :tag => '0.1.1'

  depends_on 'go'
  depends_on 'dep'

  def install
    src = 'src/github.com/mattolenik'
    mkdir_p buildpath/src
    ln_sf buildpath, buildpath/src/"hclq"

    ENV['GOPATH'] = buildpath
    Dir.chdir(buildpath/src)
    system 'make', 'brew'
    bin.install 'dist/hclq'
  end

  test do
    assert_equal 'true', pipe_output("#{bin}/hclq get test", 'test = true')
  end
end
