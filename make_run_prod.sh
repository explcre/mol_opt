#!/bin/bash

methods=('screening' 'molpal' 'graph_ga' 'smiles_ga' 'selfies_ga' \
         'graph_mcts' 'smiles_lstm_hc' 'selfies_lstm_hc')

for method in "${methods[@]}"
do
    echo "#!/bin/bash

oracle_array=('drd2' 'qed' 'jnk3' 'gsk3b' 'celecoxib_rediscovery' \\
    'troglitazone_rediscovery' 'troglitazone_rediscovery' \\
    'thiothixene_rediscovery' 'albuterol_similarity' 'mestranol_similarity' \\
    'isomers_c7h8n2o2' 'isomers_c9h10n2o2pf2cl' 'median1' 'median2' 'osimertinib_mpo' \\
    'fexofenadine_mpo' 'ranolazine_mpo' 'perindopril_mpo' 'amlodipine_mpo' \\
    'sitagliptin_mpo' 'zaleplon_mpo' 'valsartan_smarts' 'deco_hop' 'scaffold_hop')

for oralce in "\${oracle_array[@]}"
do
python -u run.py ${method} --task production --n_runs 5 --n_jobs 8 --oracles \${oralce}
done" > production_$method.sh

#     if [[ ${method} = 'molpal' ]]
#     then
#         CUDA_VISIBLE_DEVICES=0 nohup bash production_${method}.sh &> ${method}_prod.out &
#     elif [[ $method = 'smiles_lstm_hc' ]]
#     then
#         CUDA_VISIBLE_DEVICES=1 bash bash production_${method}.sh &> ${method}_prod.out &
#     elif [[ $method = 'selfies_lstm_hc' ]]
#     then
#         CUDA_VISIBLE_DEVICES=2 bash production_${method}.sh&> ${method}_prod.out &
#     elif [[ $method = 'selfies_ga' ]]
#     then
#         CUDA_VISIBLE_DEVICES=3 bash production_${method}.sh &> ${method}_prod.out &
#     else
#         CUDA_VISIBLE_DEVICES= bash production_${method}.sh &> ${method}_prod.out &
#     fi
done