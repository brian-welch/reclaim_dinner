

def test
  p "test"
end

def start_working

  ## codes fancy status message

emoji_array = %w[🍏 🍎 🍐 🍊 🍋 🍌 🍉 🍇 🍓 🍈 🍒 🍑 🍍 🥭 🥥 🥝 🍅 🍆 🥑 🥦 🥒 🥬 🌽 🥕 🥔 🍠 🥐 🍞 🥖 🥨 🥯 🧀 🍳 🥞 🥓 🥩 🍗 🍖 🌭 🍔 🍟 🍕 🥪 🥙 🌮 🌯 🥗 🥘 🥫 🍝 🍜 🍲 🍛 🍣 🍱 🥟 🍤 🍙 🍚 🍘 🍥 🥮 🥠 🍢 🍡 🍧 🍨 🍦 🥧 🍰 🎂 🍮 🍭 🍬 🍫 🍿 🧂 🍩 🍪 🌰 🥜 🍯 🥛 🍼 ☕️ 🍵 🥤 🍶 🍺 🍻 🥂 🍷 🥃 🍸 🍹 🍾 🥄 🍴 🍽 🥣 🥡]


  wave = Enumerator.new do |e|
    loop do
      e.yield "    #{emoji_array[(rand(0..emoji_array.size))]} Working: "
    end
  end

  ## initiating facy status message
  progress = Thread.new do
    loop do
      printf("\r%s", wave.next)
      sleep(0.3)
    end
  end


end
