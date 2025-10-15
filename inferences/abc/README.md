# README
Inference of the parameter using ABC.

We take approx. 650 samples of the posterior distributions by generating 65'000 realisations of the HSC dynamics, i.e. we keep 1% of the runs.

    `cd` here first
    run `priors.ipynb`
    `qsub $(pwd)/particles.sh $(pwd)/parameters.txt`
    wait 2 days XD
    run `posteriors.ipynb`

Note: qsub is the command to submit jobs via the Univa Grid engine available at QMUL. Another comand might be used with other job schedulers (e.g. Slurm, Apache Hadoop...).
