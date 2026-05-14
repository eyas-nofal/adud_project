class UserModel {
  final String id;
  final String name;
  final String role; 
  final String accountType;
  
  // Stats
  final int completedActivities;
  final double rating;
  final int thisMonthActivities;
  final int receivedHelpsCount;
  final int contributionHours;
  
  // Settings & Profile
  final bool notificationsEnabled;
  final String? profilePictureUrl;

  const UserModel({
    required this.id,
    required this.name,
    required this.role,
    required this.accountType,
    this.completedActivities = 0,
    this.rating = 0.0,
    this.thisMonthActivities = 0,
    this.receivedHelpsCount = 0,
    this.contributionHours = 0,
    this.notificationsEnabled = true,
    this.profilePictureUrl,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? role,
    String? accountType,
    int? completedActivities,
    double? rating,
    int? thisMonthActivities,
    int? receivedHelpsCount,
    int? contributionHours,
    bool? notificationsEnabled,
    String? profilePictureUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      role: role ?? this.role,
      accountType: accountType ?? this.accountType,
      completedActivities: completedActivities ?? this.completedActivities,
      rating: rating ?? this.rating,
      thisMonthActivities: thisMonthActivities ?? this.thisMonthActivities,
      receivedHelpsCount: receivedHelpsCount ?? this.receivedHelpsCount,
      contributionHours: contributionHours ?? this.contributionHours,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
    );
  }

  // Factory constructor for creating a new UserModel instance from a map.
  // Useful for parsing data from Firebase Firestore.
  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      id: documentId,
      name: map['name'] ?? '',
      role: map['role'] ?? '',
      accountType: map['accountType'] ?? '',
      completedActivities: map['completedActivities']?.toInt() ?? 0,
      rating: map['rating']?.toDouble() ?? 0.0,
      thisMonthActivities: map['thisMonthActivities']?.toInt() ?? 0,
      receivedHelpsCount: map['receivedHelpsCount']?.toInt() ?? 0,
      contributionHours: map['contributionHours']?.toInt() ?? 0,
      notificationsEnabled: map['notificationsEnabled'] ?? true,
      profilePictureUrl: map['profilePictureUrl'],
    );
  }

  // Method for converting the UserModel instance into a map.
  // Useful for saving data to Firebase Firestore.
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'role': role,
      'accountType': accountType,
      'completedActivities': completedActivities,
      'rating': rating,
      'thisMonthActivities': thisMonthActivities,
      'receivedHelpsCount': receivedHelpsCount,
      'contributionHours': contributionHours,
      'notificationsEnabled': notificationsEnabled,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
