vlib work
vlog -f src_files.list +cover -covercells
vsim -voptargs=+acc 
vsim -voptargs=+acc -assertdebug +assertreport +assertcover work.TB_TOP -cover 
do wave.do
coverage save TB.ucdb -onexit -du SYS_TOP
run -all

# vcover report TB.ucdb -details -annotate -all -output coverage_report.txt
