import 'Phone.dart';

class Published {
  Published({
      this.profilePicURL, 
      this.bio, 
      this.layout, 
      this.name, 
      this.showName, 
      this.phone, 
      this.showPhone, 
      this.email, 
      this.showEmail, 
      this.twitter, 
      this.showTwitter, 
      this.linkedin, 
      this.showLinkedin, 
      this.instagram, 
      this.showInstagram, 
      this.facebook, 
      this.showFacebook, 
      this.description, 
      this.category, 
      this.country, 
      this.industry, 
      this.executivePicURL, 
      this.executiveName, 
      this.executiveTitle, 
      this.executiveStatement, 
      this.title, 
      this.aboutUs, 
      this.themeSelected, 
      this.htmlContent, 
      this.updatedAt,});

  Published.fromJson(dynamic json) {
    profilePicURL = json['profilePicURL'];
    bio = json['bio'];
    layout = json['layout'];
    name = json['name'];
    showName = json['showName'];
    phone = json['phone'] != null ? Phone.fromJson(json['phone']) : null;
    showPhone = json['showPhone'];
    email = json['email'];
    showEmail = json['showEmail'];
    twitter = json['twitter'];
    showTwitter = json['showTwitter'];
    linkedin = json['linkedin'];
    showLinkedin = json['showLinkedin'];
    instagram = json['instagram'];
    showInstagram = json['showInstagram'];
    facebook = json['facebook'];
    showFacebook = json['showFacebook'];
    description = json['description'];
    category = json['category'];
    country = json['country'];
    industry = json['industry'];
    executivePicURL = json['executivePicURL'];
    executiveName = json['executiveName'];
    executiveTitle = json['executiveTitle'];
    executiveStatement = json['executiveStatement'];
    title = json['title'];
    aboutUs = json['aboutUs'];
    themeSelected = json['themeSelected'];
    htmlContent = json['htmlContent'];
    updatedAt = json['updatedAt'];
  }
  String? profilePicURL;
  String? bio;
  String? layout;
  String? name;
  String? showName;
  Phone? phone;
  String? showPhone;
  String? email;
  String? showEmail;
  String? twitter;
  String? showTwitter;
  String? linkedin;
  String? showLinkedin;
  String? instagram;
  String? showInstagram;
  String? facebook;
  String? showFacebook;
  String? description;
  String? category;
  String? country;
  String? industry;
  String? executivePicURL;
  String? executiveName;
  String? executiveTitle;
  String? executiveStatement;
  String? title;
  String? aboutUs;
  String? themeSelected;
  String? htmlContent;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['profilePicURL'] = profilePicURL;
    map['bio'] = bio;
    map['layout'] = layout;
    map['name'] = name;
    map['showName'] = showName;
    if (phone != null) {
      map['phone'] = phone?.toJson();
    }
    map['showPhone'] = showPhone;
    map['email'] = email;
    map['showEmail'] = showEmail;
    map['twitter'] = twitter;
    map['showTwitter'] = showTwitter;
    map['linkedin'] = linkedin;
    map['showLinkedin'] = showLinkedin;
    map['instagram'] = instagram;
    map['showInstagram'] = showInstagram;
    map['facebook'] = facebook;
    map['showFacebook'] = showFacebook;
    map['description'] = description;
    map['category'] = category;
    map['country'] = country;
    map['industry'] = industry;
    map['executivePicURL'] = executivePicURL;
    map['executiveName'] = executiveName;
    map['executiveTitle'] = executiveTitle;
    map['executiveStatement'] = executiveStatement;
    map['title'] = title;
    map['aboutUs'] = aboutUs;
    map['themeSelected'] = themeSelected;
    map['htmlContent'] = htmlContent;
    map['updatedAt'] = updatedAt;
    return map;
  }

}