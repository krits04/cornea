# CoRNeA
protein interface prediction method
To calculate features for the test case, utilize the R codes provided in the repository
1. Conditional mutual Infromation (CMI) for inter protein contacts  
  Use cmi_processing.r to compute the CMI valus of inter protein contacts; cmi. Requires edited alignment files (a.fasta and b.fasta) as input. Calls conditional mutual information for new CMI algorithm mentioned in detail method. Output file: test_cmi.csv             Special Note: the edited alignment file should contain the first sequence as the test sequence (same sequence for all the other features). The alignment should be edited in a way that there are no gaps in the first sequence. Only then p1, p2 and p will correspond to the length of protein A, length of protein B and combined length of protein A and B. 
2. Charge compatibility(CC): Use charge_compatibility.r to compute feature cc. Requires single fasta file with both the protein sequences (test.fasta). Calls charge compatibility.csv to fill in values for residue pairs. Output file: test_cc.csv
3. Contact Potentials (CP, CP1, CP2):
  a. CP: Use mj_original to compute feature cp. Requires single fasta file with both the protein sequences (test.fasta). Calls       
         mj_original.csv to fill in values for residue pairs. Output file: test_cp.csv
  b. CP1:Use mj_exposed to compute feature cp1. Requires single fasta file with both the protein sequences (test.fasta). Calls       
         mj_exposed.csv to fill in values for residue pairs. Output file: test_cp1.csv
  c. CP2: Use mj_buried to compute feature cp. Requires single fasta file with both the protein sequences (test.fasta). Calls       
         mj_buried.csv to fill in values for residue pairs. Output file: test_cp2.csv
4. Hydropathy compatibility (HCM):Use hydropathy_compatibility.r to compute feature hc. Requires single fasta file with both the protein sequences (test.fasta). Calls hydropathy compatibility.csv to fill in values for residue pairs. Output file: test_hc.csv
5. Relative Solvent Accessibility: Use rsa.r to compute feature rsa. Requires pdf output of RSA from SPIDER2 or SPIDER3 server for both protein sequences (test1.pdf, test2.pdf). Output file: test_rsa.csv
6. Size compatibility (SCM): Use size_compatibility.r to compute feature scm. Requires single fasta file with both the protein sequences (test.fasta). Calls size compatibility.csv to fill in values for residue pairs. Output file: test_scm.csv
7. Secondary structrue prediction: Use sspred.r to compute feature ssp. Requires pdf output of secondary structure prediction from PSIPRED server for both protein sequences (seq1.pdf, seq2.pdf). Output file: test_ssp.csv
8. Environmental features : Use environmental features.r to compute the convolved environmental features. (kernel matrices: kernel_function_5.csv and kernel_function_3.csv). Call .csv of all 9 features calculated above (cmi.csv,cc.csv,cp.csv,cp1.csv,cp2.csv,hc.csv,rsa.csv,scm.rsa, ssp.csv). Output files: ecmi.csv, ecc.csv, ecp,csv, ecp1.csv, ecp2.csv, ehc.csv, ersa.csv, escm.csv, essp.csv)
9. Compiling feature values as dataframe: use compiling features.r to create a dataframe for final model prediction using random forest. Final output: test_df.csv
10. Computing interface prediction using random forest classifier: Use python jupiter notebook testing.ipynb to test the dataset on the trained models (with kernel 3 or kernel 5 matrix). Output file: prediction_test.csv
11. For post processing the results obtained from random forest classifier, calculate intra contacts using the file intra_contacts.r and rsa for individual proteins using rsa_intra.r
12. Network analysis: use the file network_analysis.r to calculate the final residual network between proteinA and proteinB. Output fle: test_final_prediction.csv
13. For generating final scores for the residue pairs predicted by CoRNeA, use prediction matrix convolution.r 
    Output file: final_prediction_test.csv
