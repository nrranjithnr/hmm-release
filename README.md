# hmm-release

This repository hosts the official pre-built binaries for [hmm](https://github.com/nrranjithnr/hmm), a cross-platform command-line tool.

## Releases

- Download official `hmm` binaries from the [Releases](https://github.com/nrranjithnr/hmm-release/releases) section.
- Each release includes platform-specific downloads (macOS, etc).

---

## Download & Install (macOS Example)

1. Download the latest macOS binary from [Releases](https://github.com/nrranjithnr/hmm-release/releases):

    ```sh
    curl -LO https://github.com/nrranjithnr/hmm-release/releases/download/vX.Y.Z/hmm-macos-x86_64
    ```

2. Make it executable:

    ```sh
    chmod +x hmm-macos-x86_64
    ```

3. Move it to your `PATH` (e.g., `/usr/local/bin`):

    ```sh
    sudo mv hmm-macos-x86_64 /usr/local/bin/hmm
    ```

4. Confirm installation:

    ```sh
    hmm --help
    ```

_Replace `vX.Y.Z` with the desired version._

---

## Usage & Onboarding

```sh
hmm start
```
> This launches the hmm backend. You’ll see a message when the server is ready also brings up a browser UI, where you can easily onboard tools.


---


For more information, see the [hmm documentation](https://github.com/nrranjithnr/hmm#readme).

---

## Contributing

- This repository is for binary releases only.
- To contribute code, visit [nrranjithnr/hmm](https://github.com/nrranjithnr/hmm).
- For issues with binaries or releases, open an issue in [Issues](https://github.com/nrranjithnr/hmm-release/issues).

## License

Refer to the [LICENSE](./LICENSE) file or the main [hmm](https://github.com/nrranjithnr/hmm) repository for license information.

---

**Maintained by [@nrranjithnr](https://github.com/nrranjithnr)**
