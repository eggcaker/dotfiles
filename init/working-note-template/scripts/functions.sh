function help(){
    echo "Commands we have: "
    echo "  - pacer-activity "
    echo "    download db backup from s3 and unzip to database folder"
    echo "    "
    echo "  - dongdong-activity"
    echo "    download db backup from oss and unzip to database folder"
    echo "    "
    echo "  - dongdong-feedback"
    echo "    download logs from oss and unzip & decrept to logs folder "
    echo "    "
}

function pacer-activity() {
    FILE="$1"
    s3.download $FILE
    mv $FILE ./data/
    cd ./data/
    unzip $FILE
}


function dongdong-feedback() {
    FILE="$1"
    oss.download_log $FILE
    mv $FILE ./logs/
    cd ./logs
    unzip $FILE
    pyenv local 2.7.14
    p.decode_log_crypt *.xlog
    rm *.xlog
    pyenv local system
    git setup
    cd ../
}
