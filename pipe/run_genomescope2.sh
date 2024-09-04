kmer=$1
threadN=128

if [ -z "${kmer}" ]; then
    echo "Error: The variable 'kmer' is empty."
    exit 1
fi

if [ ! -d "tmp_k${kmer}" ]; then
    mkdir "tmp_k${kmer}"
fi

kmc -k${kmer} -t${threadN} -m64 -ci1 -cs1000000000 -fq @FILES k${kmer} tmp_k${kmer} 1> k${kmer}.log 2>&1
kmc_tools transform k${kmer} histogram k${kmer}.histo -cx100000 1> k${kmer}.histo.log 2>&1
genomescope2 -i k${kmer}.histo -o k${kmer} -k ${kmer} -p 2 1> k${kmer}.genomescope2.log 2>&1
