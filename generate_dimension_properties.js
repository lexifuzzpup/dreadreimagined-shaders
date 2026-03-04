const fs = require("node:fs");

main();

function input(prompt) {
    return new Promise((res) => {
        process.stdout.write(prompt + "\n");
        process.stdin.on("data", data => {
            res(data.toString());
        })
    })
}
async function inputYesNo(prompt) {
    let response;
    while(true) {
        response = await input(prompt).then(v => v.trim());

        if(response.toLowerCase() == "y") return true;
        if(response.toLowerCase() == "n") return false;

        console.log("Invalid response. Enter y/n");
    }
}

async function main() {
    let names = [];

    while(true) {
        let name = await input("Enter name of dimension")

        names.push(name.trim());

        if(!await inputYesNo("Add another? (y/n)")) break;
    }

    fs.writeFileSync("dimension.properties",
        names.map(name =>
            "dimension." + name + " = " +
            Array(2048).fill(null)
                .map((_, i) =>
                    "dreadnether:" + name + "_" + i
                )
                .join(" ")
        ).join("\n")
    );

    process.exit(0);
}