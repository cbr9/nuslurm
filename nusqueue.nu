#!/usr/bin/env nu 

source utils.nu

def nusqueue [] {
  let table = squeue --format "%i\t%u\t%M\t%B\t%j\t%P\t%g\t%T\t%Q" | from tsv
  let time_running = $table | get TIME | parse_slurm_duration
  let time_running = [[TIME_RUNNING]; [$time_running]] | flatten
  let table = $table | reject TIME | merge $time_running | sort-by STATE TIME_RUNNING
  return $table
}

