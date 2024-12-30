# Flamework Icon Generator

[![Flamework](./dist/svg/android_dark.svg)](https://flamework.org)

This repository contains the code and scripts to manage and generate icons for the entire project. The icons include circle, square, android and transparent designs and are exported in light and dark mode variantions and sizes for different use cases.

## Features

- Generate icons in **PNG** format.
- Support for multiple sizes: `16x16`, `32x32`, `48x48`, `64x64`, `128x128`, `256x256`, `512x512`, `1024x1024`.
- Separate output directories for each size and format.
- Easy-to-use script to manage updates and regeneration.

---

## Requirements

Before running the scripts, ensure you have the following installed:

1. **ImageMagick**:

   ```bash
   sudo apt update
   sudo apt install imagemagick
   ```

2. **Bash Shell**: Pre-installed on most Linux distributions.

---

## Steps to Change and Generate Icons

1. **Update the SVG Files**:
   - Place your updated SVG files in the src directory:
     - `light/icon.svg`: For light icons.
     - `dark/icon.svg`: For dark icons.

2. **Run the Script**:
   Execute the `generate.sh` script to generate icons:

   ```bash
   ./generate.sh
   ```

3. **Check the Output**:
   - Generated icons will be saved in the `dist` directory.
   - The directory structure will look like this:

     ```bash
     dist/
     ├── 16x16/
     │   ├── flamework_android_dark.png
     │   ├── flamework_android_light.png
     │   ├── flamework_circle_dark.png
     │   ├── flamework_circle_light.png
     │   ├── flamework_square_dark.png
     │   ├── flamework_square_light.png
     │   ├── flamework_transparent_dark.png
     │   ├── flamework_transparent_light.png
     ├── 32x32/
     │   ├── ...
     └── svg/
         ├── android_dark.svg
         ├── android_light.svg
         ├── circle_dark.svg
         ├── circle_light.svg
         ├── square_dark.svg
         ├── square_light.svg
         ├── transparent_dark.svg
         └── transparent_light.svg
     ```

4. **Verify the Icons**:
   Open the exported images to ensure they meet your requirements.

---

## Customization

### Adding New Sizes

To add a new size, update the `SIZES` array in the `generate.sh` script:

```bash
SIZES=(16 32 48 64 128 256 512 <NEW_SIZE>)
```

### Changing Formats

If additional formats are needed, modify the script to include the desired format. ImageMagick supports a variety of formats.

---

## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

## Contributions

Contributions are welcome! To contribute:

1. Fork this repository.
2. Create a feature branch:

   ```bash
   git checkout -b feature/your-feature
   ```

3. Make your changes and commit:

   ```bash
   git commit -m "feat: Add your message here"
   ```

4. Push your changes:

   ```bash
   git push origin feature/your-feature
   ```

5. Create a Pull Request.

For major changes, please open an issue first to discuss your ideas.

---

## Support

If you encounter issues, feel free to open an issue or contact the maintainers.
