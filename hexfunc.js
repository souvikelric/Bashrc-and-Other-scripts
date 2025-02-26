function checkHex(hexcode) {
  let len = hexcode.length;
  if (len != 7) return false;
  if (hexcode[0] !== "#") return false;
  let allChars = hexcode.split("");
  allChars.shift();
  const validChars = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
  ];
  return allChars.every(
    (ac) => validChars.find((vc) => vc === ac) !== undefined
  );
}
let sampleString = "#12fffff";
console.log(checkHex(sampleString));
