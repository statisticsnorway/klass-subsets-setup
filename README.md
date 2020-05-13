# klass-subsets-setup

This repository helps set up Linked Data Storage (LDS) locally using PostgreSQL for data persistence. It is especially geared towards testing https://github.com/statisticsnorway/klass-subsets-api.

Example ClassificationSubsets are added to the LDS instance during the setup, and stay there even after LDS and Postgres services are stopped and restarted.

If the images are not deleted from docker, this setup only needs to be run once.

There are two ways of setting this up. 
1. One way for if you have a Windows 64 machine and you do not have Chocolatey (the windows package manager) installed
2. One way for everyone else.

Either way, run the scripts from an elevated ("run as administrator") bash prompt.

## Steps

- Download/clone this project

### Windows, no Chocolatey
1. Download `jq-win64.exe` from here https://stedolan.github.io/jq/download/ and put it inside this project folder.
2. Run the script called `run.sh <PATH>` where you replace <PATH> with the full path to and including the project folder. This will start LDS and Postgres. Wait for the services to be up and running.
3. Run the script `import_jq-win64.sh` (NOT `import.sh`) in order to put example classification subsets into LDS/Postgres.

### Everyone else
1. install `jq` using your package manager. Windows: `chocolatey install jq` OS X: `brew install jq`, Debian/Ubuntu: `sudo apt-get install jq`.
2. Run the script `run.sh <PATH>` where you replace `<PATH>` with the full path to _and including_ the project folder. This will start LDS and Postgres. Wait for the services to be up and running before doing the next step.
3. Run the script `import.sh` (NOT `import_jq-win64.sh`) in order to put example classification subsets into LDS/Postgres.


