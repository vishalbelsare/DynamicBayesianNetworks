#! /bin/sh
# Will run the profiler for the current algorithm
export ARGS='
  --num_features 6
  --num_indep 4 
  --num_samples 50 
  --generated_noise_var 1 
  --chain_length 5000 
  --burn_in 1000 
  --change_points 10 25 
  -v --coefs_file coefs.txt
  '
# Execute with profiler
python -m cProfile -o ./output/algorithm_profiling.cprof -s cumulative ./src/NhDBN/main.py $ARGS
# open the profiler
pyprof2calltree -k -i ./output/algorithm_profiling.cprof
