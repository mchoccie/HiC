


dat=$1 ##output from hicplus prediction

chrom=mm102.chrom.sizes ##chrom size file, change to your own species.

cat $dat | tr ':' '\t'|tr '-' '\t' | awk '{print 0,$1,$2,0,0,$4,$5,1,$7}' >  ${dat}_tmp


less ${dat}_tmp |awk '{OFS="\t"; for (i=0; i<$NF; i++) print }' |cut -f1-8 -d" " > ${dat}_tmp2

java -Xmx40g -jar ~/juicer/CPU/common/juicer_tools.1.9.9_jcuda.0.8.jar pre -d -c 18 -r 5000,10000,20000,25000,40000,50000,100000 ${dat}_tmp2 ${dat}.hic hg19
