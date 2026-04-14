rule run_medicc:
    '''
    Run medicc 
    It is good to also run medicc outside the pipeline and give -n "diploid clone" so that it roots the tree in the diploid cells
    '''
    input:
        medicc_input=out + "/{patient_id}/clones/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}.txt"
    output:
        medicc_dir = directory(out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}"),
        marker    = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/.medicc_done",
        tree_new  = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_final_tree.new",
        tree_xml  = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_final_tree.xml",
        tree_png  = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_final_tree.png",
        cn_profiles     = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_final_cn_profiles.tsv",
        cn_profiles_pdf = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_cn_profiles.pdf",
        pairwise_dist   = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_pairwise_distances.tsv",
        branch_lengths  = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_branch_lengths.tsv",
        summary         = out + "/{patient_id}/medicc/g{gamma}-b{binsize}-br{binsize_refine}/{patient_id}-medicc_input-g{gamma}-b{binsize}-br{binsize_refine}_summary.tsv"
    conda: "../envs/medicc_env.yaml"
    shell:
        '''
        medicc2 {input.medicc_input} {output.medicc_dir}
        touch {output.marker}
        '''



