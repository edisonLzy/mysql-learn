import { Entity, PrimaryGeneratedColumn, Column } from "typeorm"

// mysql's schema -> ORM's entity
@Entity({
    // 指定表名
    name: 'user'
})
export class User {

    @PrimaryGeneratedColumn()
    id: number

    @Column()
    firstName: string

    @Column({
        type:'varchar',
        // 指定字符串长度 -> varchar(10)
        length: 10
    })
    lastName: string

    @Column({
        comment:'年龄',
        nullable: false,
        default: 19
    })
    // 默认 number 会映射成 INT 类型
    age: number

}
