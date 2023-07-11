import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm"
import { Department } from "./Department";

@Entity()
export class Employee {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({
        length: 50
    })
    name: string;

    // 在多的一方使用 @ManyToOne 装饰器
    // 创建外键约束
    @ManyToOne(() => Department)
    department: Department;
}

