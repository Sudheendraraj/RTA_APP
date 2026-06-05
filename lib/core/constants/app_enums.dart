enum UserRole {
  superAdmin,
  rtaAdministrator,
  enforcementOfficer,
  checkpostOfficer,
  supervisor,
}

extension UserRoleExtension on UserRole {
  String get displayName {
    switch (this) {
      case UserRole.superAdmin:
        return 'Super Admin';
      case UserRole.rtaAdministrator:
        return 'RTA Administrator';
      case UserRole.enforcementOfficer:
        return 'Enforcement Officer';
      case UserRole.checkpostOfficer:
        return 'Checkpost Officer';
      case UserRole.supervisor:
        return 'Supervisor';
    }
  }
}
