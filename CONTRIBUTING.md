# Contributing to hmm-release

Thank you for your interest in contributing to the hmm release repository!

## Repository Purpose

This repository is dedicated to **hosting release binaries only**. The source code development happens in the main hmm project repository. This repository serves as a distribution point for pre-compiled binaries.

## Release Process

### For Maintainers

1. **Build Binaries**: Build the hmm CLI for all supported platforms
2. **Create Release**: Use GitHub Releases to publish a new version
3. **Upload Binaries**: Attach the compiled binaries to the release
4. **Update Changelog**: Update CHANGELOG.md with release notes
5. **Generate Checksums**: Include SHA256 checksums for verification

### Supported Platforms

When creating a release, ensure binaries are built for:
- Linux (amd64, arm64)
- macOS (amd64/Intel, arm64/Apple Silicon)
- Windows (amd64)

### Binary Naming Convention

Use the following naming convention for binaries:
```
hmm-{os}-{arch}[.exe]
```

Examples:
- `hmm-linux-amd64`
- `hmm-linux-arm64`
- `hmm-darwin-amd64`
- `hmm-darwin-arm64`
- `hmm-windows-amd64.exe`

### Version Tags

Use semantic versioning for tags:
```
v{major}.{minor}.{patch}
```

Examples: `v1.0.0`, `v1.2.3`, `v2.0.0-beta.1`

### Checksum Generation

Generate SHA256 checksums for all binaries:

```bash
# Linux/macOS
shasum -a 256 hmm-* > checksums.txt

# Or using sha256sum
sha256sum hmm-* > checksums.txt
```

Include the `checksums.txt` file with each release.

## Reporting Issues

If you encounter issues with:
- **The hmm CLI tool itself**: Report to the main hmm project repository
- **Download or installation problems**: Open an issue in this repository
- **Security vulnerabilities**: Please report privately to the maintainers

## Questions?

For questions about the release process or this repository, please open an issue.
