#!/bin/bash

FASTA=$1
MAX_DATE=$2
OUTDIR=outputs
mkdir $OUTDIR

DATADIR=/gpulab_data/alphafold_2023_06_09

source /opt/miniconda3/etc/profile.d/conda.sh
conda activate alphafold
python3 /opt/alphafold/run_alphafold.py \
  --fasta_paths=${FASTA} \
  --data_dir=${DATADIR} \
  --output_dir=${OUTDIR} \
  --max_template_date=${MAX_DATE} \
  --bfd_database_path=${DATADIR}/bfd/bfd_metaclust_clu_complete_id30_c90_final_seq.sorted_opt \
  --mgnify_database_path=${DATADIR}/mgnify/mgy_clusters_2022_05.fa \
  --template_mmcif_dir=${DATADIR}/pdb_mmcif/mmcif_files \
  --obsolete_pdbs_path=${DATADIR}/pdb_mmcif/obsolete.dat \
  --pdb70_database_path=${DATADIR}/pdb70/pdb70 \
  --uniref90_database_path=${DATADIR}/uniref90/uniref90.fasta \
  --uniref30_database_path=${DATADIR}/uniref30/UniRef30_2021_03 \
  --use_gpu_relax=true
