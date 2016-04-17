def bridge()
  x = 0
  volume = 0
  until x >= 75000
    volume += (Math::PI * ((43/6) ** 2) * (0.000112 * (x ** 2)))
    x += 600
  end
  volume *= 4
end

puts bridge()