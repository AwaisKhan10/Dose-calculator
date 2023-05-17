class ContactUs {
  String? name;
  String? email;
  String? sms;

  ContactUs({this.name, this.email, this.sms});

  toJson() {
    return {"email": this.email, "name": this.name, 'sms': this.sms};
  }
}
