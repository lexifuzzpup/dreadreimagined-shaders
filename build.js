const fs = require("node:fs");
const path = require("node:path");

const rootDir = "./";
const shaderDirRoot = path.join(rootDir, "shader_source");
const outDir = path.join(rootDir, "shaders");
const shaderDirs = fs.readdirSync(shaderDirRoot);

fs.mkdirSync(outDir, { recursive: true });

const builtShaderDirs = [];
const baseShaderDirs = [];
const buildDimensions = [];


// Find source shaders (if the dir has a build.json)
for(const shaderDir of shaderDirs) {
    const buildJSONPath = path.join(shaderDirRoot, shaderDir, "build.json");

    if(!fs.existsSync(buildJSONPath)) {
        baseShaderDirs.push(shaderDir);
        continue;
    } else {
        builtShaderDirs.push(shaderDir);
    }
}


// Build shaders
for(const shaderSubdir of builtShaderDirs) {
    const buildJSONPath = path.join(shaderDirRoot, shaderSubdir, "build.json");
    const buildJSON = JSON.parse(fs.readFileSync(buildJSONPath));

    buildDimensions.push(buildJSON);

    const shaderSrcDir = path.join(shaderDirRoot, shaderSubdir);
    const shaderOutDir = path.join(outDir, buildJSON.output_name);

    console.log("=-".repeat(32));
    console.log(`## Building shader ${buildJSON.output_name} ##`);
    console.log(`Source directory: ${shaderSrcDir}`);
    console.log(`Output directory: ${shaderOutDir}`);
    console.log(`Output name: ${buildJSON.output_name}`);
    console.log(`Dimension name: ${buildJSON.dimension_name}`);
    console.log(`Dimension copy count: ${buildJSON.copies}`);
    console.log();

    fs.rmSync(shaderOutDir, { recursive: true, force: true });
    fs.mkdirSync(shaderOutDir);

    for(const baseSubdir of baseShaderDirs) {
        const baseSrcDir = path.join(shaderDirRoot, baseSubdir);
        console.log(`## Processing base ${baseSrcDir} ##`);

        copyDirectory(baseSrcDir, shaderOutDir);
    }

    console.log(`## Processing overrides ${shaderSrcDir} ##`);
    copyDirectory(shaderSrcDir, shaderOutDir, filterFile => filterFile != "build.json");
}


// Copy resources
console.log("=-".repeat(32));

console.log("Copying properties");
copyDirectory(path.join(rootDir, "properties"), outDir, filterFile => filterFile.endsWith(".properties"));

console.log("Copying textures");
copyDirectory(path.join(rootDir, "texture"), path.join(outDir, "texture"), filterFile => filterFile.endsWith(".png") || filterFile.endsWith(".mcmeta"));

console.log("Copying libs");
copyDirectory(path.join(rootDir, "lib"), path.join(outDir, "lib"), filterFile => filterFile.endsWith(".glsl"));


// Compile dimension.properties
console.log("=-".repeat(32));
console.log(`Writing ${buildDimensions.length} dimension(s) to dimension.properties`);
for(const buildJSON of buildDimensions) {
    console.log(`  * ${buildJSON.output_name}`);
}

let dimensionPropertiesOutput = "";
for(const buildJSON of buildDimensions) {
    dimensionPropertiesOutput += "dimension." + buildJSON.output_name + " = ";

    dimensionPropertiesOutput += buildJSON.dimension_name;
    for(let i = 0; i < buildJSON.copies; i++) {
        dimensionPropertiesOutput += " " + buildJSON.dimension_name + "_" + i;
    }

    dimensionPropertiesOutput += "\n";
}
fs.writeFileSync(path.join(outDir, "dimension.properties"), dimensionPropertiesOutput);
console.log("Done!");



function copyDirectory(src, dest, filter = () => true) {
    fs.mkdirSync(dest, { recursive: true });

    for(const srcSubEntSubpath of fs.readdirSync(src)) {
        if(!filter(srcSubEntSubpath)) continue;
        
        const srcSubEntPath = path.join(src, srcSubEntSubpath);
        const destSubEntPath = path.join(dest, srcSubEntSubpath);
        console.log(`Copying file ${srcSubEntPath} => ${destSubEntPath}`);
        fs.cpSync(srcSubEntPath, destSubEntPath, { recursive: true, force: true });
    }
}