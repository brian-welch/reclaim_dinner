

def test
  p "test"
end

def start_working

  ## codes fancy status message
  wave = Enumerator.new do |e|
    loop do
      e.yield '🦄          Working: '
      e.yield ' 🦄         Working: '
      e.yield '  🦄        Working: '
      e.yield '   🦄       Working: '
      e.yield '    🦄      Working  '
      e.yield '     🦄     Working  '
      e.yield '      🦄    Working  '
      e.yield '       🦄   Working  '
      e.yield '        🦄  Working: '
      e.yield '         🦄 Working: '
      e.yield '        🦄  Working: '
      e.yield '       🦄   Working: '
      e.yield '      🦄    Working: '
      e.yield '     🦄     Working  '
      e.yield '    🦄      Working  '
      e.yield '   🦄       Working  '
      e.yield '  🦄        Working  '
      e.yield ' 🦄         Working  '
    end
  end

  ## initiating facy status message
  progress = Thread.new do
    loop do
      printf("\r%s", wave.next)
      sleep(0.05)
    end
  end


end
