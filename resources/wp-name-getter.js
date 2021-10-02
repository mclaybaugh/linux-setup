const fetch = require('node-fetch');
const { argv } = require('process');
const fs = require('fs').promises;

main(argv.slice(2));
async function main(args) {
    let file = '';
    if (args.length < 1) {
        console.error('No filename provided.');
        process.exitCode = 1;
        return;
    } else {
        file = args[0];
    }
    siteData = await wpSiteNamesFromFile(file);
    console.log('\nInvalid sites:');
    siteData.invalid.forEach((site) => {
        console.log(site.url);
    });
    console.log('\nValid sites:')
    siteData.valid.forEach((site) => {
        console.log(site.siteName);
    });
}

async function wpSiteNamesFromFile(file) {
    let response;
    try {
        buffer = await fs.readFile(file);
        let text = buffer.toString();
        let urls = text.split('\n');
        let siteData = await requestSiteNames(urls)
        let invalid = [];
        let valid = [];
        siteData.forEach((site) => {
            if (site.siteName) {
                valid.push(site);
            } else {
                invalid.push(site);
            }
        })
        response = {
            valid,
            invalid
        };
        process.exitCode = 0;
    } catch (reason) {
        response = reason;
        process.exitCode = 1;
    }
    return response;
}

async function requestSiteNames(urls) {
    return await Promise.all(urls.map(urlToName));
}

async function urlToName(url) {
    let response, data;
    try {
        response = await fetch(url);
    } catch (error) {
        return {
            url: url,
            siteName: false
        };
    }

    try {
        data = await response.json();
    } catch (error) {
        return {
            url: url,
            siteName: false
        };
    }

    return {
        url: url,
        siteName: data.name
    };
}