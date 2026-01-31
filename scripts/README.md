# Release Scripts

This directory contains helper scripts for managing hmm binary releases.

## Available Scripts

### generate-checksums.sh

Generates SHA256 checksums for all hmm binaries in a directory.

**Usage:**
```bash
# Generate checksums for binaries in current directory
./scripts/generate-checksums.sh

# Generate checksums for binaries in specific directory
./scripts/generate-checksums.sh /path/to/binaries
```

**Output:**
Creates a `SHA256SUMS.txt` file with checksums for all `hmm-*` binaries.

### verify-checksums.sh

Verifies binary checksums against the SHA256SUMS.txt file.

**Usage:**
```bash
# Verify checksums in current directory
./scripts/verify-checksums.sh

# Verify checksums in specific directory
./scripts/verify-checksums.sh /path/to/binaries
```

**Exit codes:**
- `0`: All checksums verified successfully
- `1`: Verification failed or error occurred

## Example Workflow

```bash
# 1. Build or download binaries to a directory
cd /path/to/binaries

# 2. Generate checksums
/path/to/hmm-release/scripts/generate-checksums.sh .

# 3. Verify the checksums
/path/to/hmm-release/scripts/verify-checksums.sh .

# 4. Upload binaries and SHA256SUMS.txt to GitHub Release
```

## Requirements

- Bash shell
- Either `sha256sum` (Linux) or `shasum` (macOS) command
