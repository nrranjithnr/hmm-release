# Repository Structure

This document describes the structure and organization of the hmm-release repository.

## Directory Layout

```
hmm-release/
├── .gitignore              # Git ignore patterns
├── CHANGELOG.md            # Version history and release notes
├── CONTRIBUTING.md         # Contribution guidelines for releases
├── LICENSE                 # MIT License
├── README.md              # Main documentation
├── RELEASE_GUIDE.md       # Detailed release process guide
├── STRUCTURE.md           # This file
└── scripts/               # Helper scripts for release management
    ├── README.md          # Scripts documentation
    ├── generate-checksums.sh  # Generate SHA256 checksums
    └── verify-checksums.sh    # Verify binary checksums
```

## File Purposes

### Documentation Files

- **README.md**: Main entry point for users, explains how to download and install binaries
- **CHANGELOG.md**: Documents all releases and changes over time
- **CONTRIBUTING.md**: Guidelines for maintainers creating releases
- **RELEASE_GUIDE.md**: Step-by-step instructions for creating releases
- **LICENSE**: MIT license for the project

### Configuration Files

- **.gitignore**: Prevents committing temporary files, build artifacts, and OS-specific files

### Scripts

- **scripts/generate-checksums.sh**: Automates checksum generation for binaries
- **scripts/verify-checksums.sh**: Automates checksum verification

## Important Notes

### Binary Storage

**Binaries are NOT stored in the Git repository.** They are distributed exclusively through GitHub Releases.

- ✅ **DO**: Upload binaries as release assets on GitHub
- ❌ **DON'T**: Commit binaries to the Git repository

### GitHub Releases

All binary distributions happen via GitHub Releases:
- Each release is tagged with semantic versioning (e.g., `v1.0.0`)
- Binaries are attached as release assets
- Checksums are included for verification
- Release notes explain changes

### Supported Platforms

Release binaries should be provided for:
- Linux (amd64, arm64)
- macOS (amd64, arm64)
- Windows (amd64)

## Maintenance

This repository requires minimal maintenance:
1. Update CHANGELOG.md for each release
2. Upload new binaries via GitHub Releases
3. Keep documentation up-to-date
4. Respond to download/installation issues
