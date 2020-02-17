const si = require('systeminformation')
const fs = require('fs')
const path = require('path')
const execSync = require('child_process').execSync

const esc = String.fromCharCode(27)

async function runAll() {
    const info = await si.cpu()
    console.log('-'.repeat(50))
    console.log(`${info.manufacturer} ${info.brand} ${info.cores} cores @${info.speed}GHz`)
    console.log('-'.repeat(50))

    const entries = fs.readdirSync(__dirname)
        .filter(entry => !entry.match(/^\./) && fs.lstatSync(path.join(__dirname, entry)).isDirectory())
    entries.forEach(prepare)
    const results = entries.map(run).filter(a => a).sort((a, b) => a.time - b.time)
    console.log(esc + '[' + entries.length + 'A')
    results.forEach(entry => console.log(entry.info.padEnd(35) + entry.time.padStart(15)))
}

function prepare(language) {
    if (fs.existsSync(path.join(__dirname, language, 'prepare.sh'))) {
        console.log(esc + '[KCompiling ' + language + ' ...')
        execSync(path.join(__dirname, language, 'prepare.sh'))
        console.log(esc + '[A' + esc + '[K' + esc + '[A')
    }
}

function run(language) {
    if (fs.existsSync(path.join(__dirname, language, 'run.sh'))) {
        console.log('Running ' + language + ' ...')
        const result = execSync(path.join(__dirname, language, 'run.sh')).toString().split('\n').filter(line => line.match('Elapsed')).pop()
        const components = result.split(' ')
        const time = '' + parseFloat(components.pop()).toFixed(3)
        const info = components.filter(word => word !== 'Elapsed').join(' ')
        console.log(esc + '[A' + info.padEnd(35) + time.padStart(15))
        return {info, time}
    }
}

runAll()
