// To parse this JSON data, do
//
//     final propertyOwnerPropertiesModel = propertyOwnerPropertiesModelFromJson(jsonString);

import 'dart:convert';

ImagesDataModel ImagesDataModelFromJson(String str) =>
    ImagesDataModel.fromJson(json.decode(str));

String ImagesDataModelToJson(ImagesDataModel data) =>
    json.encode(data.toJson());

class ImagesDataModel {
  final Images images;

  ImagesDataModel({
    required this.images,
  });

  factory ImagesDataModel.fromJson(Map<String, dynamic> json) =>
      ImagesDataModel(
        images: Images.fromJson(json["IMAGES"]),
      );

  Map<String, dynamic> toJson() => {
        "IMAGES": images.toJson(),
      };
}

class Images {
  final List<ImageList> i;
  final List<Results> results;

  Images({
    required this.i,
    required this.results,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        i: List<ImageList>.from(json["I"].map((x) => ImageList.fromJson(x))),
        results:
            List<Results>.from(json["RESULTS"].map((x) => Results.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "I": List<dynamic>.from(i.map((x) => x.toJson())),
        "RESULTS": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class ImageList {
  final IClass empty;

  ImageList({
    required this.empty,
  });

  factory ImageList.fromJson(Map<String, dynamic> json) => ImageList(
        empty: IClass.fromJson(json["\u0024"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
      };
}

class IClass {
  final String id;
  final String ar;
  final String li;
  final String mr;
  final String pr;
  final String r;
  final String pixX;
  final String pixY;
  final String type;
  final String premium;
  final String caption;
  final String lc;
  final String datetaken;
  final String p;
  final String t;
  final String flp;
  final String dataco;
  final String imgseq;
  final String pseudoid;
  final DateTime uploaddate;
  final String seocontribpriority;

  IClass({
    required this.id,
    required this.ar,
    required this.li,
    required this.mr,
    required this.pr,
    required this.r,
    required this.pixX,
    required this.pixY,
    required this.type,
    required this.premium,
    required this.caption,
    required this.lc,
    required this.datetaken,
    required this.p,
    required this.t,
    required this.flp,
    required this.dataco,
    required this.imgseq,
    required this.pseudoid,
    required this.uploaddate,
    required this.seocontribpriority,
  });

  factory IClass.fromJson(Map<String, dynamic> json) => IClass(
        id: json["ID"],
        ar: json["AR"],
        li: json["LI"],
        mr: json["MR"],
        pr: json["PR"],
        r: json["R"],
        pixX: json["PIX_X"],
        pixY: json["PIX_Y"],
        type: json["TYPE"],
        premium: json["PREMIUM"],
        caption: json["CAPTION"],
        lc: json["LC"],
        datetaken: json["DATETAKEN"],
        p: json["P"],
        t: json["T"],
        flp: json["FLP"],
        dataco: json["DATACO"],
        imgseq: json["IMGSEQ"],
        pseudoid: json["pseudoid"],
        uploaddate: DateTime.parse(json["uploaddate"]),
        seocontribpriority: json["seocontribpriority"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "AR": ar,
        "LI": li,
        "MR": mr,
        "PR": pr,
        "R": r,
        "PIX_X": pixX,
        "PIX_Y": pixY,
        "TYPE": type,
        "PREMIUM": premium,
        "CAPTION": caption,
        "LC": lc,
        "DATETAKEN": datetaken,
        "P": p,
        "T": t,
        "FLP": flp,
        "DATACO": dataco,
        "IMGSEQ": imgseq,
        "pseudoid": pseudoid,
        "uploaddate": uploaddate.toIso8601String(),
        "seocontribpriority": seocontribpriority,
      };
}

class Results {
  final Result empty;

  Results({
    required this.empty,
  });

  factory Results.fromJson(Map<String, dynamic> json) => Results(
        empty: Result.fromJson(json["\u0024"]),
      );

  Map<String, dynamic> toJson() => {
        "\u0024": empty.toJson(),
      };
}

class Result {
  final String images;
  final String agencies;
  final String searchTypeSi;
  final String hardClass;
  final String collections;
  final String cds;
  final String bestof;
  final String commcount;
  final String custcount;
  final String totalagencyimages;
  final String totalphotographerimages;
  final String agencyimages;
  final String agency;
  final String st;

  Result({
    required this.images,
    required this.agencies,
    required this.searchTypeSi,
    required this.hardClass,
    required this.collections,
    required this.cds,
    required this.bestof,
    required this.commcount,
    required this.custcount,
    required this.totalagencyimages,
    required this.totalphotographerimages,
    required this.agencyimages,
    required this.agency,
    required this.st,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        images: json["IMAGES"],
        agencies: json["AGENCIES"],
        searchTypeSi: json["SEARCH_TYPE_SI"],
        hardClass: json["HARD_CLASS"],
        collections: json["COLLECTIONS"],
        cds: json["CDS"],
        bestof: json["BESTOF"],
        commcount: json["COMMCOUNT"],
        custcount: json["CUSTCOUNT"],
        totalagencyimages: json["TOTALAGENCYIMAGES"],
        totalphotographerimages: json["TOTALPHOTOGRAPHERIMAGES"],
        agencyimages: json["AGENCYIMAGES"],
        agency: json["AGENCY"],
        st: json["ST"],
      );

  Map<String, dynamic> toJson() => {
        "IMAGES": images,
        "AGENCIES": agencies,
        "SEARCH_TYPE_SI": searchTypeSi,
        "HARD_CLASS": hardClass,
        "COLLECTIONS": collections,
        "CDS": cds,
        "BESTOF": bestof,
        "COMMCOUNT": commcount,
        "CUSTCOUNT": custcount,
        "TOTALAGENCYIMAGES": totalagencyimages,
        "TOTALPHOTOGRAPHERIMAGES": totalphotographerimages,
        "AGENCYIMAGES": agencyimages,
        "AGENCY": agency,
        "ST": st,
      };
}
