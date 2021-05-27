class SummaryModel {
  Page page;
  List<Components> components;
  List<Incidents> incidents;
  List<ScheduledMaintenances> scheduledMaintenances;
  Status status;

  SummaryModel(
      {this.page,
        this.components,
        this.incidents,
        this.scheduledMaintenances,
        this.status});

  SummaryModel.fromJson(Map<String, dynamic> json) {
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components.add(new Components.fromJson(v));
      });
    }
    if (json['incidents'] != null) {
      incidents = <Incidents>[];
      json['incidents'].forEach((v) {
        incidents.add(new Incidents.fromJson(v));
      });
    }
    if (json['scheduled_maintenances'] != null) {
      scheduledMaintenances = <ScheduledMaintenances>[];
      json['scheduled_maintenances'].forEach((v) {
        scheduledMaintenances.add(new ScheduledMaintenances.fromJson(v));
      });
    }
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    if (this.components != null) {
      data['components'] = this.components.map((v) => v.toJson()).toList();
    }
    if (this.incidents != null) {
      data['incidents'] = this.incidents.map((v) => v.toJson()).toList();
    }
    if (this.scheduledMaintenances != null) {
      data['scheduled_maintenances'] =
          this.scheduledMaintenances.map((v) => v.toJson()).toList();
    }
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    return data;
  }
}

class Page {
  String id;
  String name;
  String url;
  String timeZone;
  String updatedAt;

  Page({this.id, this.name, this.url, this.timeZone, this.updatedAt});

  Page.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    timeZone = json['time_zone'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    data['time_zone'] = this.timeZone;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Components {
  String id;
  String name;
  String status;
  String createdAt;
  String updatedAt;
  int position;
  String description;
  bool showcase;
  String startDate;
  String groupId;
  String pageId;
  bool group;
  bool onlyShowIfDegraded;

  Components(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.position,
        this.description,
        this.showcase,
        this.startDate,
        this.groupId,
        this.pageId,
        this.group,
        this.onlyShowIfDegraded});

  Components.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    position = json['position'];
    description = json['description'];
    showcase = json['showcase'];
    startDate = json['start_date'];
    groupId = json['group_id'];
    pageId = json['page_id'];
    group = json['group'];
    onlyShowIfDegraded = json['only_show_if_degraded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['position'] = this.position;
    data['description'] = this.description;
    data['showcase'] = this.showcase;
    data['start_date'] = this.startDate;
    data['group_id'] = this.groupId;
    data['page_id'] = this.pageId;
    data['group'] = this.group;
    data['only_show_if_degraded'] = this.onlyShowIfDegraded;
    return data;
  }
}

class ScheduledMaintenances {
  String id;
  String name;
  String status;
  String createdAt;
  String updatedAt;
  String monitoringAt;
  String resolvedAt;
  String impact;
  String shortlink;
  String startedAt;
  String pageId;
  List<IncidentUpdates> incidentUpdates;
  List<Components> components;
  String scheduledFor;
  String scheduledUntil;

  ScheduledMaintenances(
      {this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.monitoringAt,
        this.resolvedAt,
        this.impact,
        this.shortlink,
        this.startedAt,
        this.pageId,
        this.incidentUpdates,
        this.components,
        this.scheduledFor,
        this.scheduledUntil});

  ScheduledMaintenances.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    monitoringAt = json['monitoring_at'];
    resolvedAt = json['resolved_at'];
    impact = json['impact'];
    shortlink = json['shortlink'];
    startedAt = json['started_at'];
    pageId = json['page_id'];
    if (json['incident_updates'] != null) {
      incidentUpdates = <IncidentUpdates>[];
      json['incident_updates'].forEach((v) {
        incidentUpdates.add(new IncidentUpdates.fromJson(v));
      });
    }
    if (json['components'] != null) {
      components = <Components>[];
      json['components'].forEach((v) {
        components.add(new Components.fromJson(v));
      });
    }
    scheduledFor = json['scheduled_for'];
    scheduledUntil = json['scheduled_until'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['monitoring_at'] = this.monitoringAt;
    data['resolved_at'] = this.resolvedAt;
    data['impact'] = this.impact;
    data['shortlink'] = this.shortlink;
    data['started_at'] = this.startedAt;
    data['page_id'] = this.pageId;
    if (this.incidentUpdates != null) {
      data['incident_updates'] =
          this.incidentUpdates.map((v) => v.toJson()).toList();
    }
    if (this.components != null) {
      data['components'] = this.components.map((v) => v.toJson()).toList();
    }
    data['scheduled_for'] = this.scheduledFor;
    data['scheduled_until'] = this.scheduledUntil;
    return data;
  }
}

class IncidentUpdates {
  String id;
  String status;
  String body;
  String incidentId;
  String createdAt;
  String updatedAt;
  String displayAt;
  List<AffectedComponents> affectedComponents;
  bool deliverNotifications;
  String customTweet;
  String tweetId;

  IncidentUpdates(
      {this.id,
        this.status,
        this.body,
        this.incidentId,
        this.createdAt,
        this.updatedAt,
        this.displayAt,
        this.affectedComponents,
        this.deliverNotifications,
        this.customTweet,
        this.tweetId});

  IncidentUpdates.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    body = json['body'];
    incidentId = json['incident_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    displayAt = json['display_at'];
    if (json['affected_components'] != null) {
      affectedComponents = <AffectedComponents>[];
      json['affected_components'].forEach((v) {
        affectedComponents.add(new AffectedComponents.fromJson(v));
      });
    }
    deliverNotifications = json['deliver_notifications'];
    customTweet = json['custom_tweet'];
    tweetId = json['tweet_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['body'] = this.body;
    data['incident_id'] = this.incidentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['display_at'] = this.displayAt;
    if (this.affectedComponents != null) {
      data['affected_components'] =
          this.affectedComponents.map((v) => v.toJson()).toList();
    }
    data['deliver_notifications'] = this.deliverNotifications;
    data['custom_tweet'] = this.customTweet;
    data['tweet_id'] = this.tweetId;
    return data;
  }
}

class AffectedComponents {
  String code;
  String name;
  String oldStatus;
  String newStatus;

  AffectedComponents({this.code, this.name, this.oldStatus, this.newStatus});

  AffectedComponents.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    oldStatus = json['old_status'];
    newStatus = json['new_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['old_status'] = this.oldStatus;
    data['new_status'] = this.newStatus;
    return data;
  }
}

class Status {
  String indicator;
  String description;

  Status({this.indicator, this.description});

  Status.fromJson(Map<String, dynamic> json) {
    indicator = json['indicator'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['indicator'] = this.indicator;
    data['description'] = this.description;
    return data;
  }
}

class Incidents {
  String createdAt;
  String id;
  String impact;
  List<IncidentUpdates> incidentUpdates;
  Null monitoringAt;
  String name;
  String pageId;
  Null resolvedAt;
  String shortlink;
  String status;
  String updatedAt;

  Incidents(
      {this.createdAt,
        this.id,
        this.impact,
        this.incidentUpdates,
        this.monitoringAt,
        this.name,
        this.pageId,
        this.resolvedAt,
        this.shortlink,
        this.status,
        this.updatedAt});

  Incidents.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    id = json['id'];
    impact = json['impact'];
    if (json['incident_updates'] != null) {
      incidentUpdates = <IncidentUpdates>[];
      json['incident_updates'].forEach((v) {
        incidentUpdates.add(new IncidentUpdates.fromJson(v));
      });
    }
    monitoringAt = json['monitoring_at'];
    name = json['name'];
    pageId = json['page_id'];
    resolvedAt = json['resolved_at'];
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
          this.incidentUpdates.map((v) => v.toJson()).toList();
    }
    data['monitoring_at'] = this.monitoringAt;
    data['name'] = this.name;
    data['page_id'] = this.pageId;
    data['resolved_at'] = this.resolvedAt;
    data['shortlink'] = this.shortlink;
    data['status'] = this.status;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


