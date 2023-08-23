import puppeteer from 'puppeteer';
import axios from 'axios';
import textbelt from 'textbelt';

const url = 'https://acadinfo.wustl.edu/CourseListings/CourseInfo.aspx?sem=FL2023&sch=L&dept=L31&crs=191l';

const main = async () => {

const getPhysicsReminder = async () => {
    const browser = await puppeteer.launch(
        {
            headless: true,
        }
    );
    const page = await browser.newPage();
    await page.goto(url);
    
    const physicsReminder = await page.evaluate(() => {
        const seats = document.getElementsByClassName('ItemRowCenter')[9].innerText;
        const enrolled = document.getElementsByClassName('ItemRowCenter')[10].innerText;
        return [seats, enrolled];
    });
    
    await browser.close();
    return physicsReminder;
    }

const seats = await getPhysicsReminder().then((value) => {
    console.log(`seats ${value[0]}\nenrolled ${value[1]}`);
    return value;
});

const sendText = async (message) => {
    const response = await axios.post('https://textbelt.com/text', {
        phone: '4158700350',
        message: message,
        key: 'ba2301acc72d8f286648bc8d8e077efbd237ed5bjiP6podS5raCZ1eaQKKEbybRe',
    });
    console.log(response.data);
}

console.log(seats);
console.log(seats[0] > seats[1]);

if (seats[0] > seats[1]) {
    sendText(`There are ${seats[0] - seats[1]} seats left in Physics 191l at 9am!`);
    console.log(`There are ${seats[0] - seats[1]} seats left in Physics 191l at 9am!`);
    process.exit();
}
}

var minutes = 0.5, the_interval = minutes * 60 * 1000;

setInterval(function() {
    main();
}, the_interval);
