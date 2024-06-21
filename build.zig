const std = @import("std");

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib_unit_tests = b.addTest(.{
        .root_source_file = b.path("src/zorsig.zig"),
        .target = target,
        .optimize = optimize,
    });

    const morse_module = b.addModule("zorsig", .{
        .root_source_file = b.path("src/zorsig.zig"),
        .target = target,
        .optimize = optimize,
    });
    try b.modules.put(b.dupe("zorsig"), morse_module);

    const run_lib_unit_tests = b.addRunArtifact(lib_unit_tests);
    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&run_lib_unit_tests.step);
}
