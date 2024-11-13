# Zorsig: a better morse library for Zig programming language

Features:
- minimum version of zig: 0.13.0
- Memory safe
- No allocators used
- High performance library

## How to use?
```zig
const std = @import("std");
const Zorsig = @import("zorsig");
const print = std.debug.print;

pub fn main() void {
    const res1 = Zorsig.char_to_morse('A');
    print("{s}\n", .{res1});

    const res2 = Zorsig.morse_to_char(".-");
    print("{c}\n", .{res2});

    // No allocator
    var res3 = Zorsig.morse_to_string(".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--");

    while (res3.next()) |next_element| {
        print("{c}", .{next_element});
    }
    print("\n", .{});
    var res4 = Zorsig.string_to_morse("HELLO, WORLD!");

    while (res4.next()) |next_element| {
        print("{s} ", .{next_element});
    }
}
```
### Output:

<img width="1055" alt="Screenshot 2024-11-13 at 3 26 46 PM" src="https://github.com/user-attachments/assets/13efa6c4-c073-47ed-bfe1-05cb10fbfc9f">

## Get started:
**Run the following command in your terminal:**

```sh
zig fetch --save "https://github.com/RohanVashisht1234/zorsig/archive/refs/tags/v0.0.1.tar.gz"
```

**Add the following to your build.zig (just above the line `b.installArtifact(exe);`): **
```zig
const zorsig = b.dependency("zorsig", .{
    .target = target,
    .optimize = optimize,
});

exe.root_module.addImport("zorsig", zorsig.module("zorsig"));
```
## That's it, now use the Zorsig.
