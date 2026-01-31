# Release Guide

This document provides detailed instructions for creating and managing releases of the hmm CLI tool.

## Prerequisites

- Write access to this repository
- Built binaries for all supported platforms
- Release notes prepared
- Version number decided (following semantic versioning)

## Step-by-Step Release Process

### 1. Prepare the Release

Ensure you have the following binaries ready:
- `hmm-linux-amd64`
- `hmm-linux-arm64`
- `hmm-darwin-amd64`
- `hmm-darwin-arm64`
- `hmm-windows-amd64.exe`

### 2. Generate Checksums

Create SHA256 checksums for verification:

```bash
# Generate checksums
sha256sum hmm-* > SHA256SUMS.txt

# Or on macOS
shasum -a 256 hmm-* > SHA256SUMS.txt
```

### 3. Update CHANGELOG

Edit `CHANGELOG.md` to document the changes in this release:

```markdown
## [X.Y.Z] - YYYY-MM-DD

### Added
- New features

### Changed
- Changes to existing features

### Fixed
- Bug fixes

### Security
- Security improvements
```

### 4. Create GitHub Release

1. Go to https://github.com/nrranjithnr/hmm-release/releases/new
2. Click "Draft a new release"
3. Create a new tag: `vX.Y.Z` (e.g., `v1.0.0`)
4. Set the release title: `hmm vX.Y.Z`
5. Add release notes (copy from CHANGELOG.md)
6. Upload all binary files and checksums
7. Mark as pre-release if applicable
8. Click "Publish release"

### 5. Verify the Release

After publishing:
1. Download a binary from the release page
2. Verify the checksum matches
3. Test the binary works correctly

```bash
# Download binary
wget https://github.com/nrranjithnr/hmm-release/releases/download/vX.Y.Z/hmm-linux-amd64

# Verify checksum
sha256sum hmm-linux-amd64
# Compare with SHA256SUMS.txt

# Test binary
chmod +x hmm-linux-amd64
./hmm-linux-amd64 --version
```

## Automated Release (Optional)

For automated releases, you can use GitHub Actions. Create `.github/workflows/release.yml`:

```yaml
name: Release

on:
  push:
    tags:
      - 'v*'

jobs:
  release:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      
      - name: Create Release
        uses: softprops/action-gh-release@v1
        with:
          files: |
            binaries/*
            SHA256SUMS.txt
          draft: false
          prerelease: false
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```

## Versioning Strategy

Follow [Semantic Versioning](https://semver.org/):

- **MAJOR** (X.0.0): Incompatible API changes
- **MINOR** (x.Y.0): New functionality (backward compatible)
- **PATCH** (x.y.Z): Bug fixes (backward compatible)

## Rollback Procedure

If a release has critical issues:

1. Delete the release (if just published)
2. Remove the tag: `git push --delete origin vX.Y.Z`
3. Fix the issues
4. Create a new patch release

## Communication

When releasing:
1. Update CHANGELOG.md
2. Create detailed release notes on GitHub
3. Announce in relevant channels (if applicable)

## Security Considerations

- Always verify checksums before uploading
- Sign binaries if possible (GPG signatures)
- Scan binaries for vulnerabilities before release
- Never commit binaries to the git repository
- Only attach binaries to GitHub Releases
