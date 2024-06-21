const std = @import("std");
const eql = std.mem.eql;

pub fn char_to_morse(key: u8) []const u8 {
    return if (key == 'A') ".-" else if (key == 'B') "-..." else if (key == 'C') "-.-." else if (key == 'D') "-.." else if (key == 'E') "." else if (key == 'F') "..-." else if (key == 'G') "--." else if (key == 'H') "...." else if (key == 'I') ".." else if (key == 'J') ".---" else if (key == 'K') "-.-" else if (key == 'L') ".-.." else if (key == 'M') "--" else if (key == 'N') "-." else if (key == 'O') "---" else if (key == 'P') ".--." else if (key == 'Q') "--.-" else if (key == 'R') ".-." else if (key == 'S') "..." else if (key == 'T') "-" else if (key == 'U') "..-" else if (key == 'V') "...-" else if (key == 'W') ".--" else if (key == 'X') "-..-" else if (key == 'Y') "-.--" else if (key == 'Z') "--.." else if (key == '0') "-----" else if (key == '1') ".----" else if (key == '2') "..---" else if (key == '3') "...--" else if (key == '4') "....-" else if (key == '5') "....." else if (key == '6') "-...." else if (key == '7') "--..." else if (key == '8') "---.." else if (key == '9') "----." else if (key == '.') ".-.-.-" else if (key == ',') "--..--" else if (key == '?') "..--.." else if (key == '\'') ".----." else if (key == '!') "-.-.--" else if (key == '/') "-..-." else if (key == '(') "-.--." else if (key == ')') "-.--.-" else if (key == '&') ".-..." else if (key == ':') "---..." else if (key == ';') "-.-.-." else if (key == '=') "-...-" else if (key == '+') ".-.-." else if (key == '-') "-....-" else if (key == '_') "..--.-" else if (key == '\"') ".-..-." else if (key == '$') "...-..-" else if (key == '@') ".--.-." else if (key == ' ') "/" else "§";
}

pub fn morse_to_char(key: []const u8) u8 {
    return if (eql(u8, key, ".-")) 'A' else if (eql(u8, key, "-...")) 'B' else if (eql(u8, key, "-.-.")) 'C' else if (eql(u8, key, "-..")) 'D' else if (eql(u8, key, ".")) 'E' else if (eql(u8, key, "..-.")) 'F' else if (eql(u8, key, "--.")) 'G' else if (eql(u8, key, "....")) 'H' else if (eql(u8, key, "..")) 'I' else if (eql(u8, key, ".---")) 'J' else if (eql(u8, key, "-.-")) 'K' else if (eql(u8, key, ".-..")) 'L' else if (eql(u8, key, "--")) 'M' else if (eql(u8, key, "-.")) 'N' else if (eql(u8, key, "---")) 'O' else if (eql(u8, key, ".--.")) 'P' else if (eql(u8, key, "--.-")) 'Q' else if (eql(u8, key, ".-.")) 'R' else if (eql(u8, key, "...")) 'S' else if (eql(u8, key, "-")) 'T' else if (eql(u8, key, "..-")) 'U' else if (eql(u8, key, "...-")) 'V' else if (eql(u8, key, ".--")) 'W' else if (eql(u8, key, "-..-")) 'X' else if (eql(u8, key, "-.--")) 'Y' else if (eql(u8, key, "--..")) 'Z' else if (eql(u8, key, "-----")) '0' else if (eql(u8, key, ".----")) '1' else if (eql(u8, key, "..---")) '2' else if (eql(u8, key, "...--")) '3' else if (eql(u8, key, "....-")) '4' else if (eql(u8, key, ".....")) '5' else if (eql(u8, key, "-....")) '6' else if (eql(u8, key, "--...")) '7' else if (eql(u8, key, "---..")) '8' else if (eql(u8, key, "----.")) '9' else if (eql(u8, key, ".-.-.-")) '.' else if (eql(u8, key, "--..--")) ',' else if (eql(u8, key, "..--..")) '?' else if (eql(u8, key, ".----.")) '\'' else if (eql(u8, key, "-.-.--")) '!' else if (eql(u8, key, "-..-.")) '/' else if (eql(u8, key, "-.--.")) '(' else if (eql(u8, key, "-.--.-")) ')' else if (eql(u8, key, ".-...")) '&' else if (eql(u8, key, "---...")) ':' else if (eql(u8, key, "-.-.-.")) ';' else if (eql(u8, key, "-...-")) '=' else if (eql(u8, key, ".-.-.")) '+' else if (eql(u8, key, "-....-")) '-' else if (eql(u8, key, "..--.-")) '_' else if (eql(u8, key, ".-..-.")) '\"' else if (eql(u8, key, "...-..-")) '$' else if (eql(u8, key, ".--.-.")) '@' else if (eql(u8, key, "/")) ' ' else '§';
}

pub fn morse_to_string(allocator: std.mem.Allocator, string_of_keys: []const u8, delimiter: []const u8) ![]const u8 {
    var it = std.mem.split(u8, string_of_keys, delimiter);
    var list = std.ArrayList(u8).init(allocator);
    errdefer list.deinit();
    while (it.next()) |morse| try list.append(morse_to_char(morse));
    return list.toOwnedSlice();
}

pub fn string_to_morse(allocator: std.mem.Allocator, string_of_keys: []const u8) ![]const u8 {
    var list = std.ArrayList(u8).init(allocator);
    errdefer list.deinit();
    for(string_of_keys)|v|{
        for(char_to_morse(v))|f| try list.append(f);
        try list.append(' ');
    }
    return list.toOwnedSlice();
}

test "morse" {
    const y = char_to_morse('X');
    const x = morse_to_char(".-");
    const asdf = try morse_to_string(std.heap.page_allocator, ".- .- .- .-", " ");
    const f = try string_to_morse(std.heap.page_allocator, "HELLO±");
    std.debug.print("this: {s} ok;{s} \n\n {s}\n", .{ y, asdf, f });
    std.debug.print("{}\n", .{x});
}
