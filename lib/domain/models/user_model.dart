class User{
    late String name;
    late String email;
    late String phone;
    late String password;


    User(
        {required this.name,
        required this.email,
        required this.phone,
        required this.password}
    );

    Map toMap(){
        Map data = {};

        data['name'] = this.name;
        data['email'] = this.email;
        data['phone'] = this.phone;
        data['password'] = this.password;

        return data;
    }


    User.fromMap(Map data){
        this.name = data['name'];
        this.email = data['email'];
        this.phone = data['phone'];
        this.password = data['password'];
    }
}