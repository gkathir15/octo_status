class Maintenances {
  Page? page;
  List<ScheduledMaintenances>? scheduledMaintenances;

  Maintenances({this.page, this.scheduledMaintenances});

  Maintenances.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    if (json['scheduled_maintenances'] != null) {
      scheduledMaintenances = <ScheduledMaintenances>[];
      json['scheduled_maintenances'].forEach((v) {
        scheduledMaintenances!.add(new ScheduledMaintenances.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    if (this.scheduledMaintenances != null) {
      data['scheduled_maintenances'] =
          this.scheduledMaintenances!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Page {
  String? id;
  String? name;
  String? url;
  String? updatedAt;

  Page({this.id, this.name, this.url, this.updatedAt});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ScheduledMaintenances {
  String? createdAt;
  String? id;
  String? impact;
  List<IncidentUpdates>? incidentUpdates;
  dynamic monitoringAt;
  String? name;
  String? pageId;
  dynamic resolvedAt;
  String? scheduledFor;
  String? scheduledUntil;
  String? shortlink;
  String? status;
  String? updatedAt;

  ScheduledMaintenances(
      {this.createdAt,
        this.id,
        this.impact,
        this.incidentUpdates,
        this.monitoringAt,
        this.name,
        this.pageId,
        this.resolvedAt,
        this.scheduledFor,
        this.scheduledUntil,
        this.shortlink,
        this.status,
        this.updatedAt});

  ScheduledMaintenances.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    impact = json['impact'];
    if (json['incident_updates'] != null) {
      incidentUpdates = <IncidentUpdates>[];
      json['incident_updates'].forEach((v) {
        incidentUpdates!.add(new IncidentUpdates.fromJson(v));
      });
    }
    monitoringAt = json['monitoring_at'];
    name = json['name'];
    pageId = json['page_id'];
    resolvedAt = json['resolved_at'];
    scheduledFor = json['scheduled_for'];
    scheduledUntil = json['scheduled_until'];
    shortlink = json['shortlink'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['impact'] = this.impact;
    if (this.incidentUpdates != null) {
      data['incident_updates'] =
          this.incidentUpdates!.map((v) => v.toJson()).toList();
    }
    data['monitoring_at'] = this.monitoringAt;
    data['name'] = this.name;
    data['page_id'] = this.pageId;
    data['resolved_at'] = this.resolvedAt;
    data['scheduled_for'] = this.scheduledFor;
    data['scheduled_until'] = this.scheduledUntil;
    data['shortlink'] = this.shortlink;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class IncidentUpdates {
  String? body;
  String? createdAt;
  String? displayAt;
  String? id;
  String? incidentId;
  String? status;
  String? updatedAt;

  IncidentUpdates(
      {this.body,
        this.createdAt,
        this.displayAt,
        this.id,
        this.incidentId,
        this.status,
        this.updatedAt});

  IncidentUpdates.fromJson(Map<String, dynamic> json) {
    body = json['body'];
    createdAt = json['created_at'];
    displayAt = json['display_at'];
    id = json['id'];
    incidentId = json['incident_id'];
    status = json['status'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    data['created_at'] = this.createdAt;
    data['display_at'] = this.displayAt;
    data['id'] = this.id;
    data['incident_id'] = this.incidentId;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
