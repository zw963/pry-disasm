# frozen_string_literal: true

Pry::Commands.create_command "disasm" do
  description "Pry plugin that displays YARV bytecode for a method or expression. "
  command_options argument_required: true
  group 'Context'

  def process
    expr = eval(arg_string)
    str = RubyVM::InstructionSequence.disasm(expr) || RubyVM::InstructionSequence.new(expr).disasm

    lines = str.split("\n")
    # == disasm: <RubyVM::InstructionSequence:foo@(pry)>======================
    lines[0].gsub!(/=+/) { |s| text.green(s) }
    lines[0].gsub!(/<(.*?)@(.*?)>/) { '<' + colorize_code($1) + '@' + text.bold($2) + '>' }

    # 0000 trace            8                                               (   1)
    # 0002 trace            1
    # 0004 putobject        1
    # 0006 putobject        1
    # 0008 opt_plus         <ic:1>
    # 0010 trace            16
    # 0012 leave
    for i in 1..lines.length do
      lines[i] = colorize_code(lines[i]) # TODO: not the best way to do this
      lines[i].gsub!(/^(.*?)(\s+)(.*?)(\s+)/) { $1 + $2 + text.cyan($3) + $4 }
      lines[i].gsub!(/<(.*?):(.*?)>/) { '<' + text.bright_blue($1) + ':' + $2 + '>' }
    end

    puts lines.join("\n")
  end
end
