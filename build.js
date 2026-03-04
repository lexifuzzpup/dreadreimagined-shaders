const fs = require("node:fs");
const path = require("node:path");
const projectProperties = require("./package.json");
const childProcess = require("child_process");

const projectName = `${projectProperties.author ?? projectProperties.authors[0]}_${projectProperties.name}`;
const shaderpackName = `${projectName}_v${projectProperties.version}`;

const rootDir = "./";
const srcDir = path.join(rootDir, "src");
const shaderDirRoot = path.join(srcDir, "shader_source");
const outDir = path.join(rootDir, "build", shaderpackName);
const shaderDirs = fs.readdirSync(shaderDirRoot);

fs.rmSync(outDir, { recursive: true, force: true });
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
    const shaderOutDir = path.join(outDir, "shaders", buildJSON.output_name);

    console.log("=-".repeat(32));
    console.log(`## Building shader ${buildJSON.output_name} ##`);
    console.log(`Source directory: ${shaderSrcDir}`);
    console.log(`Output directory: ${shaderOutDir}`);
    console.log(`Output name: ${buildJSON.output_name}`);
    console.log(`Dimension name: ${buildJSON.dimension_name}`);
    console.log(`Dimension copy count: ${buildJSON.copies}`);
    console.log();

    fs.rmSync(shaderOutDir, { recursive: true, force: true });
    fs.mkdirSync(shaderOutDir, { recursive: true });

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
copyDirectory(path.join(srcDir, "properties"), path.join(outDir, "shaders"), filterFile => filterFile.endsWith(".properties"));

console.log("Copying textures");
copyDirectory(path.join(srcDir, "texture"), path.join(outDir, "shaders", "texture"), filterFile => filterFile.endsWith(".png") || filterFile.endsWith(".mcmeta"));

console.log("Copying libs");
copyDirectory(path.join(srcDir, "lib"), path.join(outDir, "shaders", "lib"), filterFile => filterFile.endsWith(".glsl"));


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
fs.writeFileSync(path.join(outDir, "shaders", "dimension.properties"), dimensionPropertiesOutput);

console.log("=-".repeat(32));
console.log("Zipping files");
childProcess.spawnSync(`/bin/zip -r ../${shaderpackName}.zip *`, { shell: true, stdio: "inherit", cwd: outDir });

const latestShaderpackFilepath = path.join(rootDir, "build", `${projectName}_latest.zip`);
console.log(`Creating ${latestShaderpackFilepath}`);

fs.rmSync(latestShaderpackFilepath, { force: true });
fs.copyFileSync(path.join(rootDir, "build", `${shaderpackName}.zip`), latestShaderpackFilepath);

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