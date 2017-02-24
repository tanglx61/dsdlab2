var result = '';
for (var n=0; n<64; n++){
  var s = '';
  
  
  if (n > 51) {
    s += '0000000000000000000000000000000000000000000000000000';
  } else {
    for (var i=0; i<n; i++){
      s += '0';
    }
    
    while (s.length < 52) {
      s = '1' + s;
    }
   
  }
  
    result += n + "\t:\t" + s + ';\n';
}

console.log(result);