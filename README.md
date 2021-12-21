# Lorem

## Introduction

Lorem is a very simple nonsense Latin word generator. It is closely
modeled on the Text::Lorem generator available for Perl on
[Metacpan](https://metacpan.org/pod/Text::Lorem).

Generating sample content (for a website or other application) can be tedious,
and researchers have noted that using real language can cause issues, as the
reviewers tend to focus on the words instead of how the words or sections look.
By generating nonsense text, this problem is avoided.

## General Usage

Here is a typical (short) program:

```v
import lorem

fn main() {
    println(lorem.words(4))
    println(lorem.sentences(1))
    println(lorem.paragraphs(3))
}
```

## Required Compiler Version

The module and example programs were built with __V 0.2.4 75830f1__. We
cannot guarantee successful compilation with earlier versions.

## Contact

If you have ideas, questions, or criticisms, email me at
PowellDean@gmail.com

## Contributing??

Have a contribution? Pull requests are **ALWAYS** welcome!
