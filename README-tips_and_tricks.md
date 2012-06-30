

## NFS on OSX


Edit (as root) the file `/etc/exports` and add a line like the following (substitute your name of course):

    "/Users/flip" -network 33.33.33 -mapall=0:80 -mask 255.255.255.0

Then:

    sudo nfsd enable
    showmount -e       # show that it's working!
