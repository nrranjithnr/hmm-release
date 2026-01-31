# hmm-release

Official release repository for the **hmm** CLI tool.

## About

This repository hosts pre-built binary releases of the hmm CLI tool. Only release binaries are uploaded here and made available to the public for easy download and installation.

## Installation

### Quick Install

Download the latest release binary for your platform from the [Releases](https://github.com/nrranjithnr/hmm-release/releases) page.

### Manual Installation

1. Go to the [Releases](https://github.com/nrranjithnr/hmm-release/releases) page
2. Download the binary for your operating system and architecture:
   - `hmm-linux-amd64` - Linux (64-bit)
   - `hmm-linux-arm64` - Linux (ARM 64-bit)
   - `hmm-darwin-amd64` - macOS (Intel)
   - `hmm-darwin-arm64` - macOS (Apple Silicon)
   - `hmm-windows-amd64.exe` - Windows (64-bit)
3. Make the binary executable (Linux/macOS):
   ```bash
   chmod +x hmm-*
   ```
4. Move it to a directory in your PATH:
   ```bash
   sudo mv hmm-* /usr/local/bin/hmm
   ```

### Verify Installation

```bash
hmm --version
```

## Usage

After installation, you can use the `hmm` command. For detailed usage instructions, run:

```bash
hmm --help
```

## Releases

All releases are published on the [GitHub Releases](https://github.com/nrranjithnr/hmm-release/releases) page. Each release includes:

- Pre-compiled binaries for multiple platforms
- Release notes and changelog
- SHA256 checksums for verification

## License

See [LICENSE](LICENSE) file for details.

## Support

For issues, feature requests, or questions, please open an issue in the main hmm project repository.