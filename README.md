![](https://img.shields.io/badge/Microverse-blueviolet)

# Book.it

The Book.it API is the back-end service for the Book.it application. It makes use of the Ruby on Rails framework, PostgreSQL, and offers full user authentication and authorization capabilities to provide the Book.it app the necessary endpoints. It contains the data for booking vehicles and users' reservations for the individual user as well as admins.

## API documentation
Access the live service [here](https://bookit-api-be.herokuapp.com)

## Kanban board
[Kanban link](https://github.com/users/Danie12345/projects/4/views/1)
- Initial state
![initial screenshot](https://user-images.githubusercontent.com/35552263/190486489-5c7e34a5-5727-44b7-9e57-5fa7a435fd21.png)
-Final state
![final screenshot](https://user-images.githubusercontent.com/98142626/193120741-65875a3e-4105-4ab9-bb20-cb15214653fa.png)

## Built With

- Ruby on Rails
- JWT
- CanCanCan
- Bullet
- Devise

## Getting Started

Setting up this project locally:
## Prerequisites
#### On your terminal:
- Clone this repository to your computer: git clone git@github.com:Danie12345/bookit-api-be.git.
- Open the project on your code editor: "cd bookit-api-be" and "code ."
- Install gems: bundle install.
- Rename ".env-example" to ".env" and set up your environment.
  ```
  DEVISE_JWT_SECRET_KEY=your_secret_key
  DATABASE_USER=postgres
  DATABASE_PASSWORD=yourpassword
  DATABASE_HOST=localhost
  POSTGRES_TEST_DB=bookit_test_db
  POSTGRES_DEV_DB=bookit_dev_db
  UPLOADCARE_PRIVATE_KEY=47cfa58eb55015105779
  ```
- Run `rails db:create` to create the database
- Run `rails db:migrate` to create the tables
- Run `rails s` and go to `http://127.0.0.1:4000`.



- Setup the front end repo with [this link](https://github.com/Danie12345/bookit-fe).

## Authors
Group of 5 members:

👤 **Emilia Zambrano**

- GitHub: [@emiliazm](https://github.com/emiliazm)
- Twitter: [@emilia_zm](https://twitter.com/emilia_zm)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/emilia-zambrano-montero-aa30a611b/)

👤 **Daniel Malo**

- GitHub: [@Danie12345](https://github.com/Danie12345)
- Twitter: [@DanielMalo_v4](https://twitter.com/DanielMalo_v4)
- LinkedIn: [Daniel Malo](https://linkedin.com/in/daniel-malo)

👤 **Joshua Ivie**

- GitHub: [@joshuaivie](https://github.com/joshuaivie)
- Twitter: [@joshuaivie\_](https://twitter.com/joshuaivie_)
- LinkedIn: [joshuaivie](https://linkedin.com/in/joshuaivie)

👤 **Juan Luis Palacios**

- GitHub: [@JuanLPalacios](https://github.com/JuanLPalacios)
- Twitter: [@JuanLuisPalac20](https://twitter.com/twitterhandle)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juan-luis-palacios-p%C3%A9rez-95b39a228/)

👤 **Adaobi Vivian Okoye**

- GitHub: [@githubhandle](https://github.com/adanzeakonobi) 
- Twitter: [@twitterhandle](https://twitter.com/Adaebubemmuta)
- LinkedIn: [LinkedIn](https://linkedin.com/in/okoyeaadaobi)


## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Danie12345/bookit-api-be/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

- This project is [MIT](LICENSE) licensed.
