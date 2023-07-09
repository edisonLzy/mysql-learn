import { In } from "typeorm"
import { AppDataSource } from "./data-source"
import { User } from "./entity/User"

AppDataSource.initialize().then(async () => {

    console.log("Inserting a new user into the database...")

    await AppDataSource.manager.save(User, [
        { id: 2, firstName: 'ccc111', lastName: 'ccc', age: 21 },
        { id: 3, firstName: 'ddd222', lastName: 'ddd', age: 22 },
        { id: 4, firstName: 'eee333', lastName: 'eee', age: 23 },
        { id: 5, firstName: 'eee444', lastName: 'jjj', age: 20 },
    ])

    // queryBuilder 通常用于 多个 Entity 的关联查询
    const queryBuilder = await AppDataSource.manager.createQueryBuilder();

    const user = await queryBuilder.select("user")
        .from(User, "user")
        // :age 为参数
        .where("user.age = :age", { age: 21 })
        .getOne();

    console.log(user);

    // 事务
    await AppDataSource.manager.transaction(async manager => {

        await manager.save(User, { id: 6, firstName: 'fff', lastName: 'fff', age: 24 })
        const user = await manager.findOne(User, {
            where: {
               age: 24
            }
        })
        console.log(user);
        
    })

    // getRepository 简化 用于 单个 Entity 的查询
    // 即后续方法 不用指定 Entity了
    const usersInUser = await AppDataSource.manager.getRepository(User).find({
        where: {
            age: In([21, 24])
        }
    })
    console.log(usersInUser);
    


}).catch(error => console.log(error))
