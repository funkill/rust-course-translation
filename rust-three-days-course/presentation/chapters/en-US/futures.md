# Futures

[Table of Contents](toc/english.html)

---

The crate [`futures-rs`](https://github.com/alexcrichton/futures-rs) is commonly used to build asyncronous functionality. It provides constructs similar to `Promise`s in Javascript.

---

## Notes on performance and usability

* Rust does not have an implicit runtime event loop like Node.js.
  + Tokio provides an explicit one.
* Futures are a zero-cost abstraction.
* The documentation for `futures-rs` is regarded as 'not good'.
* The async ecosystem is still very young. Be patient!

---

## You've got oneshot

`futures::sync::oneshot` provides a basic, single use future.

They feel like a channel to use, even coming with a `tx` and `rx` pair.

---

## You've got oneshot

<pre><code data-source="chapters/shared/code/futures/1.rs" data-trim="hljs rust" class="lang-rust"></code></pre>

---

## You've got oneshot

What happens if we swap the `rx.wait()` and the `tx.send()`?

There is **no** implicit threading, calling `rx.wait()` blocks the thread until data is received!

---

## You've got oneshot (threads)

<pre><code data-source="chapters/shared/code/futures/2.rs" data-trim="hljs rust" class="lang-rust"></code></pre>

---

## Multiple oneshots

<pre><code data-source="chapters/shared/code/futures/3.rs" data-trim="hljs rust" class="lang-rust"></code></pre>

---

## 57 channels (and nothing on)

An `futures::sync::mpsc` represents a channel that will yield a series of futures.

`mpsc::channel` has a bounded buffer size, and is concerned with back pressure.

`mpsc::unbounded` has no bounded size, and can grow to fit all of memory.

---

## 57 channels (and nothing on)

<pre><code data-source="chapters/shared/code/futures/4.rs" data-trim="hljs rust" class="lang-rust"></code></pre>

---

## Toes in the CPU pool

`futures-rs` comes with [`futures_cpupool`](https://docs.rs/futures-cpupool/0.1.7/futures_cpupool/) which provides a simple, easy to use CPU Pool type.

This allows for us to dispatch arbitrary (heterogeneous!) jobs to a pool without worrying about where (and when) it gets executed.

---

## Toes in the CPU pool

<pre><code data-source="chapters/shared/code/futures/5.rs" data-trim="hljs rust" class="lang-rust"></code></pre>

---

## Interacting with futures

Most of the times you will not be creating raw futures and sending them around.

Instead, you'll likely end up interacting with them as part of a crate.

Worry more about how to handle them, and work with them, than how to create and execute them.
