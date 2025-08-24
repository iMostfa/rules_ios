## Bazel 8 Compatibility Release

This release adds full support for Bazel 8 while maintaining backward compatibility with Bazel 7.

### What's Changed
- 🔧 Fixed ObjcInfo provider compatibility for Bazel 8
- 🔧 Handled removal of AppleDynamicFramework provider in Bazel 8  
- 📦 Updated all dependencies to Bazel 8-compatible versions
- 🚀 Added runtime version detection utilities
- ✅ Updated CI to test with both Bazel 7 and 8
- 📖 Added Bazel 8 migration guide to README

### Breaking Changes
None - this release maintains backward compatibility with Bazel 7

### Compatibility
- **Bazel**: 7.0.0 - 8.0.0
- **Xcode**: 14.0+
- **macOS**: 12.0+

### Bzlmod Snippet

```bzl
bazel_dep(name = "rules_ios", version = "5.4.0-bazel8", repo_name = "build_bazel_rules_ios")
```

### Workspace Snippet

```bzl
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_ios",
    sha256 = "b1a0af3836113c7beb186be92745e19804f1defba418f659f629fb70ff497ed3",
    url = "https://github.com/iMostfa/rules_ios/releases/download/5.4.0-bazel8/rules_ios.5.4.0-bazel8.tar.gz",
)

load(
    "@build_bazel_rules_ios//rules:repositories.bzl",
    "rules_ios_dependencies"
)

rules_ios_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

load(
    "@com_google_protobuf//:protobuf_deps.bzl",
    "protobuf_deps",
)

protobuf_deps()
```

### Migration from Bazel 7 to Bazel 8

If you're upgrading from Bazel 7 to Bazel 8, update your dependencies in MODULE.bazel:
- `apple_support` to 1.21.1 or later
- `rules_cc` to 0.0.16 or later  
- `bazel_skylib` to 1.7.1 or later

See the [README](https://github.com/iMostfa/rules_ios#bazel-8-migration-guide) for detailed migration instructions.