//! Name: Zorsig library
//! Author: Rohan Vashisht
//! Basic Library to:
//! - Convert characters to morse code string.
//! - Convert single morse code string to charcter.
//! - Convert strings of sentences to morse code strings.
//! - Convert morse code string sentences to strings of sentences.
//! Features:
//! - No memory allocation.
//! - High performance.

const std = @import("std");
const eql = std.mem.eql;

/// Convert characters to morse code string:
/// For example:
/// 'A' -> ".-"
/// ' ' -> "/"
/// returns § if character is unknown.
pub fn char_to_morse(key: u8) []const u8 {
    return if (key == 'A') ".-" else if (key == 'B') "-..." else if (key == 'C') "-.-." else if (key == 'D') "-.." else if (key == 'E') "." else if (key == 'F') "..-." else if (key == 'G') "--." else if (key == 'H') "...." else if (key == 'I') ".." else if (key == 'J') ".---" else if (key == 'K') "-.-" else if (key == 'L') ".-.." else if (key == 'M') "--" else if (key == 'N') "-." else if (key == 'O') "---" else if (key == 'P') ".--." else if (key == 'Q') "--.-" else if (key == 'R') ".-." else if (key == 'S') "..." else if (key == 'T') "-" else if (key == 'U') "..-" else if (key == 'V') "...-" else if (key == 'W') ".--" else if (key == 'X') "-..-" else if (key == 'Y') "-.--" else if (key == 'Z') "--.." else if (key == '0') "-----" else if (key == '1') ".----" else if (key == '2') "..---" else if (key == '3') "...--" else if (key == '4') "....-" else if (key == '5') "....." else if (key == '6') "-...." else if (key == '7') "--..." else if (key == '8') "---.." else if (key == '9') "----." else if (key == '.') ".-.-.-" else if (key == ',') "--..--" else if (key == '?') "..--.." else if (key == '\'') ".----." else if (key == '!') "-.-.--" else if (key == '/') "-..-." else if (key == '(') "-.--." else if (key == ')') "-.--.-" else if (key == '&') ".-..." else if (key == ':') "---..." else if (key == ';') "-.-.-." else if (key == '=') "-...-" else if (key == '+') ".-.-." else if (key == '-') "-....-" else if (key == '_') "..--.-" else if (key == '\"') ".-..-." else if (key == '$') "...-..-" else if (key == '@') ".--.-." else if (key == ' ') "/" else "§";
}

/// Convert single morse code string to charcter
/// For example:
/// ".-" -> 'A'
/// "/" -> ' '
pub fn morse_to_char(key: []const u8) u8 {
    return if (eql(u8, key, ".-")) 'A' else if (eql(u8, key, "-...")) 'B' else if (eql(u8, key, "-.-.")) 'C' else if (eql(u8, key, "-..")) 'D' else if (eql(u8, key, ".")) 'E' else if (eql(u8, key, "..-.")) 'F' else if (eql(u8, key, "--.")) 'G' else if (eql(u8, key, "....")) 'H' else if (eql(u8, key, "..")) 'I' else if (eql(u8, key, ".---")) 'J' else if (eql(u8, key, "-.-")) 'K' else if (eql(u8, key, ".-..")) 'L' else if (eql(u8, key, "--")) 'M' else if (eql(u8, key, "-.")) 'N' else if (eql(u8, key, "---")) 'O' else if (eql(u8, key, ".--.")) 'P' else if (eql(u8, key, "--.-")) 'Q' else if (eql(u8, key, ".-.")) 'R' else if (eql(u8, key, "...")) 'S' else if (eql(u8, key, "-")) 'T' else if (eql(u8, key, "..-")) 'U' else if (eql(u8, key, "...-")) 'V' else if (eql(u8, key, ".--")) 'W' else if (eql(u8, key, "-..-")) 'X' else if (eql(u8, key, "-.--")) 'Y' else if (eql(u8, key, "--..")) 'Z' else if (eql(u8, key, "-----")) '0' else if (eql(u8, key, ".----")) '1' else if (eql(u8, key, "..---")) '2' else if (eql(u8, key, "...--")) '3' else if (eql(u8, key, "....-")) '4' else if (eql(u8, key, ".....")) '5' else if (eql(u8, key, "-....")) '6' else if (eql(u8, key, "--...")) '7' else if (eql(u8, key, "---..")) '8' else if (eql(u8, key, "----.")) '9' else if (eql(u8, key, ".-.-.-")) '.' else if (eql(u8, key, "--..--")) ',' else if (eql(u8, key, "..--..")) '?' else if (eql(u8, key, ".----.")) '\'' else if (eql(u8, key, "-.-.--")) '!' else if (eql(u8, key, "-..-.")) '/' else if (eql(u8, key, "-.--.")) '(' else if (eql(u8, key, "-.--.-")) ')' else if (eql(u8, key, ".-...")) '&' else if (eql(u8, key, "---...")) ':' else if (eql(u8, key, "-.-.-.")) ';' else if (eql(u8, key, "-...-")) '=' else if (eql(u8, key, ".-.-.")) '+' else if (eql(u8, key, "-....-")) '-' else if (eql(u8, key, "..--.-")) '_' else if (eql(u8, key, ".-..-.")) '\"' else if (eql(u8, key, "...-..-")) '$' else if (eql(u8, key, ".--.-.")) '@' else if (eql(u8, key, "/")) ' ' else '§';
}

/// Convert strings of sentences to morse code strings.
/// For example:
/// "HELLO, WORLD!" -> Iterator(".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--")
pub fn morse_to_string(string_of_keys: []const u8) MorseToStringIterator {
    const splitted_string = std.mem.splitScalar(u8, string_of_keys, ' ');
    return MorseToStringIterator{ .buffer = splitted_string };
}

const MorseToStringIterator = struct {
    buffer: std.mem.SplitIterator(u8, .scalar),
    pub fn next(self: *MorseToStringIterator) ?u8 {
        if (self.buffer.next()) |nex_ele| {
            return morse_to_char(nex_ele);
        }
        return null;
    }
};

/// Convert morse code string sentences to strings of sentences.
/// For example:
/// ".... . .-.. .-.. --- --..-- / .-- --- .-. .-.. -.. -.-.--" -> Iterator("HELLO, WORLD!")
pub fn string_to_morse(string_of_characters: []const u8) StringToMorseIterator {
    return StringToMorseIterator{ .buffer = string_of_characters };
}

const StringToMorseIterator = struct {
    buffer: []const u8,
    count: u32 = 0,
    pub fn next(self: *StringToMorseIterator) ?[]const u8 {
        if (self.count < self.buffer.len) {
            const next_item = self.buffer[self.count];
            self.count += 1;
            return char_to_morse(next_item);
        } else {
            return null;
        }
    }
};
