import { In } from "typeorm"
import { AppDataSource } from "./data-source"
import { User } from "./entity/User"

AppDataSource.initialize().then(async () => {

    console.log("Inserting a new user into the database...")
    // 批量插入或修改
    // save 方法会先查询一次数据库来确定是插入还是修改
    await AppDataSource.manager.save(User, [
        { id: 2 ,firstName: 'ccc111', lastName: 'ccc', age: 21},
        { id: 3 ,firstName: 'ddd222', lastName: 'ddd', age: 22},
        { id: 4, firstName: 'eee333', lastName: 'eee', age: 23},
        { id: 5, firstName: 'eee444', lastName: 'jjj', age: 20},
    ])
    // 删除/批量删除 直接传入 id
    await AppDataSource.manager.delete(User, { id: 1 });
    await AppDataSource.manager.delete(User, [2,3]);
    // remove 直接传入 entity实例
    /** await AppDataSource.manager.delete(User, user);  */

    // 查询 / 条件查询 / 查询一条数据 / 执行原生sql
    const users = await AppDataSource.manager.find(User)
    console.log("Loaded users: ", users)
    const usersByAge = await AppDataSource.manager.findBy(User, {
        age: 20
    });
    console.log('findBy age',usersByAge);
    const user = await await AppDataSource.manager.findOne(User, {
        select: {
            firstName: true,
            age: true
        },
        where: {
            // 指定集合查询
            id: In([4])
        },
        order: {
            age: 'ASC'
        }
    });
    console.log('findOne',user);
    const usersSql = await AppDataSource.manager.query('select * from user where age in(?, ?)', [21, 23]);
    console.log('sql',usersSql);

    // 计数: count / findAndCount
    const usersCount = await AppDataSource.manager.count(User);
    console.log('count',usersCount);
    const usersCountByAge = await AppDataSource.manager.countBy(User, {
        age: 20
    });
    console.log('usersCountByAge',usersCountByAge);
    

}).catch(error => console.log(error))
