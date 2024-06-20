// AUTHOR: Rohan Vashisht
// Library: Morse code generator (only for Zig).
// This library provides different functionalities for
// managing morse code in zig programming language.

const std = @import("std");
// declare the allocator I will use forever

// A declared non-global hashmap for string.

// TODO:
// fn get_morse_for_chars(prov_string: []const u8) ![]const u8 {
//     var res = "";
//     for (prov_string) |value| {
//         var character_upper = std.ascii.toUpper(value);
//         var z = [_]u8{character_upper};
//         var vale = my_hash_map.get(&z);
//         if (vale) |vel| {
//             var dz = [_][]const u8{ res, vel };
//             res = try std.mem.concat(std.heap.page_allocator, u8, &dz);
//         } else {
//             res = try comptime std.fmt.allocPrint(std.heap.page_allocator, res, "XX"); // return this if unknown symbol found
//         }
//     }
// }

/// # Takes input as u8, outputs morse code as []const u8.
/// `returns XX if unknown character is passed.`
///
/// `Example usage:`
/// ```zig
/// const std = @import("std");
/// const morse = @import("morse.zig");
///
/// pub fn main() !void {
///     try morse.init();
///     var a_morse = morse.get_morse_from_char('A');
///     std.debug.print("Morse code for a is: {s} \n", .{a_morse});
/// }
/// ```
pub fn get_morse_from_char(character: u8) ![]const u8 {
    const character_upper = std.ascii.toUpper(character); // because dictionary only has upper case chars // converted u8 to []const u8 because dictionary only has []const u8
    const vals = try getHashMap(); // finding the value from the hash map
    const val = vals.get(character_upper);
    if (val) |value| { // checking if value was found in hashmap or not
        return value; // returned the value if found
    } else { // if not found:
        return "XX"; // return XX if unknown symbol found
    }
    return "XX"; // unreachable code (dead code) whatever you call it!!!
}

// pub fn get_char_from_morse(morse_chars: u8) u8 {
//     getHashMap().iterator();
// }

fn getHashMap() !std.AutoHashMap(u8, []const u8) {
    const allocator = std.heap.page_allocator;
    var morse_hash_map = std.AutoHashMap(u8, []const u8).init(allocator);
    defer morse_hash_map.deinit();
    try morse_hash_map.put('A', ".-");
    try morse_hash_map.put('B', "-...");
    try morse_hash_map.put('C', "-.-.");
    try morse_hash_map.put('D', "-..");
    try morse_hash_map.put('E', ".");
    try morse_hash_map.put('F', "..-.");
    try morse_hash_map.put('G', "--.");
    try morse_hash_map.put('H', "....");
    try morse_hash_map.put('I', "..");
    try morse_hash_map.put('J', ".---");
    try morse_hash_map.put('K', "-.-");
    try morse_hash_map.put('L', ".-..");
    try morse_hash_map.put('M', "--");
    try morse_hash_map.put('N', "-.");
    try morse_hash_map.put('O', "---");
    try morse_hash_map.put('P', ".--.");
    try morse_hash_map.put('Q', "--.-");
    try morse_hash_map.put('R', ".-.");
    try morse_hash_map.put('S', "...");
    try morse_hash_map.put('T', "-");
    try morse_hash_map.put('U', "..-");
    try morse_hash_map.put('V', "...-");
    try morse_hash_map.put('W', ".--");
    try morse_hash_map.put('X', "-..-");
    try morse_hash_map.put('Y', "-.--");
    try morse_hash_map.put('Z', "--..");
    try morse_hash_map.put('0', "-----");
    try morse_hash_map.put('1', ".----");
    try morse_hash_map.put('2', "..---");
    try morse_hash_map.put('3', "...--");
    try morse_hash_map.put('4', "....-");
    try morse_hash_map.put('5', ".....");
    try morse_hash_map.put('6', "-....");
    try morse_hash_map.put('7', "--...");
    try morse_hash_map.put('8', "---..");
    try morse_hash_map.put('9', "----.");
    try morse_hash_map.put('.', ".-.-.-");
    try morse_hash_map.put(',', "--..--");
    try morse_hash_map.put('?', "..--..");
    try morse_hash_map.put('\'', ".----.");
    try morse_hash_map.put('!', "-.-.--");
    try morse_hash_map.put('/', "-..-.");
    try morse_hash_map.put('(', "-.--.");
    try morse_hash_map.put(')', "-.--.-");
    try morse_hash_map.put('&', ".-...");
    try morse_hash_map.put(',', "---...");
    try morse_hash_map.put(';', "-.-.-.");
    try morse_hash_map.put('=', "-...-");
    try morse_hash_map.put('+', ".-.-.");
    try morse_hash_map.put('-', "-....-");
    try morse_hash_map.put('_', "..--.-");
    try morse_hash_map.put('\"', ".-..-.");
    try morse_hash_map.put('$', "...-..-");
    try morse_hash_map.put('@', ".--.-.");
    try morse_hash_map.put(' ', "/");
    return morse_hash_map;
}

test "morse" {
    const x = try get_morse_from_char('X');
    std.debug.print("{s}", .{x});
}
