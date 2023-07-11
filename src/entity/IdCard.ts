import { Column, Entity, JoinColumn, OneToOne, PrimaryGeneratedColumn } from "typeorm"
import { User } from "./User"

@Entity({
    name: 'id_card'
})
export class IdCard {

    @PrimaryGeneratedColumn()
    id: number

    @Column({
        length: 50,
        comment: '身份证号'
    })
    cardName: string
    
    // 指定外键列
    @JoinColumn()
    @OneToOne(()=> User, {
        // 修改当前表的时候，关联表也会跟着修改
        cascade: true,
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
    })
    user: User
}
