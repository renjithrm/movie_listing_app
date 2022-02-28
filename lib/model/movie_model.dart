// To parse this JSON data, do
//
//     final MovieModel = trendingMoviesFromJson(jsonString);

import 'dart:convert';

List<MovieModel> movieModelFromJson(String str) =>
    List<MovieModel>.from(json.decode(str).map((x) => MovieModel.fromJson(x)));

String movieModelToJson(List<MovieModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MovieModel {
  MovieModel({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  int? id;
  String? url;
  String? name;
  Type? type;
  Language? language;
  List<Genre>? genres;
  Status? status;
  int? runtime;
  int? averageRuntime;
  DateTime? premiered;
  DateTime? ended;
  String? officialSite;
  Schedule? schedule;
  Rating? rating;
  int? weight;
  Network? network;
  Network? webChannel;
  Country? dvdCountry;
  Externals? externals;
  Image? image;
  String? summary;
  int? updated;
  Links? links;

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"] == null ? null : json["id"],
        url: json["url"] == null ? null : json["url"],
        name: json["name"] == null ? null : json["name"],
        type: json["type"] == null ? null : typeValues.map![json["type"]],
        language: json["language"] == null
            ? null
            : languageValues.map![json["language"]],
        genres: json["genres"] == null
            ? null
            : List<Genre>.from(json["genres"].map((x) => genreValues.map![x])),
        status:
            json["status"] == null ? null : statusValues.map![json["status"]],
        runtime: json["runtime"] == null ? null : json["runtime"],
        averageRuntime:
            json["averageRuntime"] == null ? null : json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite:
            json["officialSite"] == null ? null : json["officialSite"],
        schedule: json["schedule"] == null
            ? null
            : Schedule.fromJson(json["schedule"]),
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        weight: json["weight"] == null ? null : json["weight"],
        network:
            json["network"] == null ? null : Network.fromJson(json["network"]),
        webChannel: json["webChannel"] == null
            ? null
            : Network.fromJson(json["webChannel"]),
        dvdCountry: json["dvdCountry"] == null
            ? null
            : Country.fromJson(json["dvdCountry"]),
        externals: json["externals"] == null
            ? null
            : Externals.fromJson(json["externals"]),
        image: json["image"] == null ? null : Image.fromJson(json["image"]),
        summary: json["summary"] == null ? null : json["summary"],
        updated: json["updated"] == null ? null : json["updated"],
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "url": url == null ? null : url,
        "name": name == null ? null : name,
        "type": type == null ? null : typeValues.reverse![type],
        "language": language == null ? null : languageValues.reverse![language],
        "genres": genres == null
            ? null
            : List<dynamic>.from(genres!.map((x) => genreValues.reverse![x])),
        "status": status == null ? null : statusValues.reverse![status],
        "runtime": runtime == null ? null : runtime,
        "averageRuntime": averageRuntime == null ? null : averageRuntime,
        "premiered": premiered == null
            ? null
            : "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended": ended == null
            ? null
            : "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite == null ? null : officialSite,
        "schedule": schedule == null ? null : schedule!.toJson(),
        "rating": rating == null ? null : rating!.toJson(),
        "weight": weight == null ? null : weight,
        "network": network == null ? null : network!.toJson(),
        "webChannel": webChannel == null ? null : webChannel!.toJson(),
        "dvdCountry": dvdCountry == null ? null : dvdCountry!.toJson(),
        "externals": externals == null ? null : externals!.toJson(),
        "image": image == null ? null : image!.toJson(),
        "summary": summary == null ? null : summary,
        "updated": updated == null ? null : updated,
        "_links": links == null ? null : links!.toJson(),
      };
}

class Country {
  Country({
    this.name,
    this.code,
    this.timezone,
  });

  Name? name;
  Code? code;
  Timezone? timezone;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: json["name"] == null ? null : nameValues.map![json["name"]],
        code: json["code"] == null ? null : codeValues.map![json["code"]],
        timezone: json["timezone"] == null
            ? null
            : timezoneValues.map![json["timezone"]],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : nameValues.reverse![name],
        "code": code == null ? null : codeValues.reverse![code],
        "timezone": timezone == null ? null : timezoneValues.reverse![timezone],
      };
}

enum Code { US, CA, JP, GB, FR, DE }

final codeValues = EnumValues({
  "CA": Code.CA,
  "DE": Code.DE,
  "FR": Code.FR,
  "GB": Code.GB,
  "JP": Code.JP,
  "US": Code.US
});

enum Name { UNITED_STATES, CANADA, JAPAN, UNITED_KINGDOM, FRANCE, GERMANY }

final nameValues = EnumValues({
  "Canada": Name.CANADA,
  "France": Name.FRANCE,
  "Germany": Name.GERMANY,
  "Japan": Name.JAPAN,
  "United Kingdom": Name.UNITED_KINGDOM,
  "United States": Name.UNITED_STATES
});

enum Timezone {
  AMERICA_NEW_YORK,
  AMERICA_HALIFAX,
  ASIA_TOKYO,
  EUROPE_LONDON,
  EUROPE_PARIS,
  EUROPE_BUSINGEN
}

final timezoneValues = EnumValues({
  "America/Halifax": Timezone.AMERICA_HALIFAX,
  "America/New_York": Timezone.AMERICA_NEW_YORK,
  "Asia/Tokyo": Timezone.ASIA_TOKYO,
  "Europe/Busingen": Timezone.EUROPE_BUSINGEN,
  "Europe/London": Timezone.EUROPE_LONDON,
  "Europe/Paris": Timezone.EUROPE_PARIS
});

class Externals {
  Externals({
    this.tvrage,
    this.thetvdb,
    this.imdb,
  });

  int? tvrage;
  int? thetvdb;
  String? imdb;

  factory Externals.fromJson(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"] == null ? null : json["tvrage"],
        thetvdb: json["thetvdb"] == null ? null : json["thetvdb"],
        imdb: json["imdb"] == null ? null : json["imdb"],
      );

  Map<String, dynamic> toJson() => {
        "tvrage": tvrage == null ? null : tvrage,
        "thetvdb": thetvdb == null ? null : thetvdb,
        "imdb": imdb == null ? null : imdb,
      };
}

enum Genre {
  DRAMA,
  SCIENCE_FICTION,
  THRILLER,
  ACTION,
  CRIME,
  HORROR,
  ROMANCE,
  ADVENTURE,
  ESPIONAGE,
  MUSIC,
  MYSTERY,
  SUPERNATURAL,
  FANTASY,
  FAMILY,
  ANIME,
  COMEDY,
  HISTORY,
  MEDICAL,
  LEGAL,
  WESTERN,
  WAR,
  SPORTS
}

final genreValues = EnumValues({
  "Action": Genre.ACTION,
  "Adventure": Genre.ADVENTURE,
  "Anime": Genre.ANIME,
  "Comedy": Genre.COMEDY,
  "Crime": Genre.CRIME,
  "Drama": Genre.DRAMA,
  "Espionage": Genre.ESPIONAGE,
  "Family": Genre.FAMILY,
  "Fantasy": Genre.FANTASY,
  "History": Genre.HISTORY,
  "Horror": Genre.HORROR,
  "Legal": Genre.LEGAL,
  "Medical": Genre.MEDICAL,
  "Music": Genre.MUSIC,
  "Mystery": Genre.MYSTERY,
  "Romance": Genre.ROMANCE,
  "Science-Fiction": Genre.SCIENCE_FICTION,
  "Sports": Genre.SPORTS,
  "Supernatural": Genre.SUPERNATURAL,
  "Thriller": Genre.THRILLER,
  "War": Genre.WAR,
  "Western": Genre.WESTERN
});

class Image {
  Image({
    this.medium,
    this.original,
  });

  String? medium;
  String? original;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        medium: json["medium"] == null ? null : json["medium"],
        original: json["original"] == null ? null : json["original"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium == null ? null : medium,
        "original": original == null ? null : original,
      };
}

enum Language { ENGLISH, JAPANESE }

final languageValues =
    EnumValues({"English": Language.ENGLISH, "Japanese": Language.JAPANESE});

class Links {
  Links({
    this.self,
    this.previousepisode,
    this.nextepisode,
  });

  Nextepisode? self;
  Nextepisode? previousepisode;
  Nextepisode? nextepisode;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null ? null : Nextepisode.fromJson(json["self"]),
        previousepisode: json["previousepisode"] == null
            ? null
            : Nextepisode.fromJson(json["previousepisode"]),
        nextepisode: json["nextepisode"] == null
            ? null
            : Nextepisode.fromJson(json["nextepisode"]),
      );

  Map<String, dynamic> toJson() => {
        "self": self == null ? null : self!.toJson(),
        "previousepisode":
            previousepisode == null ? null : previousepisode!.toJson(),
        "nextepisode": nextepisode == null ? null : nextepisode!.toJson(),
      };
}

class Nextepisode {
  Nextepisode({
    this.href,
  });

  String? href;

  factory Nextepisode.fromJson(Map<String, dynamic> json) => Nextepisode(
        href: json["href"] == null ? null : json["href"],
      );

  Map<String, dynamic> toJson() => {
        "href": href == null ? null : href,
      };
}

class Network {
  Network({
    this.id,
    this.name,
    this.country,
    this.officialSite,
  });

  int? id;
  String? name;
  Country? country;
  String? officialSite;

  factory Network.fromJson(Map<String, dynamic> json) => Network(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        country:
            json["country"] == null ? null : Country.fromJson(json["country"]),
        officialSite:
            json["officialSite"] == null ? null : json["officialSite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "country": country == null ? null : country!.toJson(),
        "officialSite": officialSite == null ? null : officialSite,
      };
}

class Rating {
  Rating({
    this.average,
  });

  double? average;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        average: json["average"] == null ? null : json["average"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "average": average == null ? null : average,
      };
}

class Schedule {
  Schedule({
    this.time,
    this.days,
  });

  Time? time;
  List<Day>? days;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        time: json["time"] == null ? null : timeValues.map![json["time"]],
        days: json["days"] == null
            ? null
            : List<Day>.from(json["days"].map((x) => dayValues.map![x])),
      );

  Map<String, dynamic> toJson() => {
        "time": time == null ? null : timeValues.reverse![time],
        "days": days == null
            ? null
            : List<dynamic>.from(days!.map((x) => dayValues.reverse![x])),
      };
}

enum Day { THURSDAY, TUESDAY, FRIDAY, SUNDAY, WEDNESDAY, SATURDAY, MONDAY }

final dayValues = EnumValues({
  "Friday": Day.FRIDAY,
  "Monday": Day.MONDAY,
  "Saturday": Day.SATURDAY,
  "Sunday": Day.SUNDAY,
  "Thursday": Day.THURSDAY,
  "Tuesday": Day.TUESDAY,
  "Wednesday": Day.WEDNESDAY
});

enum Time {
  THE_2200,
  THE_2100,
  THE_2000,
  EMPTY,
  THE_1200,
  THE_2130,
  THE_1300,
  THE_2030,
  THE_0900,
  THE_2230,
  THE_2300,
  THE_2330
}

final timeValues = EnumValues({
  "": Time.EMPTY,
  "09:00": Time.THE_0900,
  "12:00": Time.THE_1200,
  "13:00": Time.THE_1300,
  "20:00": Time.THE_2000,
  "20:30": Time.THE_2030,
  "21:00": Time.THE_2100,
  "21:30": Time.THE_2130,
  "22:00": Time.THE_2200,
  "22:30": Time.THE_2230,
  "23:00": Time.THE_2300,
  "23:30": Time.THE_2330
});

enum Status { ENDED, RUNNING, TO_BE_DETERMINED }

final statusValues = EnumValues({
  "Ended": Status.ENDED,
  "Running": Status.RUNNING,
  "To Be Determined": Status.TO_BE_DETERMINED
});

enum Type { SCRIPTED, REALITY, ANIMATION, TALK_SHOW, DOCUMENTARY }

final typeValues = EnumValues({
  "Animation": Type.ANIMATION,
  "Documentary": Type.DOCUMENTARY,
  "Reality": Type.REALITY,
  "Scripted": Type.SCRIPTED,
  "Talk Show": Type.TALK_SHOW
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
