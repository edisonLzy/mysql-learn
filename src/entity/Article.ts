import { Column, Entity, JoinTable, ManyToMany, PrimaryGeneratedColumn } from "typeorm"
import { Tag } from "./Tag";

@Entity()
export class Article {

    @PrimaryGeneratedColumn()
    id: number;

    @Column({
        length: 100,
        comment: '文章标题'
    })
    title: string;

    @Column({
        type: 'text',
        comment: '文章内容'
    })
    content: string;

    // 会自动创建 Article 和 Tag 之间的关联表
    @JoinTable({
        // 指定关联表的名称
        name:'article_tag'
    })
    @ManyToMany(() => Tag)
    tags: Tag[];
}
