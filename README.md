# Zorsig: a better morse library for Zig programming language

Features:
- minimum version of zig: 0.13.0
- Memory safe
- No allocators used
- High performance library

## How to use?
```zig
const std = @import("std");
const Morse = @import("./Morse.zig");
const print = std.debug.print;

pub fn main() void {
    const res1 = Morse.char_to_morse('A');
    print("{s}\n", .{res1});

    const res2 = Morse.morse_to_char(".-");
    print("{c}\n", .{res2});

    // No allocator
    var res3 = Morse.morse_to_string(".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--");

    while (res3.next()) |next_element| {
        print("{c}", .{next_element});
    }
    print("\n", .{});
    var res4 = Morse.string_to_morse("HELLO, WORLD!");

    while (res4.next()) |next_element| {
        print("{s} ", .{next_element});
    }
}
```
### Output:

<img width="1055" alt="Screenshot 2024-11-13 at 3 26 46 PM" src="https://github.com/user-attachments/assets/13efa6c4-c073-47ed-bfe1-05cb10fbfc9f">
