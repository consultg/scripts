fileList=$(find path/to/codebase/parent/orSubdirectory/ -type f -name "*.typeOfFileYouChecking");
isAnyInvaidFilePresent=0;
invalidFileList="\n";
for filename in $fileList; do
    [ -e $filename ] || continue
    if !(grep -iqF "searchTermTextYouCheckingComplianceForineachFile" "$filename")
    then
      isAnyInvaidFilePresent=1; 
      invalidFileList+=$filename;
      invalidFileList+="\n"; 
    fi
done
if  [[ $isAnyInvaidFilePresent == 1 ]l; then
  echo "Compliance issue in below files:- $invalidFileList";
  exit 1;
fi
