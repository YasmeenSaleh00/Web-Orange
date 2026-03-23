document.write("<h1>String Manipulation Exercises</h1>");
//Create two variables containing the strings `"Hello"` and `"World"`.
// Write code that combines them into one string with a space between them.
document.write("Task 1");
document.write('<br>');
let variableOne = "Hello";
let variableTwo ="Word";
document.write(variableOne.concat(" "+variableTwo));
document.write('<br>');
// Create a variable with the value `"JavaScript"`.
// Write code to find how many characters are inside the string.
document.write("Task 2");
document.write('<br>');
let variable = "JavaScript";
document.write(`The length for variable is ${variable.length}`);
document.write('<br>');
// Given the string "Programming", print only the first character.
document.write("Task 3");
document.write('<br>');
let text = "Programming" ;
document.write(text[0]);
document.write('<br>');
// From the string "coding is fun" extract the word "coding".g", print only the first character.
document.write("Task 4");
document.write('<br>');
let textTwo ="coding is fun";
document.write(textTwo.slice(0,6));
document.write('<br>');
// Given the string "cat", replace the letter "a" with "e".
document.write("Task 5");
document.write('<br>');
let cat = "cat";
document.write(cat.replace("a","e"));
document.write('<br>');
// Convert the string "javascript" to uppercase letters.
document.write("Task 6");
document.write('<br>');
let a = "javascript";
document.write(a.toUpperCase());
document.write('<br>');
// Convert the string "apple,banana,orange" into an array of fruits.
document.write("Task 7");
document.write('<br>');
let fruits = "apple,banana,orange";
let fruitsArray = fruits.split(",");
document.write(fruitsArray);
console.log(fruitsArray);
//Join Array into String Given the array:
// ```
// ["hello", "world"]
// ```
document.write("Task 8");
document.write('<br>');
let array= ["hello", "world"];
document.write(array.join(" "));
document.write('<br>');
//Join Array into String Given the array:
//Remove the extra spaces at the beginning and end of the following string:`
document.write("Task 9");
document.write('<br>');
let b= " hello world ";
document.write(b.trim());
document.write('<br>');
//Check if the word "world" exists inside the string "hello world".
document.write("Task 10");
document.write('<br>');
let c= "hello world";
document.write(c.includes("world"));
document.write('<br>');
//Reverse the following string:.
document.write("Task 11");
document.write('<br>');
let d= "hello";
document.write(d.split("").reverse().join(""));
document.write('<br>');
//Count how many times the letter "e" appears in the string "elephant".
document.write("Task 12");
document.write('<br>');
let f= "elephant";
let matches = Array.from(f.matchAll(/e/g));
document.write( matches);
document.write('<br>');
//Palindrome Check
document.write("Task 13");
document.write('<br>');
let g= "racecar";
let m = g.split("").reverse().join("");
if(g === m){
    document.write("Yes its Palindrome");
  
}else{
      document.write(" its not Palindrome")
}

document.write('<br>');
//Capitalize Each Word
document.write("Task 14");
document.write('<br>');
let sentence = "hello world";
let words = sentence.split(" "); 
let result = [];
for (let word of words) {
    let capitalized = word.charAt(0).toUpperCase() + word.slice(1);
    result.push(capitalized);
}
document.write(result.join(" ")); 
document.write('<br>');
//Convert the number 1234.5678 so it shows only two decimal places.
document.write("Task 15");
document.write('<br>');
let number = 1234.5678;
document.write(number.toFixed(2));
document.write('<br>');
//Extract Numbers from String
document.write("Task 16");
document.write('<br>');
let mixed = "There are 3 apples and 2 oranges";
let numbersOne = mixed.match(/\d+/g);
//method two
let numbersTwo= mixed.match(/[0-9]/g)
document.write(numbersOne + "<br>");
document.write(numbersTwo)
document.write('<br>');
//Check if the following string is a valid email format.
document.write("Task 17");
document.write('<br>');
let email = "example@email.com";
let emailPattern = /\w+@\w+\.(com|net|org)/ig;
if(emailPattern.test(email)){
    document.write("valid")
}else{
    document.write("not valid")
}
// document.write(email.toLowerCase().endsWith("@email.com"));
document.write('<br>');
//Replace the word "bad" with "good" in the sentence:
document.write("Task 18");
document.write('<br>');
let sentenceTwo="This is a bad word";
document.writeln(sentenceTwo.replace("bad","good"));
document.write('<br>');
//Remove Duplicate Characters
document.write("Task 19");
document.write('<br>');
let sentenceThree="aabbc";
let sentenceThreeArray = [...new Set(sentenceThree)];
document.writeln(sentenceThreeArray);
document.write('<br>');
//Sort the characters in the string "hello" alphabetically.
document.write("Task 20");
document.write('<br>');
let word = "hello";
document.write(word.split("").sort().join(""));
document.write("<br>");
//Check if the following two words are anagrams (contain the same letters).
document.write("Task 21");
document.write('<br>');
let firstWord ="listen";
let secondWord ="silent";
if(firstWord.split("").sort().join("").toLowerCase()===secondWord.split("").sort().join("").toLowerCase()){
    document.write("Yes Anagrams ");
}else{
     document.write("No Anagrams ");
}
document.write('<br>');
//Reverse the order of words in the sentence but keep the letters of each word unchanged..
document.write("Task 22");
document.write('<br>');
let firstText ="The quick brown fox";
let reverseText = firstText.split(" ").reverse().join(" ");
document.write(reverseText);
document.write('<br>');
//Find the longest word in the following sentence.
document.write("Task 23");
document.write('<br>');
let longText = "Web development is fascinating";
let longTextArray = longText.split(" ");
let longestWord = longTextArray[0];
for(let i = 0; i< longTextArray.length;i++){
      if(longTextArray[i].length > longestWord.length){
        longestWord = longTextArray[i];
      }
}
document.write("The longest word is: " + longestWord);
document.write('<br>');
//Check if the sentence is a palindrome ignoring spaces, punctuation, and case.
document.write("Task 24");
document.write('<br>');
let textThree = "A man, a plan, a canal, Panama!";
let cleanText = textThree.toLowerCase().replace(/[\W_]/g, "");
let reversedText = cleanText.split("").reverse().join("");


if (cleanText === reversedText) {
    document.write("Yes, it's a palindrome");
} else {
    document.write("No, it's not a palindrome");
}
document.write('<br>');
//Return an object that counts how many times each character appears.
document.write("Task 25");
document.write('<br>');
  let wordThree = "mississippi";
        let frequency = {};
        for (let i = 0; i < wordThree.length; i++) {
            let char = wordThree[i];
            if (frequency[char]) {
                frequency[char]++;
            } else {
                frequency[char] = 1;
            }
        }
        console.log(frequency);
document.write("the answer in console");
document.write("<br>");
//Replace Vowels with Numbers
// a = 1
// e = 2
// i = 3
// o = 4
// u = 5
document.write("Task 26");
document.write('<br>');
let input ="Hello World";

for(let i =0;i<input.length;i++){
    if(input[i]==="a"){
    input=    input.replaceAll("a",1);
    }else if(input[i]==="e"){
   input=input.replaceAll("e",2);
    }else if(input[i]==="i"){
   input=input.replaceAll("i",3);
    }else if(input[i]==="o"){
   input=input.replaceAll("o",4);
    }else if(input[i]==="u"){
   input=input.replaceAll("u",5);
    }
}
document.write(input);
document.write("<br>");
//Check if the string "JavaScript is fun" starts with "Java".
document.write("Task 27");
document.write('<br>');
let one = "JavaScript is fun";
document.write(one.startsWith("Java"));
document.write("<br>");
//Check if the string "image.png" ends with "png".
document.write("Task 28");
document.write('<br>');
let two = "image.png";
document.write(two.endsWith("png"));
document.write("<br>");
//Repeat the string "ha" 3 times.
document.write("Task 29");
document.write('<br>');
let three = "ha";
document.write(three.repeat(3));
document.write("<br>");
//Find the position of the letter "o" in the string "Hello World".
document.write("Task 30");
document.write('<br>');
let four ="Hello World";
document.write(four.indexOf("o"));