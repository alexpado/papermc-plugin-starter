WORKSPACE=".papermc"

## ============== DO NOT EDIT THE SCRIPT BELOW UNLESS YOU KNOW WHAT YOU ARE DOING ============== ##

## Load env file if exists
if [[ -f ".env" ]]; then
  export $(cat .env | xargs)
fi

# Checking the workspace folder availability.
if [ ! -d $WORKSPACE ]; then
  # Create the workspace folder.
  mkdir $WORKSPACE
fi

cd $WORKSPACE || exit # Moving to the workspace folder or exit if it fails.

# Check for the paper executable
if [[ ! -f "papermc.jar" ]]; then
  if [[ ! -f "download-paper.sh" ]]; then
    cp ../docker/scripts/download-paper.sh download-paper.sh
  fi
  ./download-paper.sh
  rm download-paper.sh
  if [[ $? -ne 0 ]]; then
    echo "Something went wrong with the download script."
    exit 1
  fi
fi

java -jar papermc.jar "$@"
