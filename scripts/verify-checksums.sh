#!/bin/bash

# Script to verify binary checksums
# Usage: ./verify-checksums.sh [directory]

set -e

BINARY_DIR="${1:-.}"
CHECKSUM_FILE="$BINARY_DIR/SHA256SUMS.txt"

echo "Verifying binary checksums in: $BINARY_DIR"
echo "=========================================="

if [ ! -f "$CHECKSUM_FILE" ]; then
    echo "Error: Checksum file not found: $CHECKSUM_FILE"
    exit 1
fi

cd "$BINARY_DIR"

echo ""
echo "Checksum file found: $CHECKSUM_FILE"
echo ""

# Verify checksums
if command -v sha256sum &> /dev/null; then
    if sha256sum -c SHA256SUMS.txt; then
        echo ""
        echo "✓ All checksums verified successfully!"
        exit 0
    else
        echo ""
        echo "✗ Checksum verification failed!"
        exit 1
    fi
elif command -v shasum &> /dev/null; then
    if shasum -a 256 -c SHA256SUMS.txt; then
        echo ""
        echo "✓ All checksums verified successfully!"
        exit 0
    else
        echo ""
        echo "✗ Checksum verification failed!"
        exit 1
    fi
else
    echo "Error: Neither sha256sum nor shasum command found"
    exit 1
fi
