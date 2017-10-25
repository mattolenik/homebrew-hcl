class Hclq < Formula
  desc 'Small tool for querying and modifying HCL files, similar to jq'
  homepage 'https://github.com/mattolenik/hclq'
  url 'https://github.com/mattolenik/hclq.git', :tag => '0.1.1'

  depends_on 'go'
  depends_on 'dep'

  def install
    gopath = buildpath/'go'
    src = gopath/'src/github.com/mattolenik'
    mkdir_p src
    ln_sf buildpath, src/'hclq'

    ENV['GOPATH'] = gopath
    system 'sh', '-c', "cd #{src/'hclq'} && make brew"
    bin.install src/'hclq/dist/hclq'
  end

  test do
    assert_equal 'true', pipe_output("#{bin}/hclq get test", 'test = true')
  end
end
