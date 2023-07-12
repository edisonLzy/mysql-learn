import { createClient } from 'redis'

const client = createClient({
    socket: {
        host: 'localhost',
        port: 6379
    }
});


await client.connect();

await client.hSet('hSet', '111', 'value111');
await client.hSet('hSet', '222', 'value222');
await client.hSet('hSet', '333', 'value333');

await client.LPUSH('list3', "1")
await client.LPUSH('list3', "2")

console.log(await client.lRange('list3', 0, -1));


await client.disconnect();
