set -e
echo "Enter release version: "
read VERSION
read -p "Releasing $VERSION - are you sure? (y/n)" -n 1 -r

# Move to a new line.
echo

if [[ $REPLY =~ ^[Yy]$ ]]
then
  echo "Releasing $VERSION …"
  npm login
  npm version $VERSION --message "[release] $VERSION"
  git push origin refs/tags/v$VERSION
  git push
  npm publish
  npm logout
fi
