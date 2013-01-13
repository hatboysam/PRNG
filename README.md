# Pseudo Random Number Generator (PRNG)

### What's this?
It's a Pseudo-random number implemented in Haskell.  The algorithms are taken from a <a href="http://preshing.com/20121224/how-to-generate-a-sequence-of-unique-random-integers">this blog post</a> from the blog Preshing on Programming.

### Why another random number generator?
Assuming my implementation is correct, and that you believe the details of the blog post, this RNG can be guaranteed to produce incredibly long sequences of 32-bit random Ints without any duplicates (pretty cool, right?).

### How do I use it?
The type PRandomGen is an instance of RandomGen from System.Random, so you use it just like the StdGen class.

### Has it been tested?
Nope, I wrote this in an hour.  Sorry.
