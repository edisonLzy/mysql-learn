import { AppDataSource } from "./data-source"
import { IdCard } from "./entity/IdCard"
import { User } from "./entity/User"

AppDataSource.initialize().then(async () => {

    const user = new User()
    user.firstName = '张'
    user.lastName = '三'
    user.age = 18

    const idCard = new IdCard()
    idCard.cardName = '123456789012345678' 
    idCard.user = user
    
    // 这里不用单独save user, 因为 IdCard's user自动设置了 cascade: true.
    // await AppDataSource.manager.save(user)
    await AppDataSource.manager.save(idCard)

    const users = await AppDataSource.manager.find(User, {
        relations: {
           idCard: true
        }
    });

    console.log(users);
    

    
}).catch(error => console.log(error))
