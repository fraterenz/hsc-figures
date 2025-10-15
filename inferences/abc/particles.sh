#!/bin/bash
#$ -pe smp 1
#$ -l h_vmem=32G
#$ -j y
#$ -l h_rt=24:0:0
#$ -t 1-65000
#$ -o jobs/$JOB_NAME.$JOB_ID.$TASK_ID.out

# Get the parameters file from argument
PATH2PARAMS=$1

# Check if argument was provided
if [ -z "$PATH2PARAMS" ]; then
    echo "Error: No parameters file provided"
    echo "Usage: $0 <path/to/parameters.txt>"
    exit 1
fi

# Check if the parameters file exists
if [ ! -f "$PATH2PARAMS" ]; then
    echo "Error: Parameters file not found at $PATH2PARAMS"
    exit 1
fi

LINE=$(sed -n "${SGE_TASK_ID}p" "${PATH2PARAMS}")
echo $LINE

# Check if line was found
if [ -z "$LINE" ]; then
    echo "Error: No line found at position $SGE_TASK_ID in $PATH2PARAMS"
    exit 1
fi

# Extract binary name and arguments
MYBIN=$(echo "$LINE" | awk '{print $1}')
INPUT_ARGS=$(echo "$LINE" | sed 's/^[^ ]* *//')

# Check if we successfully extracted a binary name
if [ -z "$MYBIN" ]; then
    echo "Error: Could not extract binary name from first line of $PATH2PARAMS"
    exit 1
fi

# Check if the binary exists
if [ ! -f "$MYBIN" ]; then
    echo "Error: Binary not found at $MYBIN"
    exit 1
fi

# Check if the binary is executable
if [ ! -x "$MYBIN" ]; then
    echo "Error: Binary at $MYBIN is not executable"
    echo "You may need to run: chmod +x $MYBIN"
    exit 1
fi

echo "Running sims with $INPUT_ARGS and seed ${SGE_TASK_ID} $(date +"%T")"

"$MYBIN" --seed $SGE_TASK_ID $INPUT_ARGS 

echo "end hsc $(date +"%T")"

