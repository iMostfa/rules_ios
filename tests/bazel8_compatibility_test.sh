#!/bin/bash
# Test script to verify Bazel 8 compatibility

set -e

echo "Testing Bazel 8 compatibility..."

# Check Bazel version
BAZEL_VERSION=$(bazel version | grep "Build label:" | cut -d' ' -f3)
echo "Bazel version: $BAZEL_VERSION"

# Test basic build
echo "Testing basic build with Bazel 8..."
bazel build //rules/... --check_direct_dependencies=off

# Test that provider compatibility works
echo "Testing provider compatibility..."
bazel test //tests:debug_process_infoplists_test --check_direct_dependencies=off

echo "✅ Bazel 8 compatibility test passed!"