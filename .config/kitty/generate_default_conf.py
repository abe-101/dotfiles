#!/usr/bin/env sh
set -euo pipefail

outfile="${1:-kitty.conf}"
kitty +runpy 'from kitty.config import commented_out_default_config; print(commented_out_default_config())' > "$outfile"
printf "Wrote %s\n" "$outfile"
