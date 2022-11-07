pandoc index.md -o index.html --template=bootstrap_menu.html --toc

rsync -avP --delete -e 'ssh -p 18765'  /home/dave/Dropbox\ \(Lehigh\ University\)/post_doc/professional/learning/math/ u231-f6hnzkbwb44b@davebraun.net:~/www/davebraun.net/public_html/math/

