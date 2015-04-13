file = 'example_response.txt'
new_file = 'parsed_response.txt'
buffer = ""
open = 0
File.readlines(file).each do |line|
  line.each_char do |char|
    if char == "<"
      open += 1
    end
    if char == ">" && buffer[-1,1] != "="
      open -= 1
    end
    if char == "{"
      open += 1
    end
    if char == "}"
      open -= 1
      unless buffer[-1,1] == "{"
        buffer += "\n"
        open.times do
          buffer += "\t"
        end
      end
    end
    if char == "@" && buffer[-1,1] == " "
      buffer += "\n"
      open.times do
        buffer += "\t"
      end
    end
    buffer += char
    if char == ","
      buffer += "\n"
      open.times do
        buffer += "\t"
      end
    end
    #puts buffer
  end
  File.write('parsed_response.txt', buffer, mode: 'w')
  #puts line
end