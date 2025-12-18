all: dist/yama.csv dist/taki.csv dist/toge.csv dist/itiran.csv dist/nandoku.csv

dist/yama.csv: workspace/tyuuki.csv convert_tyuuki.py
	./convert_tyuuki.py --cat 3 1 2 $< > $@

dist/taki.csv: workspace/tyuuki.csv convert_tyuuki.py
	./convert_tyuuki.py --cat 3 2 7 $< > $@

dist/toge.csv: workspace/tyuuki.csv convert_tyuuki.py
	./convert_tyuuki.py --cat 4 1 11 $< > $@

dist/nandoku.csv: workspace/tyuuki.csv convert_tyuuki.py
	./convert_tyuuki.py $< > $@ 2> dist/nandoku_gaiji.csv

dist/itiran.csv: workspace/itiran.csv convert_itiran.py
	./convert_itiran.py > $@

workspace/%.csv: private_data/%.csv
	iconv -f CP932 -t UTF-8 $< > $@
