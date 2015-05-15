# Check out a repo
svn checkout svn+ssh://<host>/repo/path

# Check out folder and all its immediate contents without recursing
svn checkout --depth immediates svn+ssh://<host>/repo/path

# Check out folder and all its files (but not directories)
svn checkout --non-recursive svn+ssh://<host>/repo/path

# Partial checkout and then add additional files as needed
# http://stackoverflow.com/questions/50945/can-you-do-a-partial-checkout-with-subversion
svn checkout --depth empty http://svnserver/trunk/proj
svn update --set-depth infinity proj/foo
svn update --set-depth immediates proj/bar
svn update --set-depth empty proj/bar/a
svn update --set-depth empty proj/bar/a/b

# The first time you use --depth, it sets a default depth
# To override the default depth, use --set-depth
# http://svnbook.red-bean.com/en/1.6/svn.advanced.sparsedirs.html

# svn merge/update output explanation
# http://stackoverflow.com/questions/2634300/what-do-the-different-columns-of-letters-mean-for-the-svn-merge-output
A  Added
D  Deleted
U  Updated
C  Conflict
G  Merged

# discard changes to file
# http://stackoverflow.com/questions/9463695/how-to-discard-local-changes-svn
svn revert <file>

# creating and applying a patch/diff
# https://ariejan.net/2007/07/03/how-to-create-and-apply-a-patch-with-subversion/
svn diff > patch
patch -p0 -i patch

# Resolve a conflict
svn resolved <file>