#!/usr/bin/env nu 

def parse_slurm_duration [] {
  # parse a SLURM timedate into nushell duration.
  # also make sure that timedates of less than one hour/day 
  # are correctly parsed by changing missing values into zeros
  let record = $in | parse -r '(?:(?P<DAYS>\d?\d)-)?(?:(?P<HOURS>\d?\d):)?(?P<MINUTES>\d?\d):(?P<SECONDS>\d?\d)' | str replace -r "^$" "0" HOURS DAYS  
  let duration = $record | format '{DAYS}day {HOURS}hr {MINUTES}min {SECONDS}sec' | into duration 
  return $duration
}


