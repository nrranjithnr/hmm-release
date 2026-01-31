#!/bin/bash

# Script to generate SHA256 checksums for release binaries
# Usage: ./generate-checksums.sh [directory]

set -e

BINARY_DIR="${1:-.}"

echo "Generating SHA256 checksums for binaries in: $BINARY_DIR"
echo "================================================"

cd "$BINARY_DIR"

# Find all hmm binaries
BINARIES=$(find . -maxdepth 1 -type f -name "hmm-*" | sort)

if [ -z "$BINARIES" ]; then
    echo "Error: No binaries found matching pattern 'hmm-*'"
    exit 1
fi

# Generate checksums
CHECKSUM_FILE="SHA256SUMS.txt"

if command -v sha256sum &> /dev/null; then
    sha256sum hmm-* > "$CHECKSUM_FILE"
elif command -v shasum &> /dev/null; then
    shasum -a 256 hmm-* > "$CHECKSUM_FILE"
else
    echo "Error: Neither sha256sum nor shasum command found"
    exit 1
fi

echo ""
echo "Checksums generated successfully!"
echo "File: $CHECKSUM_FILE"
echo ""
echo "Contents:"
echo "--------"
cat "$CHECKSUM_FILE"
echo ""
echo "To verify a binary:"
echo "  sha256sum -c SHA256SUMS.txt"
