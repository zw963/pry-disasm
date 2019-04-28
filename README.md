# PryDisasm [![Gem Version](https://badge.fury.io/rb/pry-disasm.svg)](http://badge.fury.io/rb/pry-disasm)

Pry plugin that take a `Method object` or `ruby code` string,  and returns a String with the human readable instructions(YARV bytecode) for it.

## Getting Started

Install via Rubygems

    $ gem install pry-disasm

  then add `require 'pry/disasm'` in your ruby code.

OR ...

Add to your Gemfile

    gem 'pry-disasm'

## Usage

See Instruction for a method

```rb
(pry):main(0)> def say_hello; puts 'hello'; end

=> :say_hello

(pry):main(0)> disasm method(:say_hello)

== disasm: #<ISeq:say_hello@(pry):1 (1,0)-(1,32)> (catch: FALSE)
0000 putself                                                          (   1)[LiCa]
0001 putstring                    "hello"
0003 opt_send_without_block       <callinfo!mid:puts, argc:1, FCALL|ARGS_SIMPLE>, <callcache>
0006 leave                        [Re]
```

see Instruction of a expression

```rb
(pry):main(0)> disasm '1 + 1'

== disasm: #<ISeq:<compiled>@<compiled>:1 (1,0)-(1,5)> (catch: FALSE)
0000 putobject_INT2FIX_1_                                             (   1)[Li]
0001 putobject_INT2FIX_1_
0002 opt_plus                     <callinfo!mid:+, argc:1, ARGS_SIMPLE>, <callcache>
0005 leave

```

## Support

  * MRI 1.9.3+

## Contributing

  * [Bug reports](https://github.com/zw963/pry-disasm/issues)
  * [Source](https://github.com/zw963/pry-disasm)

## license

Released under the MIT license, See [LICENSE](https://github.com/zw963/pry-disasm/blob/master/LICENSE) for details.
