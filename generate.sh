#!/bin/bash


# Input SVG files
INPUT_LIGHT_SVG="./src/light/icon.svg"
INPUT_DARK_SVG="./src/dark/icon.svg"

# Output directory
OUTPUT_DIR="./dist"
SVG_OUTPUT_DIR="${OUTPUT_DIR}/svg"
cleanup() {
    echo "Cleaning up..."
    rm -rf "$OUTPUT_DIR"
}

# Clean up before starting
cleanup

# Create output directories
mkdir -p "$OUTPUT_DIR" "$SVG_OUTPUT_DIR"

# Array of sizes
SIZES=(16 32 48 64 128 256 512 1024)

# Generate modified SVG content
generate_svg_variant() {
    local base_svg=$1
    local variant=$2
    local mode=$3
    local output_svg=$4

    local background_color=""
    if [[ "$mode" == "light" ]]; then
        background_color="white"
    elif [[ "$mode" == "dark" ]]; then
        background_color="black"
    fi

    case "$variant" in
        "circle")
            sed -e "s/<circle\/>/<circle cx=\"50%\" cy=\"50%\" r=\"50%\" fill=\"$background_color\" \/>/" \
                "$base_svg" > "$output_svg"
            ;;
        "square")
            sed -e "s/<rect\/>/<rect x=\"0\" y=\"0\" width=\"100%\" height=\"100%\" fill=\"$background_color\" \/>/" \
                "$base_svg" > "$output_svg"
            ;;
        "android")
            sed -e "s/<rect\/>/<rect x=\"0\" y=\"0\" rx=\"15\" ry=\"15\" width=\"100%\" height=\"100%\" fill=\"$background_color\" \/>/" \
                "$base_svg" > "$output_svg"
            ;;
        "transparent")
            cp "$base_svg" "$output_svg"
            ;;
        *)
            echo "Unknown variant: $variant"
            ;;
    esac
}

# Function to convert an SVG to PNG
convert_svg() {
    local input_svg=$1
    local base_name=$2

    # Loop through each size and create directories
    for size in "${SIZES[@]}"; do
        local size_dir="${OUTPUT_DIR}/${size}x${size}"
        mkdir -p "$size_dir"

        # PNG export
        convert -background none "$input_svg" -resize "${size}x${size}" "$size_dir/${base_name}.png"
    done
}

# Export variants
echo "Exporting light and dark variants..."

VARIANTS=("circle" "square" "android" "transparent")

# Light variant (with dark background)
for variant in "${VARIANTS[@]}"; do
    for mode in "dark"; do
        # Generate SVG
        output_svg="${SVG_OUTPUT_DIR}/${variant}_${mode}.svg"
        generate_svg_variant "$INPUT_LIGHT_SVG" "$variant" "$mode" "$output_svg"

        # Convert to PNG with contrasting background
        convert_svg "$output_svg" "flamework_${variant}_${mode}" "white"
    done
done

# Dark variant (with light background)
for variant in "${VARIANTS[@]}"; do
    for mode in "light"; do
        # Generate SVG
        output_svg="${SVG_OUTPUT_DIR}/${variant}_${mode}.svg"
        generate_svg_variant "$INPUT_DARK_SVG" "$variant" "$mode" "$output_svg"

        # Convert to PNG with contrasting background
        convert_svg "$output_svg" "flamework_${variant}_${mode}" "white"
    done
done

echo "All files exported to $OUTPUT_DIR."