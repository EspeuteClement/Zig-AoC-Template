const std = @import("std");
const Allocator = std.mem.Allocator;
const List = std.ArrayList;
const Map = std.AutoHashMap;
const StrMap = std.StringHashMap;
const BitSet = std.DynamicBitSet;

const util = @import("util.zig");
const gpa = util.gpa;

const data = @embedFile("data/day01.txt");

pub fn main() !void {
    var it = split(u8, data, "\n");
    var current_count : u32 = 0;

    const top_count = 3;
    var top : [top_count]u32 = [_]u32{0} ** top_count;

    while (it.next()) |str| {
        if (str.len == 0) {
            for (top) |*curr_top| {
                if (curr_top.* < current_count) {
                    var swap = current_count;
                    current_count = curr_top.*;
                    curr_top.* = swap;
                }
            }
            current_count = 0;
        }
        else {
            current_count += try parseInt(u32, str, 10);
        }
    }

    print("The max calorie is : {d}\n", .{top[0]});
    var sum41 : u32 = 0;
    for (top) |val| sum41 += val;
    print("The count of the top {d} calories is {d}\n", .{top_count, sum41});
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
