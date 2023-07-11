import "reflect-metadata"
import { DataSource } from "typeorm"
import { Department } from "./entity/Department"
import { Employee } from "./entity/Employee"
import { IdCard } from "./entity/IdCard"
import { User } from "./entity/User"

export const AppDataSource = new DataSource({
    // 数据库类型
    type: "mysql",
    host: "localhost",
    port: 3306,
    username: "root",
    password: "11223344",
    // 指定操作的 database
    database: "typeorm_test",
    // 同步建表，当 database 里没有和 Entity 对应的表的时候，会自动生成建表 sql 语句并执行
    // 比如当 database没有 User表的时候,会自动创建 User表
    synchronize: true,
    // 是否打印生成的 sql 语句
    logging: true,
    // 指定与数据库表对应的实体类
    entities: [User, IdCard, Department, Employee],
    migrations: [],
    // Entity 生命周期的订阅者，比如 insert、update、remove 前后，可以加入一些逻辑
    subscribers: [],
    // 指定连接池的最大连接数
    poolSize: 10,
    connectorPackage: 'mysql2',

})
