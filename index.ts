import { Redis } from 'ioredis'

const redis = new Redis()

console.log(await redis.keys('*'));

console.log(await redis.lrange('list3',0,-1));

// redis包中的方法只能push字符串
// ioredis 可以是数字
redis.lpush('list3',1,2,3,4,5,6,7,8,9,10)

console.log(await redis.lrange('list3',0,-1));


console.log(await redis.llen('list3'));
