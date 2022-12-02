const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day02.txt");

pub fn dist(them:u8, ours:u8) i8 {
    const ti = @intCast(i8, them);
    const oi = @intCast(i8, ours);
    const d = @mod(ti - oi, 3);

    return @mod(2 * d, 3) - d;
}

pub fn main() !void {
    var lines = tokenize(u8, data, "\n");
    var score : u32 = 0;

    while (lines.next()) |line| {
        const them = line[0] - 'A';
        const ours = line[2] - 'X';


        const res = dist(them, ours);

        const tmpScore = @intCast(u8,(1-res) * 3) + ours + 1;
        score += tmpScore;

        print("{d}, {d} -> {d} => {d}\n", .{them, ours, res, tmpScore});

    }

    print("First awnser : {d}", .{score});
}

test {
    try std.testing.expectEqual(dist(0,0), 0);
    try std.testing.expectEqual(dist(1,0), 1);
    try std.testing.expectEqual(dist(0,1), -1);

    try std.testing.expectEqual(dist(2,2), 0);
    try std.testing.expectEqual(dist(2,0), 1);
}

// Useful stdlib functions
const tokenize = std.mem.tokenize;
const split = std.mem.split;
const indexOf = std.mem.indexOfScalar;
const indexOfAny = std.mem.indexOfAny;
const indexOfStr = std.mem.indexOfPosLinear;
const lastIndexOf = std.mem.lastIndexOfScalar;
const lastIndexOfAny = std.mem.lastIndexOfAny;
const lastIndexOfStr = std.mem.lastIndexOfLinear;
const trim = std.mem.trim;
const sliceMin = std.mem.min;
const sliceMax = std.mem.max;

const parseInt = std.fmt.parseInt;
const parseFloat = std.fmt.parseFloat;

const min = std.math.min;
const min3 = std.math.min3;
const max = std.math.max;
const max3 = std.math.max3;

const print = std.debug.print;
const assert = std.debug.assert;

const sort = std.sort.sort;
const asc = std.sort.asc;
const desc = std.sort.desc;

// Generated from template/template.zig.
// Run `zig build generate` to update.
// Only unmodified days will be updated.
