test:
	for d in ruby perl5 perl6; do \
	  ( cd $$d && make test ); \
	done
