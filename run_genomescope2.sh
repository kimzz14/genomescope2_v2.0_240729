kmer_size=$1
threadN=128

kmc -k${kmer_size} -t${threadN} -m64 -ci1 -cs1000000000 -fq @FILES k${kmer_size} temp_dir 1> k${kmer_size}.log 2>&1
kmc_tools transform k${kmer_size} histogram k${kmer_size}.histo -cx100000 1> k${kmer_size}.histo.log 2>&1
genomescope2 -i k${kmer_size}.histo -o k${kmer_size} -k ${kmer_size} -p 2 1> k${kmer_size}.genomescope2.log 2>&1