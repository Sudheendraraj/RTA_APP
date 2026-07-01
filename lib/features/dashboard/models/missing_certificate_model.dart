class MissingCertificateModel {
  final String? districtName;
  final String? zoneName;
  final String? cameraId;

  final int allClearNotFound;
  final int pucCertificateNotFound;
  final int permitCertificateNotFound;
  final int registrationCertificateNotFound;
  final int roadTaxCertificateNotFound;
  final int weightCertificateNotFound;
  final int insuranceCertificateNotFound;
  final int fitnessCertificateNotFound;
  final int? vehicleCountOverride;

  MissingCertificateModel({
    this.districtName,
    this.zoneName,
    this.cameraId,
    required this.allClearNotFound,
    required this.pucCertificateNotFound,
    required this.permitCertificateNotFound,
    required this.registrationCertificateNotFound,
    required this.roadTaxCertificateNotFound,
    required this.weightCertificateNotFound,
    required this.insuranceCertificateNotFound,
    required this.fitnessCertificateNotFound,
    this.vehicleCountOverride,
  });

  factory MissingCertificateModel.fromJson(Map<String, dynamic> json) {
    return MissingCertificateModel(
      districtName: json['districtName'],
      zoneName: json['zoneName'],
      cameraId: json['cameraId'],
      allClearNotFound: json['allClearNotFound'] ?? 0,
      pucCertificateNotFound: json['pucCertificateNotFound'] ?? 0,
      permitCertificateNotFound: json['permitCertificateNotFound'] ?? 0,
      registrationCertificateNotFound:
          json['registrationCertificateNotFound'] ?? 0,
      roadTaxCertificateNotFound: json['roadTaxCertificateNotFound'] ?? 0,
      weightCertificateNotFound: json['weightCertificateNotFound'] ?? 0,
      insuranceCertificateNotFound: json['insuranceCertificateNotFound'] ?? 0,
      fitnessCertificateNotFound: json['fitnessCertificateNotFound'] ?? 0,
      vehicleCountOverride: json['vehicleCount'] is int ? json['vehicleCount'] as int : null,
    );
  }

  /// Parse the API response which may include nested arrays under `data` and
  /// a top-level `vehicleCount` value.
  factory MissingCertificateModel.fromApiResponse(Map<String, dynamic> api) {
    dynamic data = api['data'];
    Map<String, dynamic> record = {};
    if (data is List && data.isNotEmpty) {
      final first = data[0];
      if (first is List && first.isNotEmpty && first[0] is Map) {
        record = Map<String, dynamic>.from(first[0] as Map);
      } else if (first is Map) {
        record = Map<String, dynamic>.from(first);
      }
    }

    final int? vehicleCount = api['vehicleCount'] is int ? api['vehicleCount'] as int : null;

    return MissingCertificateModel(
      districtName: record['districtName'],
      zoneName: record['zoneName'],
      cameraId: record['cameraId'],
      allClearNotFound: record['allClearNotFound'] ?? 0,
      pucCertificateNotFound: record['pucCertificateNotFound'] ?? 0,
      permitCertificateNotFound: record['permitCertificateNotFound'] ?? 0,
      registrationCertificateNotFound: record['registrationCertificateNotFound'] ?? 0,
      roadTaxCertificateNotFound: record['roadTaxCertificateNotFound'] ?? 0,
      weightCertificateNotFound: record['weightCertificateNotFound'] ?? 0,
      insuranceCertificateNotFound: record['insuranceCertificateNotFound'] ?? 0,
      fitnessCertificateNotFound: record['fitnessCertificateNotFound'] ?? 0,
      vehicleCountOverride: vehicleCount,
    );
  }

    int get vehicleCount => vehicleCountOverride ?? (
      allClearNotFound +
      pucCertificateNotFound +
      permitCertificateNotFound +
      registrationCertificateNotFound +
      roadTaxCertificateNotFound +
      weightCertificateNotFound +
      insuranceCertificateNotFound +
      fitnessCertificateNotFound);
}
