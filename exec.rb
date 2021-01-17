#exec.rb
executable_binary_code = File.open(ARGV[0], 'r').readlines.join('')
compiled_instruction_sequence = RubyVM::InstructionSequence.load_from_binary(executable_binary_code)
compiled_instruction_sequence.eval
