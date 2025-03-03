const process = require("node:process");
const fs = require("node:fs");
const path = require("node:path");


let currDir = process.cwd();
let files = fs.readdirSync(currDir);
const rows = process.stdout.rows;
console.log(rows);
let index = 0;

// rgb function for getting foreground coloured text
const rgbText = (r, g, b, text) => {
    return `\x1B[38;2;${r};${g};${b}m${text}\x1B[0m`;
};

// rgb function for getting background coloured text
const rgbBg = (r, g, b, text) => {
    return `\x1B[48;2;${r};${g};${b}m${text}\x1B[0m`;
};

const cursorGreen = ["0", "245", "212"];
const folderOrange = ["204", "192", "97"];
const fileWhite = ["255", "255", "255"];
const magenta = ["199", "125", "255"];

//hides the cursor
process.stdout.write('\x1B[?25l');
// Enable alternate screen buffer
process.stdout.write('\x1b[?1049h');

// function render(){
//     process.stdout.write('\x1B[2J\x1B[H'); // clears the screen and positions cursor to top-left

//     console.log(rgbText(...magenta,"🔥Welcome to the Terminal File Explorer🔥"));
//     console.log();

//     if(files.length > Math.ceil(rows/2)){
//         files = files.slice(0,Math.ceil(rows/2));
//     }
//     files.forEach((f, i) => {
//         const isSelected = i === index;
//         const marker = isSelected ? rgbText(...cursorGreen, ">") : " ";
//         const color = isSelected 
//             ? cursorGreen // Highlight both the marker and the file/folder name
//             : fs.statSync(path.join(currDir, f)).isDirectory()
//                 ? folderOrange
//                 : fileWhite;
//         const fileName = rgbText(...color, f);
    
//         console.log(`${marker} ${fileName}`);
//     });

//     console.log();
//     console.log(rgbText(...cursorGreen,`Selected file : ${files[index]}`));

//     console.log();
//     console.log(rgbText(...magenta,"Press Ctrl + C to Exit"));
// }

function render() {
    // Move cursor to the top-left (without clearing screen)
    process.stdout.write('\x1B[H');

    // Clear below the cursor (so we don't get overlap)
    process.stdout.write('\x1B[J');

    console.log(rgbText(...magenta, "🔥 Welcome to the Terminal File Explorer 🔥"));
    console.log();

    // Adjust file slice to fit rows dynamically
    const visibleFiles = files.slice(0, Math.min(files.length, Math.floor(rows / 2)));

    visibleFiles.forEach((f, i) => {
        const isSelected = i === index;
        const marker = isSelected ? rgbText(...cursorGreen, ">") : " ";
        const color = isSelected
            ? cursorGreen
            : fs.statSync(path.join(currDir, f)).isDirectory()
                ? folderOrange
                : fileWhite;
        const fileName = rgbText(...color, f);
        console.log(`${marker} ${fileName}`);
    });

    console.log();
    console.log(rgbText(...cursorGreen, `Selected file: ${files[index] || 'None'}`));
    console.log();
    console.log(rgbText(...magenta, "Press Ctrl + C to Exit"));
}


render();

const changeDir = (file) => {
    index = 0;
    currDir = path.join(currDir,file);
    files = fs.readdirSync(currDir);
    render();
}

const goBack = () => {
    index = 0;
    currDir = path.join(currDir,"..");
    files = fs.readdirSync(currDir);
    render();
}

process.stdin.setRawMode(true);
process.stdin.resume();
process.stdin.setEncoding('utf8');

process.stdin.on('data',(key)=> {
    // 

    if(key === "\u001b[B" && index !== files.length - 1){
        index++;
    }
    if(key === "\u001b[A" && index !== 0){
        index--;
    }

    if(key === "\r"){
        changeDir(files[index]);
    }

    if(key === "\u0008"){
        goBack();
    }

    if (key === '\u0003') { // Ctrl+C
        // Clear screen and reset cursor
        process.stdout.write('\x1B[2J\x1B[H');
    
        // Show cursor and restore the main screen
        process.stdout.write('\x1B[?25h');
        process.stdout.write('\x1b[?1049l');
    
        // Disable raw mode (restore normal input behavior)
        process.stdin.setRawMode(false);
        process.stdin.pause();
    
        process.exit();
    }
    
    render();
})