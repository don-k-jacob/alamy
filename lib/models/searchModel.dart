// To parse this JSON data, do
//
//     final imageModel = imageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ImageModel imageModelFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageModelToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
    final String qt;
    final List<ImageItem> items;
    final int totalMatches;
    final String searchClassification;
    final bool isHardcodedClassification;
    final int discountCount;
    final int libraryCount;
    final int cutoutCount;
    final int vectorCount;
    final int blackAndWhiteCount;
    final String searchId;

    ImageModel({
        required this.qt,
        required this.items,
        required this.totalMatches,
        required this.searchClassification,
        required this.isHardcodedClassification,
        required this.discountCount,
        required this.libraryCount,
        required this.cutoutCount,
        required this.vectorCount,
        required this.blackAndWhiteCount,
        required this.searchId,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        qt: json["qt"],
        items: List<ImageItem>.from(json["items"].map((x) => ImageItem.fromJson(x))),
        totalMatches: json["totalMatches"],
        searchClassification: json["searchClassification"],
        isHardcodedClassification: json["isHardcodedClassification"],
        discountCount: json["discountCount"],
        libraryCount: json["libraryCount"],
        cutoutCount: json["cutoutCount"],
        vectorCount: json["vectorCount"],
        blackAndWhiteCount: json["blackAndWhiteCount"],
        searchId: json["searchId"],
    );

    Map<String, dynamic> toJson() => {
        "qt": qt,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "totalMatches": totalMatches,
        "searchClassification": searchClassification,
        "isHardcodedClassification": isHardcodedClassification,
        "discountCount": discountCount,
        "libraryCount": libraryCount,
        "cutoutCount": cutoutCount,
        "vectorCount": vectorCount,
        "blackAndWhiteCount": blackAndWhiteCount,
        "searchId": searchId,
    };
}

class ImageItem {
    final String uri;
    final String type;
    final Altids altids;
    final Pseudo pseudo;
    final String language;
    final String caption;
    final String license;
    final Renditions renditions;
    final String samePseudoCount;
    final String apaLib;
    final bool isNews;
    final String subType;
    final DateTime uploaddate;

    ImageItem({
        required this.uri,
        required this.type,
        required this.altids,
        required this.pseudo,
        required this.language,
        required this.caption,
        required this.license,
        required this.renditions,
        required this.samePseudoCount,
        required this.apaLib,
        required this.isNews,
        required this.subType,
        required this.uploaddate,
    });

    factory ImageItem.fromJson(Map<String, dynamic> json) => ImageItem(
        uri: json["uri"],
        type: json["type"],
        altids: Altids.fromJson(json["altids"]),
        pseudo: Pseudo.fromJson(json["pseudo"]),
        language: json["language"],
        caption: json["caption"],
        license: json["license"],
        renditions: Renditions.fromJson(json["renditions"]),
        samePseudoCount: json["samePseudoCount"],
        apaLib: json["apaLib"],
        isNews: json["isNews"],
        subType: json["subType"],
        uploaddate: DateTime.parse(json["uploaddate"]),
    );

    Map<String, dynamic> toJson() => {
        "uri": uri,
        "type": type,
        "altids": altids.toJson(),
        "pseudo": pseudo.toJson(),
        "language": language,
        "caption": caption,
        "license": license,
        "renditions": renditions.toJson(),
        "samePseudoCount": samePseudoCount,
        "apaLib": apaLib,
        "isNews": isNews,
        "subType": subType,
        "uploaddate": uploaddate.toIso8601String(),
    };
}

class Altids {
    final String id;
    final String seq;
    final String ref;

    Altids({
        required this.id,
        required this.seq,
        required this.ref,
    });

    factory Altids.fromJson(Map<String, dynamic> json) => Altids(
        id: json["id"],
        seq: json["seq"],
        ref: json["ref"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "seq": seq,
        "ref": ref,
    };
}

class Pseudo {
    final String id;
    final String pseudono;
    final String name;

    Pseudo({
        required this.id,
        required this.pseudono,
        required this.name,
    });

    factory Pseudo.fromJson(Map<String, dynamic> json) => Pseudo(
        id: json["id"],
        pseudono: json["pseudono"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "pseudono": pseudono,
        "name": name,
    };
}

class Renditions {
    final The450V comp;
    final The450V zoomLarge;
    final The450V the450V;
    final The450V thumb;

    Renditions({
        required this.comp,
        required this.zoomLarge,
        required this.the450V,
        required this.thumb,
    });

    factory Renditions.fromJson(Map<String, dynamic> json) => Renditions(
        comp: The450V.fromJson(json["comp"]),
        zoomLarge: The450V.fromJson(json["zoom_large"]),
        the450V: The450V.fromJson(json["450v"]),
        thumb: The450V.fromJson(json["thumb"]),
    );

    Map<String, dynamic> toJson() => {
        "comp": comp.toJson(),
        "zoom_large": zoomLarge.toJson(),
        "450v": the450V.toJson(),
        "thumb": thumb.toJson(),
    };
}

class The450V {
    final String mimetype;
    final String href;
    final int width;
    final int height;

    The450V({
        required this.mimetype,
        required this.href,
        required this.width,
        required this.height,
    });

    factory The450V.fromJson(Map<String, dynamic> json) => The450V(
        mimetype: json["mimetype"],
        href: json["href"],
        width: json["width"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "mimetype": mimetype,
        "href": href,
        "width": width,
        "height": height,
    };
}
