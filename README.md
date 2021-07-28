# BaseHangul

[![Build Status](https://travis-ci.org/yous/basehangul-crystal.svg?branch=master)](https://travis-ci.org/yous/basehangul-crystal)

Human-readable binary encoding, [BaseHangul](https://basehangul.github.io) for [Crystal](http://crystal-lang.org).

## Installation

1. Add the dependency to your `shard.yml`:

   ``` yaml
   dependencies:
    basehangul:
      github: yous/basehangul-crystal
   ```

2. Run `shards install`

## Usage

``` crystal
require "basehangul"
```

``` crystal
BaseHangul.encode("This is an encoded string")
# => "넥라똔먈늴멥갯놓궂뗐밸뮤뉴뗐뀄굡덜멂똑뚤"
```

## Contributing

1. Fork it (<https://github.com/yous/basehangul-crystal/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

Copyright &copy; Chayoung You. See [LICENSE.txt](LICENSE.txt) for further details.
