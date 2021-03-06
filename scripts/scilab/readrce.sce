// This script reads Lambda receiver output files and puts
// the receiver data into a matrix called REC.
// Refer to the manual for further information.
//
// Simon Ahrens, IHA Oldenburg, 2006

// Enter file name here
FILENAME = 'example.rce';

// All done, execute this script!
// -----------------------------------------------------------

REC = [];
content = [];
outFile = mopen(FILENAME,'rb');
if outFile~=-1
  while ~meof(outFile)
    content = [content mget(1,'dl',outFile)];
  end
  mclose(outFile);
  if (length(content)>1) & (content(1)>0)
    nRec = content(1); recVec = content(2:length(content));
    for n=1:floor(length(recVec)/nRec)
      REC(n,:) = recVec(1,(n-1)*nRec+1:n*nRec);
    end
    REC = REC';
  end
end
